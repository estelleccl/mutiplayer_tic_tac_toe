class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.string :room_name, index: true, null: false, unique: true
  		t.integer :player1_id, index: true
  		t.integer :player2_id, index: true
  		t.string :status
  		t.integer :current_player

  		t.timestamps
  	end
  end
end
