class ChangeGuestGroupColumn < ActiveRecord::Migration
  def change
    change_column :guests, :guest_group, :integer, :null => false
  end
end
