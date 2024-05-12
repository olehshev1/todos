# frozen_string_literal: true

if List.count.zero?
  puts 'Seeding Lists'
  List.create!(name: 'To-do List #1', access_id: 1, user_id: User.find_by(admin_role: true).id)
  List.create!(name: 'To-do List #2', access_id: 2, user_id: User.find_by(admin_role: true).id)
  List.create!(name: 'To-do List #3', access_id: 3, user_id: User.find_by(admin_role: true).id)

  List.create!(name: 'To-do List #4', access_id: 1, user_id: User.find_by(user_role: true).id)
  List.create!(name: 'To-do List #5', access_id: 2, user_id: User.find_by(user_role: true).id)
  List.create!(name: 'To-do List #6', access_id: 3, user_id: User.find_by(user_role: true).id)
end
