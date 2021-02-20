# frozen_string_literal: true

class Stock < ApplicationRecord
  validates :ticker_symbol, presence: true
  validates :purchase_price, presence: true
  validates :shares, presence: true
  validates :purchase_date, presence: true
end
