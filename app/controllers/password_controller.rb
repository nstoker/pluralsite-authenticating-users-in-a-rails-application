# frozen_string_literal: true

class PasswordController < ApplicationController
  def reset
    token = request.query_parameters['token'] or params['token'] or not_found
    @user = User.find_by_reset(token) or not_found
    if @user && params['password']
      @user.password = params['password']
      @user.save
      render plain: 'Sucessfully reset password'
    end
  end

  def forgot
    if params['email']
      user = User.find_by_email(params['email'])
      if user
        token = SecureRandom.hex(10)
        user.reset = token
        user.save
        Rails.logger.debug "Password reset: #{user.email} #{password_reset_path}/?token=#{user.reset}"
        ResetMailer.with(user: @user).reset_password
      end
      render plain: 'A link to reset your password has been sent to your email, if you have an account on here.'
    end
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
