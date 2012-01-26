class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.text :title
      t.text :message
      t.integer :user_id
      t.string :status, :default => "open"

      t.timestamps
    end
  end
end
