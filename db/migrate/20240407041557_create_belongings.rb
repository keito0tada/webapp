class CreateBelongings < ActiveRecord::Migration[7.1]
  def change
    create_table :belongings do |t|
      t.uuid :user_id
      t.uuid :guild_id

      t.timestamps
    end
  end
end
