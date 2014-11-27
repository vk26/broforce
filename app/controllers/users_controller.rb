class UsersController < ApplicationController
  def index
    @users = User.with_skill
  end
end
