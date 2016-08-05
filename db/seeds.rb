fake_users = []
fake_users_credentials = [
  { username: "account_1", password: "password_1", },
  { username: "account_2", password: "password_2", },
  { username: "account_3", password: "password_3", },
  { username: "account_4", password: "password_4", },
]
puts "# Creating #{fake_users_credentials.length} #{'fake_user'.pluralize(fake_users_credentials.length)}"
fake_users_credentials.each do |fake_user|
  User.create!(
    username: fake_user[:username],
    password: fake_user[:password],
    password_confirmation: fake_user[:password]).tap do |user|
      puts "| Created user [\"#{user.username}\", \"#{user.password}\"]"
      fake_users << user
    end
end

nb_stores = rand(3 .. 5)
puts "# Creating #{nb_stores} #{'store'.pluralize(nb_stores)}"
nb_stores.times do |index_store|
  store_name = Faker::Company.name
  store_address = sprintf('%s, %s %s (%s)',
    Faker::Address.street_address,
    Faker::Address.postcode,
    Faker::Address.city,
    Faker::Address.country_code,
  )
  Store.create!(name: store_name, address: store_address).tap do |store|
    puts "| Created store [#{store.name}]"
    nb_visits = rand(4 .. 12)
    puts "| | Creating #{nb_visits} #{'visit'.pluralize(nb_visits)} with report"
    nb_visits.times do |index_visit|
      nb_paragraphs = rand(2 .. 5)
      visit_report = Faker::Lorem.paragraphs(nb_paragraphs, true)
      store.visits.create!(report: visit_report, user: fake_users.sample)
    end
  end
end
