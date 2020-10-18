# frozen_string_literal: true

# ResetMailer class
class ResetMailer < ApplicationMailer
  def reset_password
    @user = params[:user]
    @url = password_reset_route + "?token=#{params[:token]}"
    puts "***** #{@url.inspect} *****"
    mail(to: @user.email, subject: 'Reset Password for News App')
  end
end
