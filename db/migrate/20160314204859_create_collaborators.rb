class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :wiki_id
      t.integer :user_id
    end

    add_index :wikis, :id, unique: true
    add_index :users, :id, unique: true
  end
end
