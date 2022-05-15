class CreateGroupActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :group_activities do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :date_done
      t.references :group, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.string :observation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
