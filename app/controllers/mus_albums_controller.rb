class MusAlbumsController < ApplicationController
  before_action :set_mus_album, only: %i[ show edit update destroy ]

  # GET /mus_albums or /mus_albums.json
  def index
    @q = MusAlbum.ransack(params[:q])
    @mus_album = @q.result(distinct: true).where(published: true)
  end

  # GET /mus_albums/1 or /mus_albums/1.json
  def show
  end

  # GET /mus_albums/new
  def new
    @mus_album = current_user.mus_albums.build
  end

  # GET /mus_albums/1/edit
  def edit
  end

  # POST /mus_albums or /mus_albums.json
  def create
    @mus_album = current_user.mus_albums.build(mus_album_params)
    @mus_album.published = params[:mus_album][:published] == '1'

    respond_to do |format|
      if @mus_album.save
        format.html { redirect_to mus_album_url(@mus_album), notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @mus_album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mus_album.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    @mus_album = current_user.mus_albums.find(params[:id])
    @mus_album.update(published: true)
    redirect_to mus_albums_path, notice: 'Album published successfully.'
  end

  # PATCH/PUT /mus_albums/1 or /mus_albums/1.json
  def update
    respond_to do |format|
      if @mus_album.update(mus_album_params)
        format.html { redirect_to mus_album_url(@mus_album), notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @mus_album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mus_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mus_albums/1 or /mus_albums/1.json
  def destroy
    @mus_album = MusAlbum.find(params[:id])

    @mus_album.destroy

    # Destroy associated rich text content

    respond_to do |format|
      format.html { redirect_to mus_albums_url, notice: "Album was successfully destroyed." }
      format.json { head :no_description }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_mus_album
    @mus_album = MusAlbum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mus_album_params
    params.require(:mus_album).permit(:title, :description, :all_tags_album)
  end
end