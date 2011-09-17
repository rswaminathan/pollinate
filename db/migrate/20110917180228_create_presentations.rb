class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.datetime :time
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
