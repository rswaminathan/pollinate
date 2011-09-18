class AddChoicesToQuestions < ActiveRecord::Migration
  def self.up
      add_column :questions, :choices, :string
  end

  def self.down
      remove_column :questions, :choices
  end
end
