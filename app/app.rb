ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  post '/links' do
    link = Link.new(url: params[:URL],
    title: params[:Title])
  #  Link.create(url: params[:URL], title: params[:Title])
   tag = Tag.create(name: params[:Tags])
   link.tags << tag
   link.save
   redirect to('/links')
  end

  get '/links/new' do
    erb(:'links/new')
  end

end
