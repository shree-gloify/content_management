# == Schema Information
#
# Table name: project_languages
#
#  id         :bigint           not null, primary key
#  project_id :bigint           not null
#  language   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectLanguage < ApplicationRecord
  # constants

  # extensions
  
  # scopes

  # associations
  belongs_to :project

  # validations
  validates :language, presence: true

  # callbacks
end
