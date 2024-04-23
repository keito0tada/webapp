class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.belongs_to :channel, type: :uuid, foreign_key: true
      t.belongs_to :user, type: :uuid, null: true
      t.string :content

      t.timestamps
    end
  end
end
