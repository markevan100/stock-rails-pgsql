# frozen_string_literal: true

module Api
  module V1
    class StocksController < ApplicationController
      def index
        stocks = Stock.all

        if stocks.present?
          render json: stocks
        else
          error 'Unable to retrieve stocks'
          nil
        end
      end

      def create
        stock = Stock.new(stock_params)

        if stock.save
          render json: stock, status: :created
        else
          render json: { errors: stock.errors }, status: :unprocessable_entity
        end
      end

      def show
        stock = Stock.find(params[:id])

        render json: stock
      end

      def update
        stock = Stock.find(params[:id])

        if stock.update(stock_params)
          render json: stock, status: :ok
        else
          render json: { errors: stock.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        Stock.find(params[:id])&.delete
        head 204
      end

      private

      def stock_params
        @stock_params ||= params.require(:stock).permit(
          :ticker_symbol,
          :purchase_price,
          :shares,
          :purchase_date,
          :sale_price,
          :sale_date,
          :market_index
        )

        if @stock_params[:purchase_date].present?
          @stock_params[:purchase_date] = Date.strptime(@stock_params[:purchase_date], '%m/%d/%Y')
        end

        @stock_params
      end
    end
  end
end
