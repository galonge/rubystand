class Image

  attr_accessor :path
  attr_accessor :title
  attr_accessor :desc

  def initialize(path)
    self.path = path
    self.title = "My title"
  end

end