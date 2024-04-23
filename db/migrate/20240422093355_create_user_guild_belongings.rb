class CreateUserGuildBelongings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_guild_belongings, id: false do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true
      t.belongs_to :guild, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
