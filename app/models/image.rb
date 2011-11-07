class Image

  attr_accessor :path
  attr_accessor :thumb_path
  attr_accessor :title
  attr_accessor :name
  attr_accessor :desc

  def initialize(path, metadata)
    self.path = path
    self.thumb_path = "#{File.dirname(self.path)}/thumb/#{File.basename(self.path)}"
    self.name = "#{File.basename(self.path)}"

    if metadata && metadata[File.basename(self.path)]
      self.title = metadata[File.basename(self.path)]['title']
    end

  end

end