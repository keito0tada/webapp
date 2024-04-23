class CreateChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels, id: :uuid do |t|
      t.belongs_to :guild, type: :uuid, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
