class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # how to validate maxlength and uniqueness of username?U
      t.string :username
      t.string :password
      t.string :email
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
