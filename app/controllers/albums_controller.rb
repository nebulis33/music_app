class AlbumsController < ApplicationController

    def new
        @band = Band.find(params[:band_id])
        @album = Album.find_by(band_id: params[:band_id])
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            flash[:success] = "The album has been saved"
            redirect_to album_url(@album)
        else
            flash.now[:error] = @album.errors.full_messages
            render 'new'
        end
    end

    def show
        @album = Album.find(params[:id])
    end

    def edit
        @album = Album.includes(:band).find(params[:id])
    end

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            flash[:success] = "Album successfully updated."
            redirect_to album_url(@album)
        else
            flash.now[:error] = @album.errors.full_messages
            render 'edit'
        end
    end

    def destroy
        @album = Album.find(params[:id])
        if @album.destroy
            flash[:success] = "Succesfully deleted #{@album.title}"
            redirect_to band_url(@album.band)
        else
            flash.now[:error] = @album.errors.full_messages
        end
    end

    private

        def album_params
            params.require(:album).permit(:title, :year, :recording_type, :band_id)
        end

end
