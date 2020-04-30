# frozen_string_literal: true

class V1::SubscribersSessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    current_subscriber ? head(:ok) : head(:unauthorized)
  end

  def create
    @subscriber = Subscriber.find_by(email: params[:email])
    if @subscriber&.valid_password?(params[:password])
      web_token = WebToken.encode(@subscriber)

      render :create, status: :created, locals: { token: web_token }
    else
      render json: { error: 'invalid credentials'}, status: :unauthorized
    end
  end

  def destroy
    current_subscriber&.authentication_token = nil
    if current_subscriber&.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
end
