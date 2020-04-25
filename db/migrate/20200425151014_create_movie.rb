class CreateMovie < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, index: true
      t.text :plot
      t.timestamps
    end
  end
end
