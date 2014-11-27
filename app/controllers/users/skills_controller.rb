class Users::SkillsController < ApplicationController
  before_action :set_user

  def show
    @skill = @user.skill
    render 'skills/show'
  end

  protected
    def set_user
      @user = User.with_skill.find(params[:user_id])
    end
end
