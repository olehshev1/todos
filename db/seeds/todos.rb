# frozen_string_literal: true

if Todo.count.zero?
  puts 'Seeding Todos'
  Todo.create!(name: 'To-do #1-1', list_id: 1, status_id: 1)
  Todo.create!(name: 'To-do #1-2', list_id: 1, status_id: 1)
  Todo.create!(name: 'To-do #1-3', list_id: 1, status_id: 3)

  Todo.create!(name: 'To-do #2-1', list_id: 2, status_id: 2)
  Todo.create!(name: 'To-do #2-2', list_id: 2, status_id: 2)
  Todo.create!(name: 'To-do #2-3', list_id: 2, status_id: 3)

  Todo.create!(name: 'To-do #3-1', list_id: 3, status_id: 1)
  Todo.create!(name: 'To-do #3-2', list_id: 3, status_id: 1)
  Todo.create!(name: 'To-do #3-3', list_id: 3, status_id: 2)

  Todo.create!(name: 'To-do #4-1', list_id: 4, status_id: 1)
  Todo.create!(name: 'To-do #4-2', list_id: 4, status_id: 2)
  Todo.create!(name: 'To-do #4-3', list_id: 4, status_id: 3)

  Todo.create!(name: 'To-do #5-1', list_id: 5, status_id: 1)
  Todo.create!(name: 'To-do #5-2', list_id: 5, status_id: 2)
  Todo.create!(name: 'To-do #5-3', list_id: 5, status_id: 2)

  Todo.create!(name: 'To-do #6-1', list_id: 6, status_id: 3)
  Todo.create!(name: 'To-do #6-2', list_id: 6, status_id: 1)
  Todo.create!(name: 'To-do #6-3', list_id: 6, status_id: 1)
end
