class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :request_count
      t.datetime :last_request_at

      t.timestamps
    end
  end
end
