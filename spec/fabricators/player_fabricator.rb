Fabricator :player do
  debut       1980
  name        { Faker::Name.name }
  state       :active
  pos         { rand(255).to_s(16) }
end

Fabricator :player_walter, from: :player, aliases: :player_default do
  debut       1975
  name        'Walter Payton'
  pos         'RB'
end

Fabricator :player_active, from: :player do
  team
end

Fabricator :player_andrew, from: :player_active do
  debut       2012
  name        'Andrew Luck'
  pos         'QB'
end
