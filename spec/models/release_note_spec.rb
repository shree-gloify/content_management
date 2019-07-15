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

require 'rails_helper'

RSpec.describe ReleaseNote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
