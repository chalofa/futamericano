ActiveAdmin.register Game do
  scope_to(association_method: :unscoped) { Game }

  config.sort_order = :default_sort_desc

end
