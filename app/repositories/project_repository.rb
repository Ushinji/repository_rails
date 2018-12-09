class ProjectRepository
  include ApiClient
  setting Rails.application.config.main_service

  def find_all
    res = get("/accounts")
    json = JSON.parse(res.body)
    json.map { |p| ProjectEntity.new(p) }
  end
end