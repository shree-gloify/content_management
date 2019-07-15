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

require 'rails_helper'

RSpec.describe ProjectMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
