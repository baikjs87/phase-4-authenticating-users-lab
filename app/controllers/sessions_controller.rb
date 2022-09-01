class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        user = User.create(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

    private

    def user_params
        params.permit(:username)
    end

end