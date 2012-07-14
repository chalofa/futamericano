Fabricator :week do
  number      { rand(17) + 1 }
  season
  state       :active
  week_type   { %w(REG PRE POST).sample }
end

Fabricator :week_pending, from: :week do
  state       :pending
end
