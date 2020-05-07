# frozen_string_literal: true

class V1::NeedsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_subscriber!

  def index
    if current_subscriber
      @needs = filter_needs
      render :index, locals: { needs: @needs }, status: :ok
    else
      head(:unauthorized)
    end
  end

  def create
    if current_subscriber
      Subscriber.current_subscriber = current_subscriber
      @need = Need.new(need_params)
      if @need.save
        render :create, status: :created, locals: { need: @need }
      else
        render json: { error: @need.errors }, status: :unprocessable_entity
      end
    else
      head(:unauthorized)
    end
  end

  private

  def need_params
    params.require(:need).permit(:title, :description, :organization_id)
  end

  def filter_needs
    needs = Need.all
    if query.present?
      needs = needs.where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
    end
    if organization_id.present?
      needs = needs.where(organization_id: organization_id)
    end
    needs
  end

  def query
    params.dig(:query)
  end

  def organization_id
    params.dig(:organization_id)
  end
end
