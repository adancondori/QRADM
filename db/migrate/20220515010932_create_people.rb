class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :code
      t.boolean :state, default: true
      t.references :group, null: false, foreign_key: true
      t.references :event

      t.timestamps
    end
  end
end
