require 'securerandom'

class Voter < ActiveRecord::Base
  before_save :add_token

  has_many :votes

  validates :name, presence: true

  private

  def add_token
    self.token ||= SecureRandom.uuid
  end
end
