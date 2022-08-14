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
      end
  end
end