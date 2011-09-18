class AddEnabledToQuestions < ActiveRecord::Migration
  def self.up
      add_column :questions, :enabled, :boolean, :default => false
  end

  def self.down
      remove_column :questions, :enabled
  end
end
