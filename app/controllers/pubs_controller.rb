class PubsController < ApplicationController
end

def index
  @pubs = Pub.all
  @markers = @pubs.geocoded.map do |pub|
    {
      lat: pub.latitude,
      lng: pub.longitude
    }
  end
end
