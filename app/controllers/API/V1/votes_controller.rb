class API::V1::VotesController < ApplicationController
  before_filter :set_voter, only: [:create]
  before_filter :restrict_access, only: [:create]

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render json: @vote, status: :created
    else
      render json: @vote.errors, status: :bad_request
    end

  end

  private

  def restrict_access
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

  def vote_params
    params.require(:vote).permit(:voter, :candidate)
  end

  def set_voter
    @voter = Voter.find(params[:voter])
  end
end
