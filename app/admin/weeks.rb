ActiveAdmin.register Week do
  scope_to(association_method: :unscoped) { Week }

end
