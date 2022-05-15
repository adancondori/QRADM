class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :type_role
      t.string :phone
      t.boolean :state, default: true
      t.string :code
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
