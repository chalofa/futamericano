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
  away_score  nil
  home_score  nil
  state       :pending
  scheduled_at  { rand(20).days.from_now }
end

Fabricator :game_finished, from: :game do
  state       :finished
  scheduled_at  { rand(20).days.ago }
end

Fabricator :game_default_pending, from: :game_pending do
  team(fabricator: :team_default)
  away_team(fabricator: :team_default_away)
  scheduled_at  Time.zone.parse('next sunday at 12:00pm')
end
