class Household < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :bundles

  validates :name, presence: true, uniqueness: true

  after_create :setup_default_bundles

  def setup_default_bundles
    ['Grocery Store'].each do |bundle_name|
      bundles.create(name: bundle_name)
    end
  end
end
