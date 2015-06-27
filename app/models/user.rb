class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [ :github ]

  def github_client
    return nil if github_token.nil?
    @github_client ||= Octokit::Client.new(access_token: github_token)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_authentication(conditions)
    where(conditions).active.first
  end

  def self.from_omniauth(auth)
    where(oauth_provider: auth.provider, oauth_uid: auth.uid).first_or_create do |user|
      if user.respond_to?("#{auth.provider}_token=")
        user.send("#{auth.provider}_token=", auth["credentials"]["token"])
      end
      user.email = auth.info.email
      user.password  = Devise.friendly_token[0,20]
      user.full_name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end


end
