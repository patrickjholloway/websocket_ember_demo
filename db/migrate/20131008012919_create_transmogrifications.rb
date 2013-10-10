class CreateTransmogrifications < ActiveRecord::Migration
  def change
    create_table :transmogrifications do |t|
      t.text :source
      t.text :compiled
      t.string :name
      t.string :source_type

      t.timestamps
    end
  end
end
