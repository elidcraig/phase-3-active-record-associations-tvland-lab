require 'pry'

days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
seasons = ['Fall', 'Winter', 'Spring', 'Summer']

puts 'Clearing out old data...'

Actor.destroy_all
Character.destroy_all
Network.destroy_all
Show.destroy_all

puts 'Seeding new data...'

channels = [1, 2, 3, 4, 15, 16, 34, 52]
channels.each do |channel|
  Network.create(channel: channel, call_letters: Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 4).upcase)
end

30.times do
  Actor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

network_ids = Network.all
actors = Actor.all

10.times do
  show = Show.create(name: Faker::Movie.title, day: days.sample, season: seasons.sample, genre: Faker::Book.genre, network: network_ids.sample)

  5.times do
    Character.create(name: Faker::Name.first_name, catchphrase: Faker::Movie.quote, show: show, actor: actors.sample) 
  end
end
# actors
# shows
# characters

puts 'Data planted!'