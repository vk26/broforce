class UsersController < ApplicationController
  def index
    @users = User.includes(:skill).where.not(skills: { id: nil })
  end
end
