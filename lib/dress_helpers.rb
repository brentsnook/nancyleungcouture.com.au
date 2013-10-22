module DressHelpers

  class Dress

    attr_reader :name

    def initialize attributes
      @name = attributes[:name].downcase
    end

    def url
      "wedding-dresses/#{@name}.html"
    end

    def small_image_url
      "wedding-dresses/#{@name}-small.jpg"
    end

    def large_image_url
      "wedding-dresses/#{@name}-large.jpg"
    end

    def alt
      "#{@name} wedding dress"
    end
  end

  def dresses
    [
      Dress.new(:name => 'jessica'),
      Dress.new(:name => 'tallulah'),
      Dress.new(:name => 'emily'),
      Dress.new(:name => 'natalie'),
      Dress.new(:name => 'jamie-lee'),
      Dress.new(:name => 'kirsten'),
      Dress.new(:name => 'audrey'),
      Dress.new(:name => 'kaya'),
      Dress.new(:name => 'lorelei'),
      Dress.new(:name => 'amber'),
      Dress.new(:name => 'kate'),
      Dress.new(:name => 'indiana')
    ]
  end

  def current_dress
    dresses.find {|dress| dress.name == current_page.data.name }
  end
end