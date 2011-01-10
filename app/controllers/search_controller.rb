class SearchController < ApplicationController
  def index
    @album_results = Album.search(params[:search], :star => true)
    @track_results = Track.search(params[:search], :star => true)
  end
end
