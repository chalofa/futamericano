Fabricator :coach do
  name        { Faker::Name.name }
  state       :active
end

Fabricator :coach_active, from: :coach do
  team
end

Fabricator :coach_john, from: :coach_active, aliases: :coach_default do
  name        'John Madden'
end
