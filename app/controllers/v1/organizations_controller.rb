# frozen_string_literal: true

class V1::OrganizationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    organizations = Organization.all
    render :index, locals: { organizations: organizations }, status: :ok
  end

  def show
    organization = Organizations.find(params[:id])

    render :show, locals: { organization: organization }, status: :ok
  end
end
