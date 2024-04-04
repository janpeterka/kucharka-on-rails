module Event::Collaboration
  extend ActiveSupport::Concern

  included do
    has_many :user_event_roles
    has_many :collaborators, through: :user_event_roles, source: :user
  end

  def involved_users
    [author] + collaborators
  end
end