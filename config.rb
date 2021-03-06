set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

with_layout :dress do
  page "/wedding-dresses/*"
end

activate :blog do |blog|
  blog.prefix = 'press'
  blog.permalink = ':year/:month/:day/:title.html'
  blog.sources = ':year-:month-:day-:title.html'
  blog.taglink = 'tags/:tag.html'
  blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end

activate :directory_indexes

configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-00000000-0'
  end
end

configure :build do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-39156490-1'
  end
end

page '/feed.xml', :layout => false

require 'lib/navigation_helpers'
require 'lib/metadata_helpers'
require 'lib/dress_helpers'
require 'lib/home_helpers'

helpers NavigationHelpers
helpers MetadataHelpers
helpers DressHelpers
helpers HomeHelpers

ready do
  # we have to inject the sitemap because it isn't initialised until
  # after the dresses have been created
  dresses.each{|dress| dress.sitemap = sitemap }
end
