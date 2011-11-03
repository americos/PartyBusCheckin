class Guestgroup < ActiveRecord::Base
  attr_accessible :type, :date

  validates :type, :presence => true
  validates :date, :presence => true
end
