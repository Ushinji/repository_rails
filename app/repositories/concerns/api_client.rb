module ApiClient
  extend ActiveSupport::Concern

  class_methods do
    def setting(config)
      @config = config
    end

    def config
      @config
    end
  end

  def get(path, params = nil, headers = {})
    conn.get(path) do |req|
      headers.each do |name, value|
        req.headers[name] = value
      end
      req.params = params if params
    end
  end

  def conn
    config = self.class.config
    Faraday.new(:url => config[:url]) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
