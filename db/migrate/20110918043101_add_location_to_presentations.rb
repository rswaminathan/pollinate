class AddLocationToPresentations < ActiveRecord::Migration
  def self.up
      add_column :presentations, :latitude, :float
      add_column :presentations, :longitude, :float
      
  end

  def self.down
      remove_column :presentations, :latitude, :float
      remove_column :presentations, :longitude, :float
      
  end
end
