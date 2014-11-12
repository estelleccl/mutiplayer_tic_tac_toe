class CreatePlayers < ActiveRecord::Migration
 def change
  	create_table :players do |t|
  		t.string :username, index: true, null: false, unique: true
  		t.string :password, null: false

  		t.timestamps
  	end
  end
end
