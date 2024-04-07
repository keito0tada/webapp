class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions, id: false do |t|
      t.string :session_digest
      t.references :user, null: false, type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
