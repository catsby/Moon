require 'rubygems'
require 'sinatra/base'
require 'riak'


class SinatraRiak < Sinatra::Base
  enable :sessions

  get '/' do
    @message = 'Riak World!'
  end

end
