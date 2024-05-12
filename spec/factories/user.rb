# frozen_string_literal: true

FactoryBot.define do
  factory :user do |f|
    f.sequence(:email) { |n| "user#{n}@gmail.com" }
    password { '123456' }
    username { 'John Dow' }
    admin_role { true }
  end
end
