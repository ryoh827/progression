class CreateUserCredentials < ActiveRecord::Migration[8.0]
  def change
    create_table :user_credentials do |t|
      t.references :user, null: false, foreign_key: true
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest

      t.timestamps
    end
  end
end
