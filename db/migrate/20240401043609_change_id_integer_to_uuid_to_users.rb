class ChangeIdIntegerToUuidToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :uuid, :uuid, null: false, default: 'gen_random_uuid()'

    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute 'ALTER TABLE users ADD PRIMARY KEY (id);'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
