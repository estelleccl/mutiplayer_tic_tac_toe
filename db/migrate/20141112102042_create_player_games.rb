class CreatePlayerGames < ActiveRecord::Migration
  def change
  	create_table :player_games do |t|
  		t.integer :player_id, index: true
  		t.integer :game_id, index: true
  		t.boolean :winner?, default: false

  		t.timestamps
  	end
  end
end
