# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { 'List1' }
    user
    access
  end
end
