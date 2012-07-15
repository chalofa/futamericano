ActiveAdmin.register Season do
  scope_to(association_method: :unscoped) { Season }

  config.sort_order = :year_desc

end
