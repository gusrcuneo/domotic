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

class Device < ActiveRecord::Base

  # Attr accesible
  #----------------------------------------------------------------------
  attr_accessible :description, :name, :status, :type

  # associations
  #----------------------------------------------------------------------

  belongs_to :room


  # Return the user type downcased, dasherized and symbolized
  # ej: SuperUser -> :super_user
  def device_type
    ActiveModel::Naming.param_key(self)
  end



  # Return the user type downcased, dasherized and symbolized
  # ej: SuperUser -> :super_user
  def device_controller
    self.device_type.pluralize
  end

end
