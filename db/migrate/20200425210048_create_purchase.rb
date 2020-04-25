# frozen_string_literal: true

class CreatePurchase < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user, index: true
      t.references :purchase_option, index: true
      t.datetime :expired_at
      t.timestamps
    end
  end
end
