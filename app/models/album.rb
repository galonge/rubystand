class Album

  @@datadir = 'data'
  @@metafile = 'album.yaml'
  attr_accessor :path
  attr_accessor :metadata_path
  attr_accessor :metadata
  attr_accessor :title
  attr_accessor :year

  def self.all
    Pathname.glob("#{@@datadir}/*/").collect { |path| Album.new(path) }

  end

  def initialize(path)
    self.path = path

    self.metadata_path = "#{self.path}#{@@metafile}"
    if File.exist?(metadata_path)
      self.metadata = YAML::load(File.open(metadata_path))
    end

    self.title = metadata['title'] rescue File.basename(self.path)
    self.year = metadata['year'] rescue ""
  end
  
end