class CreateParameters < ActiveRecord::Migration[6.1]
  def change
    create_table :parameters do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.string :description
      t.string :type
      t.boolean :state, default: true

      t.timestamps
    end
  end
end
