class Entities::UserEntity < Grape::Entity
  format_with(:iso_timestamp){ |dt| dt.iso8601 }
  
  expose :id
  expose :name
  expose :aasm_state, as: :state
  # expose :households, using: Entities::HouseholdEntity

  expose :created_at, format_with: :iso_timestamp
end