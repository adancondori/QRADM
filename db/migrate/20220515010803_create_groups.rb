class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :code
      t.boolean :state, default: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
