class RepositoriesController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource except: [ :from_github_org ], find_by: :full_name

  def index
    @repositories = current_user.repositories
  end

  def from_github_org
    github_id = params[:github_id]
    if GitHub.new(current_user).setup_organization(current_user, github_id)
      redirect_to repositories_path, notice: t(:organization_setup_complete)
    else
      redirect_to user_path, alert: t(:organization_setup_complete)
    end
  end

  def show

  end
end
