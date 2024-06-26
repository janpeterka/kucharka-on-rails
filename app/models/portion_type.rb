# frozen_string_literal: true

class PortionType < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :created_by

  validates :name, presence: true, uniqueness: { scope: :created_by }
  validates :size, presence: true, numericality: { greater_than: 0 }

  scope :used, -> { joins(:portions).where("portions.id IS NOT NULL").distinct.any? }
end
