class HomeController < ApplicationController

  def index
    @albums = Album.all

    selection = params[:album]
    if selection.blank?
      @album = nil
    else
      @album = @albums[selection]
    end

  end

end
