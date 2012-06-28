# encoding: utf-8

#-------------------------------------------------------------------------
# Helper for general stuff
#-------------------------------------------------------------------------

module ApplicationHelper

  # Default page title, to overwrite set an instance variable
  def page_title
    title = @page_title || 'resultados e información sobre la NFL y el Futbol Americano.'
    "FutAmericano.com: #{title}"
  end


  # Only activate Google Fonts when production
  def google_font_tag
    stylesheet_link_tag 'http://fonts.googleapis.com/css?family=Cuprum|Open+Sans:400,700' if Rails.env.production?
  end


  # Create a link using sprites (hidden text for text browsers and bots)
  def sprite_link_to(text, uri, html_options)
    link_to content_tag(:span, text, :class => :hide), uri, html_options
  end

end

