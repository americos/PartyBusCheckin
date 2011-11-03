class CreateGuestgroups < ActiveRecord::Migration
  def change
    create_table :guestgroups do |t|
      t.string :type
      t.string :date

      t.timestamps
    end
  end
end
