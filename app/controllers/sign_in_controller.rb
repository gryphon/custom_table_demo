class SignInController < ApplicationController

  def sign
    u = User.order(:last_sign_in_at).first
    sign_in(u)
    redirect_to root_path
  end

end
