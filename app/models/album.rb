class Album

  @@datadir = 'public/data'
  @@metafile = 'album.yml'
  attr_accessor :path
  attr_accessor :metadata_path
  attr_accessor :metadata
  attr_accessor :title
  attr_accessor :year
  attr_accessor :images
  attr_accessor :description

  def self.all
    albums = Pathname.glob("#{@@datadir}/*/").collect { |path| [File.basename(path), Album.new(File.basename(path))] }
    Hash[albums]
  end

  def self.all_by_year
    albums_by_year = Hash.new { |hash, key| hash[key] = Array.new }
    Album.all.values.each do |album|
      if album.year.blank?
        albums_by_year["unknown"] << album
      else
        albums_by_year[album.year] << album
      end
    end

    albums_by_year.each_value do |array|
      array.sort_by!{|album| album.title}
    end

    Hash[albums_by_year.sort_by { |year, albums| year.to_s }.reverse!]
  end

  def self.find(name)
    Album.all[name]
  end

  def initialize(album_path)
    self.path = album_path

    self.metadata_path = "#{@@datadir}/#{self.path}/#{@@metafile}"
    if File.exist?(self.metadata_path)
      self.metadata = YAML::load(File.open(metadata_path))
    end 

    self.images = Pathname.glob("#{@@datadir}/#{self.path}/*.jpg").collect { |path| Image.new("#{album_path}/#{File.basename(path)}", (self.metadata['photos'] rescue nil)) }
    self.title = metadata['title'] rescue File.basename("#{@@datadir}/#{self.path}")

    if metadata
      self.year = metadata['year']
      self.description = metadata['description']
    end

  end
  
end