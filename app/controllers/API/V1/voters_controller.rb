class API::V1::VotersController < ApplicationController

  before_filter :set_voter, only: [:update, :show]
  before_filter :restrict_access, only: [:update, :show]

  def create
    @voter = Voter.new(voter_params)
    if @voter.save
      render json: @voter, status: :created
    else
      render json: @voter.errors, status: :bad_request
    end
  end

  def show
    @voter = Voter.find(params[:id])
    render json: @voter
  end

  def update
    if @voter.update(voter_params)
      render json: @voter, status: :ok
    else
      render json: @voter.errors, status: :bad_request
    end
  end

  private

  def restrict_access
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
    # authenticate_or_request_with_http_token do |token, options|
    #   Voter.exists?(token: token)
    # end
  end

  def voter_params
    params.require(:voter).permit(:name, :party)
  end

  def set_voter
    @voter = Voter.find(params[:id])
  end
end
