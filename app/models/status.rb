# frozen_string_literal: true

class Status < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :name, presence: true
end
