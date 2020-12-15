class TracksController < ApplicationController
  before_action :require_logged_in!
  def new
    @album = Album.find(params[:album_id])
    @track = Track.find_by(album_id: params[:album_id])
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:success] = "The track has been saved"
      redirect_to track_url(@track)
    else
      flash.now[:error] = @track.errors.full_messages
      render 'new'
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      flash[:success] = "track successfully updated."
      redirect_to track_url(@track)
    else
      flash.now[:error] = @track.errors.full_messages
      render 'edit'
    end
  end

  def show
    @track = Track.includes(:notes).find(params[:id])
  end

  def destroy
    @track = Track.find(params[:id])
    if @track.destroy
      flash[:success] = "Succesfully deleted #{@track.title}"
      redirect_to album_url(@track.album)
    else
      flash.now[:error] = @track.errors.full_messages
    end
  end


  private

    def track_params
      params.require(:track).permit(:album_id, :title, :ord, :lyrics, :regular)
    end
end
