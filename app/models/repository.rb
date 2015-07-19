class Repository < ActiveRecord::Base
  attr_accessor :client

  scope :forked, -> { where(forked: true) }

  has_many :user_repositories, inverse_of: :repository
  has_many :users, through: :user_repositories

  validates :github_id, presence: true
  validates :name, presence: true
  validates :full_name, presence: true

  def setup(user)
    client = user.github_client
  end

  def to_param
    full_name
  end

  protected

  def check_if_webhook_installed

  end
end
