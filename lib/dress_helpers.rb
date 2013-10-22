module DressHelpers

  class Dress

    attr_reader :name

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

    def small_image_url number=1
      "/img/wedding-dresses/#{@name}/#{number}/small.jpg"
    end

    def large_image_url number=1
      "/img/wedding-dresses/#{@name}/#{number}/large.jpg"
    end

    def alt
      "#{@name} wedding dress"
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
    dresses.find {|dress| dress.name == current_page.data.name }
  end
end