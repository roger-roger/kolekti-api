class Entities::HouseholdEntity < Grape::Entity
  format_with(:iso_timestamp){ |dt| dt.iso8601 }
  
  expose :id
  expose :name
  expose :aasm_state, as: :state
  expose :bundles, using: Entities::BundleEntity
  expose :users, as: :members, using: Entities::UserEntity
  expose :created_at, format_with: :iso_timestamp
end