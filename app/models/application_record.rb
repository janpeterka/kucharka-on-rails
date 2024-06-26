# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # before_validation :set_created_by, on: :create

  # def set_created_by
  #   self.created_by = current_user.id if respond_to?(:created_by) && current_user.present?
  #   self.author = current_user if respond_to?(:author) && current_user.present?
  # end

  def to_combobox_display
    if respond_to?(:name)
      name
    else
      raise "Implement to_combobox_display for #{self.class}"
    end
  end
end
