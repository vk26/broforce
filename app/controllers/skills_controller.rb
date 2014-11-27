class SkillsController < ApplicationController
  before_action :check_user!
  before_action :set_skill

  def new
    if @skill
      redirect_to :edit
    else
      @skill = Skill.new
    end
  end

  def edit
    unless @skill
      redirect_to :action => :new
    end
  end

  def show
    unless @skill
      redirect_to :action => :new
    end
  end

  def create
    if @skill
      head :unprocessable_entity and return # @skill уже заполнен
    end
    p skill_params
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    if @skill.save
      redirect_to skill_path
    else
      render :action => :edit
    end
  end

  def update
    unless @skill
      head :unprocessable_entity and return # @skill ещё заполнен
    end
    if @skill.update(skill_params)
      redirect_to skill_path
    else
      render :action => :edit
    end
  end

  def destroy
    unless @skill
      head :unprocessable_entity and return # @skill ещё заполнен
    end
  end

  protected
    def check_user!
      redirect_to omniauth_authorize_path(User, :github) unless user_signed_in?
    end

    def set_skill
      @user = current_user
      @skill = @user.skill
    end

    def skill_params
      params.require(:skill).permit(:about)
    end
end
