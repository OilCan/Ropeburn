require 'rails_helper'

RSpec.describe GitHub, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

get_hooks = [
  {
    :url => "https://api.github.com/orgs/OilCan/hooks/5174939",
    :ping_url => "https://api.github.com/orgs/OilCan/hooks/5174939/pings",
    :id => 5174939,
    :name => "web",
    :active => true,
    :events => [
      "pull_request_review_comment",
      "pull_request"
    ],
    :config => {
      :url => "http://ropeburn.dev/foo",
      :content_type => "json"
    },
    :updated_at => "2015-06-28 08:45:06 UTC",
    :created_at => "2015-06-28 08:45:05 UTC"
  }
]

get_orgs = [
  {
                    :login => "OilCan",
                      :id => 11170372,
                      :url => "https://api.github.com/orgs/OilCan",
                :repos_url => "https://api.github.com/orgs/OilCan/repos",
              :events_url => "https://api.github.com/orgs/OilCan/events",
              :members_url => "https://api.github.com/orgs/OilCan/members{/member}",
      :public_members_url => "https://api.github.com/orgs/OilCan/public_members{/member}",
              :avatar_url => "https://avatars.githubusercontent.com/u/11170372?v=3",
              :description => nil,
            :public_repos => 1,
            :public_gists => 0,
                :followers => 0,
                :following => 0,
                :html_url => "https://github.com/OilCan",
              :created_at => "2015-02-24 04:03:39 UTC",
              :updated_at => "2015-06-12 18:39:09 UTC",
                    :type => "Organization",
      :total_private_repos => 5,
      :owned_private_repos => 5,
            :private_gists => 0,
              :disk_usage => 37104,
            :collaborators => 0,
            :billing_email => "github@shirley.im",
                    :plan => {
                  :name => "bronze",
                  :space => 976562499,
          :private_repos => 10
      }
  }
]
