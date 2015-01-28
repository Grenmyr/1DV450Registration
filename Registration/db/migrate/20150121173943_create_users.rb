class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # how to validate maxlength and uniqueness of username?
      t.string :username, :limit => (30)
      t.string :password, :limit => (255)
      t.string :email, :limit =>(255)
      t.timestamps null: false
    end
  end
end
