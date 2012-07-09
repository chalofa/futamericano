Fabricator(:admin_user) do
  email         { sequence { |i| "admin_#{i}@futamericano.com" } }
  password      '123456'
  password_confirmation '123456'
end
