class Entities::WidgetEntity < Grape::Entity
  format_with(:iso_timestamp){ |dt| dt.iso8601 }
  
  expose :id
  expose :name
  expose :aasm_state, as: :state
  expose :quantity
  expose :collected
  expose :budget
  expose :cost
  expose :created_at, format_with: :iso_timestamp
end