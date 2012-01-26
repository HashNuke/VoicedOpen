class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :message
      t.string :action
      t.integer :ticket_id
      t.integer :user_id

      t.timestamps
    end
  end
end
