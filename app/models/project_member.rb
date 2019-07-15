# == Schema Information
#
# Table name: project_members
#
#  id         :bigint           not null, primary key
#  project_id :bigint           not null
#  user_id    :bigint           not null
#  role       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectMember < ApplicationRecord
  # constants
  ROLES = ['author', 'watcher', 'worker']
  # extensions
  
  # scopes

  # associations
  belongs_to :project
  belongs_to :user

  # validations
  validates :role, presence: true, inclusion: { in: ROLES, message: "%{value} is not a valid role." }

  # callbacks
end
