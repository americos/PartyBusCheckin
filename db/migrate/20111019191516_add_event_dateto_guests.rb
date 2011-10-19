class AddEventDatetoGuests < ActiveRecord::Migration
  def change
    add_column :guests, :event_date, :string
  end
end
