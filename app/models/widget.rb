class Widget < ActiveRecord::Base
  include AASM

  belongs_to :bundle
  validates_presence_of :name

  aasm do
    state :wanted, initial: true
    state :collected
    state :deleted

    event :collect do
      transitions from: :wanted, to: :collected
    end
    
  end
end
