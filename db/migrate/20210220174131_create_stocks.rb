class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :ticker_symbol
      t.float :purchase_price
      t.integer :shares
      t.date :purchase_date
      t.date :sale_date
      t.string :market_index
      t.float :profit_loss

      t.timestamps
    end
  end
end
