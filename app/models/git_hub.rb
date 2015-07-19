class GitHub
  attr_accessor :client

  # This is smelly, painted myself in a corner :(
  def initialize(user_or_token)
    if user_or_token.kind_of?(String)
      @client = Octokit::Client.new(access_token: user_or_token)
    else
      @client = user_or_token.github_client
    end
  end

  def accessible_repositories

  end

  def organizations
    client.orgs
  end

  def setup_organization(user, org_id)
    org = client.org(org_id)

    setup_repositories(user, org_id)
    install_hook_if_needed(org_id)

    org
  end

  def setup_webhook_for_development(org_id, forward_endpoint)
    install_hook_if_needed(org_id, forward_endpoint)
  end

  def webhook_url
    Rails.application.routes.url_helpers.webhook_url
  end

  protected

  def setup_repositories(user, org_id)
    Octokit.auto_paginate = true

    client.organization_repositories(org_id).each do |repo|
      saved_repo = Repository.where(github_id: repo[:id]).first_or_create do |new_repo|
        new_repo.name = repo[:name]
        new_repo.full_name = repo[:full_name]
        new_repo.private = repo[:private]
        new_repo.fork = repo[:fork]
      end

      user.user_repositories.find_or_create_by(repository_id: saved_repo.id)
    end
  end

  def find_webhooks(org_id, url)
    client.org_hooks(org_id).select { |hook| hook[:config][:url] == url }
  end

  def install_hook_if_needed(org_id, url=webhook_url)
    if find_webhooks(org_id, url).empty?
      install_org_hooks(org_id, url)
    end
  end

  def install_org_hooks(org, url)
    client.create_org_hook(
      org,
      {
        url: url,
        content_type: :json,
        secret: Rails.application.secrets.github_webhook_secret
      },
      {
        events: self.webhook_events,
        active: true
      }
    )
  end

  def webhook_events
    [ :pull_request_review_comment, :pull_request ]
  end
end
