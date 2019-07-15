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

require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
