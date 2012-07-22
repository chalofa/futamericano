Fabricator :season, alias: :season_default do
  ends_at   { (rand(3) + 6).months.from_now }
  starts_at   { rand(6).months.from_now }
  state       :active
  year        Time.zone.now.year
end

Fabricator :season_pending, from: :season do
  year        { Time.zone.now.year + 1 + rand(3) }
  state       :pending
end

Fabricator :season_disabled, from: :season do
  state       :disabled
end

Fabricator :season_default_pending, from: :season_pending do
  year        Time.zone.now.year
  after_create do |season|
    #season.weeks << Fabricate(:week_default_finished, season: season)
    season.weeks << Fabricate(:week_default_active, season: season)
    season.weeks << Fabricate(:week_default_pending, season: season)
  end
end

