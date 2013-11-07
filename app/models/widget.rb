class Widget < ActiveRecord::Base
  belongs_to :bundle

  validates_presence_of :name
end
