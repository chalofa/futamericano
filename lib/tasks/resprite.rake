require 'sprite_factory'

namespace :assets do

  desc 'Re-create sprite images and their CSS'
  task :resprite => :environment do
    images_dir = Rails.root.join('app', 'assets', 'images')
    sprites_dir= Rails.root.join('lib', 'assets', 'stylesheets', 'sprites')
    output_dir = Rails.root.join('lib', 'assets', 'images')
    system "mkdir -p #{output_dir} #{sprites_dir}"  # make sure directory exists TODO: remove later
    SpriteFactory.library = :chunkypng
    SpriteFactory.layout = :packed
    SpriteFactory.style = :sass
    SpriteFactory.csspath = "<%= image_path('$IMAGE') %>"

    %w(ui).each do |group|
      SpriteFactory.run!(images_dir.join(group), margin: 10, selector: ".#{group}-",
                         output_style: sprites_dir.join("#{group}.css.sass"),
                         output_image: output_dir.join("#{group}.png"))  do |images|
        images.reduce('') do |acum, (name, image)|
          acum << <<EOS

.#{group}-#{name}
  background: image-url('#{group}.png') -#{image[:x]}px -#{image[:y]}px no-repeat
  width: #{image[:width]}px
  height: #{image[:height]}px
EOS
        end
      end
    end
  end

end
