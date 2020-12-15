class NotesController < ApplicationController
    before_action :require_logged_in!
    def create
        @note = current_user.notes.new(note_params)
        if @note.save
            flash[:success] = "Note posted."
            redirect_to track_url(@note.track_id)
        else
            flash[:error] = @note.errors.full_messages
            redirect_to track_url(@note.track_id)
        end
    end

    def destroy
        @note = Note.find(params[:id])
        if @note.user_id == current_user.id
            @note.destroy
        else
            render plain: '403 Forbidden', status: 403
        end
    end

    private

        def note_params
            params.require(:note).permit(:track_id, :body)
        end
end
