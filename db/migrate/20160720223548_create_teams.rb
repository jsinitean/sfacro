class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|

    	t.string "first_name"
    	t.string "last_name"
        t.string "bio"
        t.date "start_date"
        t.date "birth_date"
        t.text "additional_notes"
        t.string "photo"
        t.timestamps null: false
    end
  end
end
