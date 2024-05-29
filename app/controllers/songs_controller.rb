class SongsController < ApplicationController
  before_action :authenticate_user! , only: %i[show edit update destroy]
  before_action :set_song, only: %i[ show edit update destroy ]
  before_action :set_search

  
  # GET /songs or /songs.json
  def index
    @q = Song.ransack(params[:q])
    @song = @q.result(distinct: true).includes(:tags).where(published:true)
  end



  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = current_user.songs.build
  end

  # GET /songs/1/edit
  def edit
    
  end

  # POST /songs or /songs.json
  def create
    @song = current_user.songs.build(song_params)

    @song.published = params[:song][:published] == '1'


    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end


  def search
    @q = Song.ransack(params[:q])
    @song = @q.result(distinct: true)
    render :index
  end

  def publish
  @song = current_user.songs.find(params[:id])
  @song.update(published: true)
  redirect_to songs_path, notice: 'Song published successfully.'
  end


  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song = Song.find(params[:id])

    @song.taggings.destroy_all
    
    @song.destroy
  
    # Destroy associated rich text content
    
    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_description }
    end
  end
    


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :description, :published, :album_id , :all_tags , :audio , :profile_image)
    end

    def set_search
      @q = Song.ransack(params[:q])
    end
end
