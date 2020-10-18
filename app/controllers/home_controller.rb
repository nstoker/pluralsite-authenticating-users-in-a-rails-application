# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def login
    user = User.find_by_username(params['username']) if params['username']
    @valid = false
    @valid = user.authenticate(params['password']) if params['password']
  end
end
