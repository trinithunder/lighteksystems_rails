class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.references :caller, foreign_key: { to_table: :users }  # Ensure foreign key references :users table
      t.references :recipient, foreign_key: { to_table: :users }  # Ensure foreign key references :users table

      t.timestamps
    end
  end
end
