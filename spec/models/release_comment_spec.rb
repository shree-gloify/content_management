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

require 'rails_helper'

RSpec.describe ReleaseComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
