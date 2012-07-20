Fabricator :week do
  number      { rand(17) + 1 }
  season
  state       :active
  week_type   { %w(REG PRE POST).sample }
end

Fabricator :week_pending, from: :week do
  state       :pending
end

Fabricator :week_default_pending, from: :week_pending do
  week_type   'REG'
  number      1
  after_create do |week|
    week.games << Fabricate(:game_default_pending, week: week)
  end
end
