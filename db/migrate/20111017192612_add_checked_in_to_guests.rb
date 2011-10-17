class AddCheckedInToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :checked_in, :boolean, :default => false
  end
end
