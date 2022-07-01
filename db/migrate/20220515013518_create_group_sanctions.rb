class CreateGroupSanctions < ActiveRecord::Migration[6.1]
  def change
    create_table :group_sanctions do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :date_done
      t.string :observation
      t.references :group, null: false, foreign_key: true
      t.references :sanction, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
