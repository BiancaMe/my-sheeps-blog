class AddConfirmableToDevise < ActiveRecord::Migration[7.1]
  def up
    add_index :users, :confirmation_token, unique: true
    User.update_all confirmed_at: DateTime.now
end
def down
    remove_index :users, :confirmation_token
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
