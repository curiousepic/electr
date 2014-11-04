class API::V1::VotersController < ApplicationController

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
    @voter = Voter.find(params[:id])
    if @voter.update(voter_params)
      render json: @voter, status: :ok
    else
      render json: @voter.errors, status: :bad_request
    end
  end

  private

  def voter_params
    params.require(:voter).permit(:name, :party)
  end
end
