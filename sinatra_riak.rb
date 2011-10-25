require 'rubygems'
require 'sinatra/base'
require 'riak'
require 'haml'


class SinatraRiak < Sinatra::Base
  enable :sessions
  
  set :haml, :format => :html5

  before do 
    @client = Riak::Client.new(:port => 8091)
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

end
