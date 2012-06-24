# Generator Defaults

Futamericano::Application.config.generators do |g|
  g.test_framework :rspec, fixture: false, view_specs: false
  g.fixture_replacement :fabrication
end
