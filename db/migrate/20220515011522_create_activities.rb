class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :rules
      t.string :code
      t.datetime :date_init
      t.datetime :date_end
      t.decimal :amount, precision: 10, scale: 2
      t.boolean :is_close, default: false
      t.boolean :state, default: true
      t.boolean :is_visible, default: true
      t.references :event, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
