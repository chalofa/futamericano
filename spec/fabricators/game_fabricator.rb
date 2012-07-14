Fabricator :game do
  away_score  { rand(7) * rand(3) }
  away_team(fabricator: :team)
  game_date   { rand(20).minutes.ago.to_date }
  home_score  { rand(7) * rand(3) }
  scheduled_at  { rand(20).minutes.ago }
  state       :active
  team
  time_over   false
  week
end

Fabricator :game_pending, from: :game do
  state       :pending
  game_date   { rand(20).days.from_now.to_date }
  scheduled_at  { rand(20).days.from_now }
end

Fabricator :game_finished, from: :game do
  state       :finished
  game_date   { rand(20).days.ago.to_date }
  scheduled_at  { rand(20).days.ago }
end
