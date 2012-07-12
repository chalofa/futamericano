Fabricator :season do
  year        Time.zone.now.year
  state       :active
end

Fabricator :season_pending, from: :season do
  year        { Time.zone.now.year + 1 + rand(3) }
  state       :pending
end

Fabricator :season_disabled, from: :season do
  state       :disabled
end
