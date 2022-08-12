module Api
  class TransactionsController < ApplicationController
    before_action :authenticate_user
    before_action :set_transaction, only: %i[ show update destroy ]

    # GET /transactions
    def index
      @transactions = current_user.transactions.all

      render json: {data: {
                    user: current_user,
                    transaction: @transactions}
                    }
    end

    # GET /transactions/1
    def show
      render json: @transaction
    end

    # POST /transactions
    def create
      @transaction = Transaction.new(transaction_params)

      if @transaction.save
        render json: @transaction, status: :created, location: nil
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /transactions/1
    # Not needed
    def update
      # if @transaction.update(transaction_params)
      #   render json: @transaction
      # else
      #   render json: @transaction.errors, status: :unprocessable_entity
      # end
    end

    # DELETE /transactions/1
    # Not needed
    def destroy
      # @transaction.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transaction
        @transaction = Transaction.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def transaction_params
        params.require(:transaction).permit(:user_id, :quantity, :action, :stock_id, :price)
      end
  end
end