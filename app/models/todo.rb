# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :list
  belongs_to :status

  validates :name, presence: true
  default_scope { order(:created_at) }
end
