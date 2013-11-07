class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.integer :quantity
      t.integer :collected
      t.decimal :budget
      t.decimal :cost
      t.references :bundle, index: true
      t.string :aasm_state
      
      t.timestamps
    end
  end
end
