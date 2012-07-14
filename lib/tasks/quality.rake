namespace :quality do

  desc 'Rails Best Practices code quality metrics'
  task :rails_best_practices do
    system 'rails_best_practices --silent --without-color -o app,lib,config -x \.rake$,config/initializers/'
  end

  #desc 'Reek code quality metrics'
  task :reek do
    system 'reek -q app'
  end

  desc 'All code quality metrics'
  task all: [:rails_best_practices]
end
