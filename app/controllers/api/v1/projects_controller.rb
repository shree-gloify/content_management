class Api::V1::ProjectsController < Api::V1::ApiController
  
  def create
  	@project = Project.new(project_params.merge(user_id: current_user.id))
    
    if @project.save
      render json: @project, status: 201
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end


  private

  def project_params
  	params.require(:project).permit(:project_name, :project_description,
                        project_languages_attributes: [:id, :language, :_destroy],
                        project_members_attributes: [:id, :user_id, :role, :_destroy])
  end
end
