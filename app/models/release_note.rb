# == Schema Information
#
# Table name: release_notes
#
#  id                  :bigint           not null, primary key
#  project_id          :bigint           not null
#  user_id             :bigint           not null
#  release_description :text             not null
#  release_number      :float            not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class ReleaseNote < ApplicationRecord
  # constants

  # extensions
  include PgSearch
  multisearchable against: [:release_description]
  
  # scopes

  # associations
  has_many :release_comments

  belongs_to :project
  belongs_to :user

  # validations
  validates :release_description, presence: true
  validates :release_number, presence: true

  # callbacks
end
