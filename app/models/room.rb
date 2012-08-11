# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ActiveRecord::Base

  # Attributes access
  #----------------------------------------------------------------------

  attr_accessible :description, :name

  # assiciatons
  #----------------------------------------------------------------------

  has_many :devices, dependent: :destroy
  has_many :lamps
  has_many :dimmer_lamps

end
