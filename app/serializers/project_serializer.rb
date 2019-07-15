class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :project_description
end
