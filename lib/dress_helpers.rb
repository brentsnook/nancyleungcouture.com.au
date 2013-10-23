module DressHelpers

  class Dress

    attr_reader :name
    attr_accessor :sitemap

    def initialize attributes
      @name = attributes[:name].downcase
      @index = attributes[:index]
    end

    ALL = [
      'jessica',
      'tallulah',
      'emily',
      'natalie',
      'jamie-lee',
      'kirsten',
      'audrey',
      'kaya',
      'lorelei',
      'amber',
      'kate',
      'indiana'
    ].each_with_index.map do |name, index|
      Dress.new(:name => name, :index => index)
    end

    def url
      "/wedding-dresses/#{@name}.html"
    end

    def alt
      "#{@name} wedding dress"
    end

    def large_images
      images.select{ |image| image.end_with? 'large.jpg' }
    end

    def small_images
      images.select{ |image| image.end_with? 'small.jpg' }
    end

    def images
      sitemap.resources.select do |resource|
        resource.path.start_with? "img/wedding-dresses/#{@name}/"
      end.collect{ |resource| "/#{resource.path}" }
    end

    def previous
      prev_index = @index - 1
      ALL[prev_index] if prev_index >= 0
    end

    def next
      ALL[@index + 1]
    end
  end

  def dresses
    Dress::ALL
  end

  def current_dress
    dresses.find {|dress| dress.name == current_page.data.dress_name }
  end
end