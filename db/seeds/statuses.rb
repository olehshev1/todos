# frozen_string_literal: true

if Status.count.zero?
  puts 'Seeding Statuses'
  Status.create!(name: 'Complete')
  Status.create!(name: 'Incomplete')
  Status.create!(name: 'In progress')
end
