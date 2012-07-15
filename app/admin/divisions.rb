ActiveAdmin.register Division do
  scope_to(association_method: :unscoped) { Division }

end
