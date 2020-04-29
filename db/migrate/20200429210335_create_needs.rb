class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
