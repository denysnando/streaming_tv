# frozen_string_literal: true

class CreatePurchaseOption < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.references :purchaseable, polymorphic: true, index: true
      t.decimal :price, precision: 10, scale: 2
      t.string :quality

      t.timestamps
    end
  end
end
