# frozen_string_literal: true

if Access.count.zero?
  puts 'Seeding Accesses'
  Access.create!(name: 'Public')
  Access.create!(name: 'Protect')
  Access.create!(name: 'Private')
end
