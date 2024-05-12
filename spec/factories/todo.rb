# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    name { 'Todo1' }
    list
    status
  end
end
