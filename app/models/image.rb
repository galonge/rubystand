class Image

  attr_accessor :path
  attr_accessor :title
  attr_accessor :desc

  def initialize(path, metadata)
    self.path = path

    if metadata && metadata[File.basename(self.path)]
      self.title = metadata[File.basename(self.path)]['title']
    end

  end

end