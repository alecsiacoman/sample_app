class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    #add_column method adds a password_digest column to the users table
    add_column :users, :password_digest, :string
  end
end
