class CreateBelongings < ActiveRecord::Migration[7.1]
  def change
    create_table :belongings, id: false do |t|
      t.references :user, null: false, type: :uuid, foreign_key: true
      t.references :guild, null: false, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
