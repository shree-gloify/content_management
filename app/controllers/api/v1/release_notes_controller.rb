class Api::V1::ReleaseNotesController < Api::V1::ApiController
  
  before_action :set_project, only: [:create]

  def create
  	@release_note = @project.release_notes.build(release_note_params.merge(user_id: current_user.id))
    
    if @release_note.save
      render json: @release_note, status: 201
    else
      render json: @release_note.errors, status: :unprocessable_entity
    end
  end


  private

  def release_note_params
  	params.require(:release_note).permit(:release_description, :release_number)
  end

  def set_project
  	@project = Project.find(params[:project_id])
  end
end
