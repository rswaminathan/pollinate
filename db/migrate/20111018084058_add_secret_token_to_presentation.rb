class AddSecretTokenToPresentation < ActiveRecord::Migration
  def self.up
      add_column :presentations, :secret_token, :string
  end

  def self.down
      remove_column :presentations, :secret_token
  end
end
