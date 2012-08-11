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

class Lamp < Device

  def status
    status = read_attribute(:status) || 0
    status >  0
  end

  def on!
    update_attribute :status, 255
  end

  def off!
    update_attribute :status, 0
  end

  def on?
    self.status == true
  end

  def off?
    self.status == false
  end

end
