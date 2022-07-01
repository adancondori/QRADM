class CreateExtraPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :extra_points do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.string :name
      t.string :description
      t.string :code
      t.references :event, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
