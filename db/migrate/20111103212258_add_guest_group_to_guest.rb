class AddGuestGroupToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :guest_group, :integer
  end
end
