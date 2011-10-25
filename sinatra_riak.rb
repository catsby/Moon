require 'rubygems'
require 'sinatra/base'
require 'riak'
require 'haml'


class SinatraRiak < Sinatra::Base
  enable :sessions
  
  set :haml, :format => :html5

  before do 
    @client = Riak::Client.new(:host => 'localhost', :port => 8091)
  end

  get '/' do
    @buckets = @client.buckets
    haml :index
  end

  get '/bucket/:name' do |name|
    @bucket = @client.bucket(name)
    @keys = @bucket.keys
    haml :bucket
  end

  get '/bucket/:name/:key' do |name, key|
    @bucket = @client.bucket(name)
    @key    = @bucket.get(key)
    haml :key
  end

end
