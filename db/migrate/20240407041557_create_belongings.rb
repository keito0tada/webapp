class CreateBelongings < ActiveRecord::Migration[7.1]
  def change
    create_table :belongings do |t|
      t.references :user, foreign_key: true
      t.references :guild, foreign_key: true

      t.timestamps
    end
  end
end
