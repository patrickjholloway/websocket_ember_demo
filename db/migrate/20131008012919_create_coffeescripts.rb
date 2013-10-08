class CreateCoffeescripts < ActiveRecord::Migration
  def change
    create_table :coffeescripts do |t|
      t.text :source
      t.text :compiled
      t.string :name

      t.timestamps
    end
  end
end
