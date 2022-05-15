class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :code
      t.decimal :amount, precision: 10, scale: 2
      t.integer :type_validation
      t.datetime :init_date
      t.datetime :end_date
      t.boolean :state, default: true

      t.timestamps
    end
  end
end
