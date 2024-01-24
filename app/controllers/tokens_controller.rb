class TokensController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    begin
      token = SecureRandom.hex(16)
    end while Token.find_by(token: token)

    render json: Token.create(token: token).as_json
  end
end
