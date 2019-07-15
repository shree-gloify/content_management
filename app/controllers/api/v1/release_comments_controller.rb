class Api::V1::ReleaseCommentsController < Api::V1::ApiController

  before_action :set_release_note, only: [:create]

  def create
  	@release_comment = @release_note.release_comments.build(release_comment_params.merge(user_id: current_user.id))
    
    if @release_comment.save
      render json: @release_comment, status: 201
    else
      render json: @release_comment.errors, status: :unprocessable_entity
    end
  end


  private

  def release_comment_params
  	params.require(:release_comment).permit(:description)
  end

  def set_release_note
  	@release_note = ReleaseNote.find(params[:release_note_id])
  end
end
