class Household < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :bundles

  validates :name, presence: true, uniqueness: true
end
