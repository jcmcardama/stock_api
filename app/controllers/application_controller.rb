class ApplicationController < ActionController::API
    def root
        render json: {message: "Server Running"}
    end
end