class CreateGuilds < ActiveRecord::Migration[7.1]
  def change
    create_table :guilds, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
