Fabricator :team do
  area        { Faker::Address.state }
  city        { Faker::Address.city }
  name        { Faker::Name.first_name }
  short       { rand(512).to_s(16) }
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
