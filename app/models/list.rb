# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user
  belongs_to :access
  has_many :todos, dependent: :destroy

  validates :name, presence: true
  default_scope { order(:created_at) }

  def todos_complete
    status_id = Status.find_by(name: 'Complete').id
    if todos.count.zero?
      0
    else
      (todos.where(status_id: status_id).count / todos.count.to_f).round(2) * 100
    end
  end
end
