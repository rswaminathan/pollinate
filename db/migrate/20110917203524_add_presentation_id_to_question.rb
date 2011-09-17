class AddPresentationIdToQuestion < ActiveRecord::Migration
  def self.up
      add_column :questions, :presentation_id, :integer
  end

  def self.down
      remove_column :questions, :presentation_id
  end
end
