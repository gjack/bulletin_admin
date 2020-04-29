class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.belongs_to :organization
      t.string :title
      t.text :description
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps
    end
  end
end
