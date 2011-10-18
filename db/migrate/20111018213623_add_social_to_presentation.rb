class AddSocialToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :twitter_handle, :string
    add_column :presentations, :linkedIn_handle, :string
    
  end

  def self.down
    remove_column :presentations, :twitter_handle
    remove_column :presentations, :linkedIn_handle
  end
end
