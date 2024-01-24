class CreateTokens < ActiveRecord::Migration[7.1]
  def up
    create_table :tokens do |t|
      t.string :token

      t.timestamps
    end

    add_index :tokens, :token, unique: true
  end

  def down
    remove_index :tokens, :token
    drop_table :tokens
  end
end
