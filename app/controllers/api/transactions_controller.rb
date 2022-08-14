module Api
  class TransactionsController < ApplicationController
    before_action :authenticate_user
    before_action :set_transaction, only: %i[ show update destroy ]

    # GET /transactions
    def index
      if !current_user.admin
        @transactions = current_user.transactions.all
        render json: {data: {
                      user: current_user,
                      transactions: transactions_details(@transactions)}
        }
      else
        @transactions = Transaction.all
        render json: {data: {
                      transaction: @transactions}
        }
      end
    end

    # GET /transactions/1
    def show
      render json: @transaction
    end

    # POST /transactions
    def create
      @transaction = current_user.transactions.new(transaction_params)

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

      def transactions_details(transactions)
        details = {buy: [], sell: []}
        transactions.map do |transaction|
          if transaction.action
            details[:buy] << transaction
          else
            details[:sell] << transaction
          end
        end
        details
      end
  end
end