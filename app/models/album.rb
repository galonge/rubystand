class Album

  @@datadir = 'data'
  @@metafile = 'album.yaml'
  attr_accessor :path
  attr_accessor :metadata_path
  attr_accessor :metadata
  attr_accessor :title
  attr_accessor :year
  attr_accessor :images

  def self.all
    Pathname.glob("#{@@datadir}/*/").collect { |path| Album.new(File.basename(path)) }
  end

  def initialize(album_path)
    self.path = "#{@@datadir}/#{album_path}"

    self.metadata_path = "#{self.path}/#{@@metafile}"
    if File.exist?(metadata_path)
      self.metadata = YAML::load(File.open(metadata_path))
    end 

    self.images = Pathname.glob("#{self.path}/*.jpg").collect { |path| Image.new("#{album_path}/#{File.basename(path)}") }

    self.title = metadata['title'] rescue File.basename(self.path)
    self.year = metadata['year'] rescue ""

  end
  
end