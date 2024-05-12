# frozen_string_literal: true

class Access < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates :name, presence: true
  default_scope { order(:created_at) }
  scope :protect, -> { where(name: 'Protect') }
end
