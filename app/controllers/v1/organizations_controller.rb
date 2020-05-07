# frozen_string_literal: true

class V1::OrganizationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_subscriber!


  def index
    if current_subscriber
      organizations = Organization.all
      render :index, locals: { organizations: organizations }, status: :ok
    else
      head(:unauthorized)
    end
  end

  def show
    if current_subscriber
      organization = Organizations.find(params[:id])

      render :show, locals: { organization: organization }, status: :ok
    else
      head(:unauthorized)
    end
  end
end
