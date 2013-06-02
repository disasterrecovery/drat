module RAT
  class API < Grape::API
    version 'v1', :using => :path, :format => :json

    resource :resources do
      desc "Request Resources By Params"
      get do
        RecoveryResource.last
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
