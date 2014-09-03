class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :url
      t.datetime :last_ping
      t.timestamps
    end
  end
end
