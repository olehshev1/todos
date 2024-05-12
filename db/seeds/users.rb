# frozen_string_literal: true

if User.count.zero?
  puts 'Seeding Users'
  User.create!(email: 'admin@gmail.com', username: 'Admin', password: '123456', admin_role: true)
  User.create!(email: 'john@dow.com', username: 'John Dow', password: '123456', user_role: true)
end
