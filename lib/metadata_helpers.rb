module MetadataHelpers

  def title
    "#{current_page.data.title + ' - ' if current_page.data.title }Nancy Leung Couture"
  end

  def description
    current_page.data.description || title
  end

  def canonicalise url
    "http://nancyleungcouture.com.au#{url}"
  end

  def canonical_url
    canonicalise current_page.url
  end

  def image
    canonicalise(current_page.data.image || '/img/logo.png' )
  end
end