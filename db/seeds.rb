require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Category.destroy_all

Category.create(name:'Business')
Category.create(name:'Politics')
Category.create(name:'Motivational')
Category.create(name:'Technology')
Category.create(name:'Economics')
Category.create(name:'Education')
Category.create(name:'Celebrity')

postcodes = ['YO23 3RN', 'HD1 4SH', 'EX11 1LF', 'NE49 9JR', 'TA12 6BP', 'NP8 1DJ', 'PE11 2QR', 'OL2 8QW', 'PE31 7LD', 'NN9 6UT', 'W8 5AR', 'TD9 0BA', 'TS14 6QW', 'BA11 2DW', 'L70 1ET', 'DE65 6PR', 'DY6 9LU', 'NE83 7ZU', 'PO11 0ED', 'SS15 6BZ', 'BS25 1QZ', 'PO8 9BP', 'ST10 1YD', 'N5 2EN', 'DN5 0NB', 'LE9 4BY', 'DG4 6BD', 'WS13 6JB', 'NW9 9TT']
bio = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio nisi dolor aut vitae voluptates error iste magni placeat, id non maxime tenetur, fugiat dolorum velit consequatur consectetur qui, culpa laudantium.'
talk_type = ['Seminar', 'Workshop', 'Keynote Address', 'Training Session', 'Industry Talk', 'Entertainment Event', 'Motivational Talk', 'Educational Talk', 'Panel']

postcodes.each do |postcode|
  name = Faker::Name.first_name
  user = User.new({
    title: ['Mr', 'Mrs', 'Ms'].sample,
    first_name: name,
    last_name: Faker::Name.last_name,
    password: 'password',
    email: Faker::Internet.email(name),
    is_speaker: true,
    address: Faker::Address.street_address,
    postcode: postcode,
    city: Faker::Address.city,
    cost_cents: rand(15..100) * 1000,
    travel_distance: rand(2..100) * 100,
    speaker_blurb: bio

  })
  user.save!
end

User.all.each do |user|
  date = Faker::Date.between(3.days.from_now, 50.days.from_now)
  rand(1..3).times do
    categories = Category.all.reject { |category| user.categories.include?(category) }
    tag = UserTag.new
    tag.user = user
    tag.category = categories.sample
    tag.save!
  end
  event = Event.new({
    name: "#{user.first_name}'s Birthday",
    address: user.address,
    postcode: user.postcode,
    start_date: date,
    end_date: date,
    talk_type: talk_type.sample,
    description: bio,
    expenses_hotels: rand(1..2) > 1,
    expenses_flights: rand(1..2) > 1,
    expenses_per_diems: rand(1..2) > 1,
    is_paid: rand(1..2) > 1
  })
  event.user = user
  event.save!
  rand(1..3).times do
    categories = Category.all.reject { |category| user.categories.include?(category) }
    tag = EventTag.new
    tag.event = event
    tag.category = categories.sample
    tag.save!
  end
end
