# frozen_string_literal: true

module Recipes
  module Likeable
    extend ActiveSupport::Concern

    included do
      has_many :reactions, class_name: 'UserRecipeReaction'

      scope :liked_by, ->(user) { joins(:reactions).where('users_have_recipes_reaction.user_id = ?', user.id) }
    end

    def liked_by?(user)
      reactions.where(user:).any?
    end

    def like!
      reactions.create(user: Current.user)
    end

    def unlike!
      reactions.where(user: Current.user).destroy_all
    end
  end
end