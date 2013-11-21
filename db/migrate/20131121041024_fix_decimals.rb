class FixDecimals < ActiveRecord::Migration
  def self.up
    change_table :widgets do |t|
      t.change :cost, :decimal, :precision => 15, :scale => 12
      t.change :budget, :decimal, :precision => 15, :scale => 12
    end
  end
 
  def self.down
    change_table :widgets do |t|
      t.change :cost, :integer
      t.change :budget, :integer
    end
  end
end
