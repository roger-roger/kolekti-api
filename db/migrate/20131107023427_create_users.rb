class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :aasm_state
      t.timestamps
    end

    create_table :households_users, :id => false do |t|
      t.references :household, index: true
      t.references :user, index: true
    end
  end
end
