class Entities::BundleEntity < Grape::Entity
  format_with(:iso_timestamp){ |dt| dt.iso8601 }
  
  expose :id
  expose :name
  expose :aasm_state, as: :state
  expose :widgets, using: Entities::WidgetEntity
  # expose :household, using: Entities::HouseholdEntity
  expose :created_at, format_with: :iso_timestamp
end