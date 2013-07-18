class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :state
      t.string :notes
      t.string :cookie

      t.timestamps
    end
  end
end
