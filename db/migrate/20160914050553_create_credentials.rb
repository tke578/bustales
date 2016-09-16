class CreateCredentials < ActiveRecord::Migration
  def change
  	create_table :credentials do |t|
      t.integer :user_id
      t.string :access_token
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
