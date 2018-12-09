class ProjectEntity
  include Virtus.model

  attribute :id, Integer
  attribute :display_name, String

  def as_json(options = {})
    {
      display_name: self.display_name,
    }
  end
end
