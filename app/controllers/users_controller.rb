class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  load_and_authorize_resource

  def show
    @github = GitHub.new(current_user)
  end

  def edit

  end

  def update

  end

  private

  def user_params

  end

  def set_user
    @user = current_user
  end
end
