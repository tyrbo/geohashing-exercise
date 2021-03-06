require "bundler"
Bundler.require

require "sinatra"
require "json"

require_relative "./lib/geohash_service"

module GeohashingExercise
  class Application < Sinatra::Base
    get "/geohash" do
      content_type :json

      GeohashService.new(latitude: params[:lat], longitude: params[:lon]).call
    end
  end
end

run GeohashingExercise::Application
