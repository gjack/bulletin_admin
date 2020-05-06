# frozen_string_literal: true

class V1::NeedsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_subscriber!

  def index
    if current_subscriber
      needs = Need.all
      render :index, locals: { needs: needs }, status: :ok
    else
      head(:unauthorized)
    end
  end
end
