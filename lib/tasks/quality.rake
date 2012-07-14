namespace :quality do

  desc 'Rails Best Practices code quality metrics'
  task :rails_best_practices do
    system 'rails_best_practices --silent --without-color -o app,lib,config -x \.rake$,config/initializers/'
  end

  #desc 'Reek code quality metrics'
  task :reek do
    system 'reek -q app'
  end

  desc 'Roodi code quality metrics'
  task :roodi do
    system 'roodi -config=config/roodi.yml app/**/*.rb lib/**/*.rb'
  end

  task all: [:rails_best_practices, :roodi]
end

desc 'Code quality metrics (all)'
task quality: 'quality:all'
