Fabricator :team do
  area        { Faker::Address.state }
  city        { Faker::Address.city }
  name        { Faker::Name.first_name }
  short       { SecureRandom.hex.last(3).upcase }
  stadium     { Faker::Name.last_name }
  state       :active
  web         { Faker::Internet.domain_name }
  year        { (rand(30) + 15).years.ago.year }
end

Fabricator :team_colts, from: :team, aliases: :team_default do
  name        'Colts'
  short       'IND'
  city        'Indianapolis'
end

Fabricator :team_default_away, from: :team do
  name        '49ers'
  short       'SF'
  city        'San Francisco'
end
