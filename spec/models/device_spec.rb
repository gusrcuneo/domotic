# == Schema Information
#
# Table name: devices
#
#  id          :integer          not null, primary key
#  room_id     :integer
#  type        :string(255)
#  name        :string(255)
#  description :text
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Device do
  pending "add some examples to (or delete) #{__FILE__}"
end
