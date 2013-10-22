module NavigationHelpers

  class NavLink
    def initialize attributes
      @name = attributes[:name]
      @title = attributes[:title]
      @path = attributes[:path]
    end

    def title
      @title || @name.camelize
    end

    def path
      @path || @name
    end

    def url
     "/#{path}"
    end

    def css_class current_path
      css_class = @name
      area = (current_path.gsub('index.html', '')).split('/').first || ''
      css_class += ' current' if area == path
      css_class
    end
  end

  def nav_links
    [
      NavLink.new(:name => '', :title => 'Home' ),
      NavLink.new(:name => 'about', :title => 'About Nancy'),
      NavLink.new(:name => 'wedding-dresses', :title => 'Wedding Dresses'),
      NavLink.new(:name => 'contact' ),
      NavLink.new(:name => 'press'),
      NavLink.new(:name => 'friends')
    ]
  end
end