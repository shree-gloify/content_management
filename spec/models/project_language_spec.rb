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

require 'rails_helper'

RSpec.describe ProjectLanguage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
