require 'rack/contrib'

module RAT
  class API < Grape::API
    use Rack::JSONP

    version 'v1', :using => :path, :format => :json

    #Rescue errors
    rescue_from :all do |e|
      rack_response({:message => e.message})
    end

    #Resources LookUp by Variety of Params (Index) and ID (Show)
    resource :resources do
      desc "Request Resources By Params"
      get do
        RecoveryResource.all
      end

      params do
        requires :id, :type => Integer, :desc => "RecoveryResource id."
      end
      desc "get by id"
      get ':id' do
        RecoveryResource.find(params[:id])
      end

    end

  end
end
