class HomeController < ApplicationController

  def index
    @albums = Album.all_by_year
    @album = Album.find(params[:album])
  end

end
