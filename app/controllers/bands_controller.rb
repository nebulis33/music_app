class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:error] = @band.errors.full_messages
      render 'new'
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      flash[:success] = "Update succesful."
      redirect_to band_url(@band)
    else
      flash.now[:error] = @band.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      flash[:success] = "The band \"#{@band.name}\" was sucessfuly deleted."
      redirect_to bands_url
    end
  end

  private

    def band_params
      params.require(:band).permit(:name)
    end
end
