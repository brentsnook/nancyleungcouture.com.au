module HomeHelpers
  def hero_images
    sitemap.resources.select do |resource|
      resource.path.start_with? "img/hero/"
    end.collect{ |resource| "/#{resource.path}" }
  end
end