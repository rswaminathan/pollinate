class AddEmailToPresentation < ActiveRecord::Migration
  def self.up
        add_column :presentations, :email, :string
  end

  def self.down
      remove_column :presentations, :email
  end
end
