class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.boolean :best
      t.references :user
      t.references :votable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
