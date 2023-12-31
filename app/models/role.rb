# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
