class SongUserId < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.references :user
    end
    add_index :songs, :user_id
  end
end
