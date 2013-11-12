class CreateEventStreams < ActiveRecord::Migration
  def change
    create_table :event_streams do |t|
      t.string :name
    end
  end
end
