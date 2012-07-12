Fabricator :channel do
  name        { Faker::Name.first_name }
  short       { rand(511).to_s(16) }
  state       :active
  url         { Faker::Internet.url }
end

Fabricator :channel_espn, from: :channel, aliases: :channel_default do
  name        'ESPN'
  short       'ESPN'
  url         'http://espndeportes.com'
end
