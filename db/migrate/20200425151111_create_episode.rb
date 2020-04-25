# frozen_string_literal: true

class CreateEpisode < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title, index: true
      t.text :plot
      t.references :season, index: true
      t.integer :number
      t.index(%i[season_id number], unique: true)
      t.timestamps
    end
  end
end
