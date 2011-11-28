class AddAcquiredOnToItem < ActiveRecord::Migration
  def change
    add_column :items, :acquired_on, :date
  end
end
