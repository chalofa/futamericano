Fabricator :division do
  name        { Faker::Name.first_name.first(5) }
  conference  { %w(AFC NFC).sample }
  state       :active
  position    { sequence(:conference, 1) }
end

Fabricator :division_afc, from: :division do
  conference  'AFC'
end

Fabricator :division_nfc, from: :division do
  conference  'NFC'
end
