class AddCookieToAnswer < ActiveRecord::Migration
  def self.up
      add_column :answers, :cookie, :string
  end

  def self.down
      remove_column :answers, :cookie
  end
end
