class OAuth < ApplicationRecord
  belongs_to :user

  validates :provider_user, presence: true
end