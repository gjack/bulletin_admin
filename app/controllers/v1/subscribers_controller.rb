# frozen_string_literal: true

class V1::SubscribersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
