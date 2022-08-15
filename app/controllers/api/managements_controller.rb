module Api
  class ManagementsController < ApplicationController
    before_action :authenticate_user
    before_action :set_management, only: %i[ show update destroy ]

    def index
      if current_user.admin
        @users = User.all
        render json: @users, status: :ok
      else
        render json: {errors: "Unauthorized"}, status: :unauthorized
      end
    end

    def show
      render json: @user
    end

    def create
    end

    def update
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_management
        @user = User.find(current_user.id)
        update_balance(@user)
      end

      def update_balance(user)
        @transactions = user.transactions.all
        buy_total = 0.0
        sell_total = 0.0
        @transactions.map do |transaction|
          if transaction.action
            buy_total += transaction.quantity * transaction.price
          else
            sell_total += transaction.quantity * transaction.price
          end
        end

        user.money += sell_total - buy_total
      end
  end
end