class SongsController < ApplicationController
  before_action :authenticate_user! , only: %i[show edit update destroy]
  before_action :set_song, only: %i[ show edit update destroy ]
  before_action :set_search

  # GET /albums or /albums.json
  def index
    @q = Song.ransack(params[:q])
    @songs = @q.result(distinct: true).includes(:tags).where(published:true) # Include associated tags to avoid N+1 queries
  end


  def new
    @song = current_user.songs.build
  end

  # GET /albums/1 or /albums/1.json
  def show
  end

  # GET /albums/new


  # GET /albums/1/edit
  def edit

  end

  # POST /albums or /albums.json
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
    @songs = @q.result(distinct: true)
    render :index
  end

  def publish
    @song = current_user.songs.find(params[:id])
    @song.update(published: true)
    redirect_to songs_path, notice: 'Song published successfully.'
  end


  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    respond_to do |format|
      if @song.update(album_params)
        format.html { redirect_to song_url(@song), notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
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
    params.require(:song).permit(:title, :description, :published, :all_tags , :audio , :profile_image)
  end

  def set_search
    @q = Song.ransack(params[:q])
  end
end