# frozen_string_literal: true

class AddCodeToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :code, :string
  end
end
