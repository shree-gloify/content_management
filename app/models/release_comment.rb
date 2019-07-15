# == Schema Information
#
# Table name: release_comments
#
#  id              :bigint           not null, primary key
#  release_note_id :bigint           not null
#  user_id         :bigint           not null
#  description     :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ReleaseComment < ApplicationRecord
  # constants

  # extensions
  include PgSearch
  multisearchable against: [:description]

  # scopes

  # associations
  belongs_to :release_note
  belongs_to :user

  # validations
  validates :description, presence: true

  # callbacks
end
