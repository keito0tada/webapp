class CreateGuilds < ActiveRecord::Migration[7.1]
  def change
    create_table :guilds, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :belongings, :user_id
    add_index :belongings, :guild_id
    add_index :belongings, %i[user_id guild_id], unique: true
  end
end
