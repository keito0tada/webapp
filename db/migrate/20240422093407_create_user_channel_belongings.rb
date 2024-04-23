class CreateUserChannelBelongings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_channel_belongings, id: false do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true
      t.belongs_to :channel, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
