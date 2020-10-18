# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authorized, only: %i[login logout index]

  def index; end

  def login
    return false unless params['username'] && params['password']

    user = User.find_by_username(params['username'])
    @valid = user.authenticate(params['password'])

    if @valid
      session[:user_id] = user.id
      redirect_to '/home'
    end
  end

  def logout
    session[:user_id] = nil
  end
end
