class RepositoriesController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource except: [ :from_github_org ]

  def index
    @repositories = current_user.repositories
  end

  def from_github_org
    github_id = params[:github_id]
    if GitHub.new(current_user).setup_organization(current_user, github_id)
      redirect_to repositories_path
    else
      redirect_to user_path, alert: t(:failed_setting_organization)
    end
  end
end
