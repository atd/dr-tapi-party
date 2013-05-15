class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :user
      t.references :song
      t.text :instruments

      t.timestamps
    end
    add_index :plays, :user_id
    add_index :plays, :song_id
  end
end
