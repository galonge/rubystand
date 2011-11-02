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
    albums = Pathname.glob("#{@@datadir}/*/").collect { |path| [File.basename(path), Album.new(File.basename(path))] }
    Hash[albums]
  end

  def initialize(album_path)
    self.path = album_path

    self.metadata_path = "#{@@datadir}/#{self.path}/#{@@metafile}"
    if File.exist?(metadata_path)
      self.metadata = YAML::load(File.open(metadata_path))
    end 

    self.images = Pathname.glob("#{@@datadir}/#{self.path}/*.jpg").collect { |path| Image.new("#{album_path}/#{File.basename(path)}") }

    self.title = metadata['title'] rescue File.basename("#{@@datadir}/#{self.path}")
    self.year = metadata['year'] rescue ""

  end
  
end