require_relative 'post'
require_relative 'memo'
require_relative 'link'
require_relative 'task'

puts 'Привет, я твой блокнот! Версия 2.0 + SQLite'
puts
puts 'Что хотите записать в блокнот?'

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = gets.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console

id = entry.save_to_db

puts 'Ваша запись сохранена, id = #{id}'
