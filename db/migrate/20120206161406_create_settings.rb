class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :name
      t.text :slug
      t.text :value

      t.timestamps
    end
  end
end
