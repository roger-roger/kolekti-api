class Bundle < ActiveRecord::Base
  belongs_to :household
  has_many :widgets

  validates_presence_of :name, :household
end
