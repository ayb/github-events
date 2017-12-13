class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.string :owner
      t.string :repo
      t.string :event_type
      t.datetime :created_at
    end
  end
end
