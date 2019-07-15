# == Schema Information
#
# Table name: projects
#
#  id                  :bigint           not null, primary key
#  user_id             :bigint           not null
#  project_name        :string           not null
#  project_description :text
#  slug                :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Project < ApplicationRecord
  # constants

  # extensions
  include PgSearch
  multisearchable against: [:project_name, :project_description]

  # scopes

  # associations
  has_many :project_languages
  has_many :project_members
  # has_many :users, through: :project_members
  has_many :release_notes

  belongs_to :user

  # nested attributes
  accepts_nested_attributes_for :project_languages, reject_if: :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :project_members, reject_if: :all_blank, :allow_destroy => true

  # validations
  validates :project_name, presence: true
  validates :project_description, presence: true

  # callbacks
  before_validation :ensure_slug, on: :create

  def ensure_slug
    if slug.blank?
      self.slug = loop do
        slug = SecureRandom.urlsafe_base64(6).tr('1+/=lIO0_-', 'pqrsxyz').upcase
        slug = "CFIV"+slug
        break slug unless Project.where(slug: slug).exists?
      end
    end
  end
end
