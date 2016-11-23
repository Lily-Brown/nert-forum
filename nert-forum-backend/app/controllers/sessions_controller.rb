class SessionsController < ApplicationController

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      user.auth_key = SecureRandom.uuid
      user.save
      session = Session.new(auth_key: user.auth_key, user: user, id: user.id)
      render :json => session, status: :created
    else
      render status: :unauthorized
    end
  end

  private

  def session_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: %w(email password))
  end

end
