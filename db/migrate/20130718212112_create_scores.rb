class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user
      t.references :topic
      t.integer :specific
      t.integer :actionable
      t.integer :kind
    end
  end
end
