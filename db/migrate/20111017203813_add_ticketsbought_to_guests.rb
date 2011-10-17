class AddTicketsboughtToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :tickets_bought, :integer, :default => 1
  end
end
