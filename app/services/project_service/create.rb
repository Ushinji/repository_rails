class ProjectService::Create
  include ActiveModel::Model

  attr_accessor :display_name

  validates :display_name, presence: true

  def exec
    return false if self.valid?
    ProjectRepository.new.create({
      display_name: self.display_name
    })
    true
  end
end
