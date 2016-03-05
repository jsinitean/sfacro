class CreateTableTermLists < ActiveRecord::Migration
  def up
    create_table :term_lists do |t|
            t.string "name"
            t.string "definition"
            t.string "additional_notes"
            t.string "term_type"
            t.timestamps
   end
end


