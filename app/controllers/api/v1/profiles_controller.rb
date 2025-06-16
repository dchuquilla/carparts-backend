class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user.as_json(include: :store)
  end
end
