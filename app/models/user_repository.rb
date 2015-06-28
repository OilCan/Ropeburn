class UserRepository < ActiveRecord::Base
  scope :owned, -> { where(setup_here: true) }

  belongs_to :user, inverse_of: :user_repositories
  belongs_to :repository, inverse_of: :user_repositories

  validates :user, presence: true
  validates :repository, presence: true
end
