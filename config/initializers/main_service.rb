main_service_config = {
  url: Rails.env.production? ? 'http://example.main.service' : 'http://localhost:4000'
}

Rails.application.config.main_service = main_service_config
