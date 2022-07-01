class CreateGroupExtraPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :group_extra_points do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :date_done
      t.string :observation
      t.references :group, null: false, foreign_key: true
      t.references :extra_point, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
