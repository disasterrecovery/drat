require 'rack/contrib'

class API < Grape::API
  use Rack::JSONP

  version 'v1', :using => :path, :format => :json

  # Rescues
  rescue_from ActiveRecord::RecordNotFound do |e|
    rack_response({:errors => e.message})
  end

  rescue_from Grape::Exceptions::Validation do |e|
    Rack::Response.new({
        'status' => e.status,
        'message' => e.message,
        'param' => e.param
    }.to_json, e.status)
  end

  #API Routes

  # Resources LookUp by Variety of Params (Index) and ID (Show)
  resource :resources do
    desc "Request Resources By Params"
    get do
      rrs = RecoveryResource.all
      rrs.map { |rr| API::RecoveryResourceSerializer.new(rr) }
    end

    params do
      requires :id, :type => Integer, :desc => "RecoveryResource id."
    end
    desc "get by id"
    get ':id' do
      RecoveryResource.includes(:categories).find(params[:id])
    end

  end

end
