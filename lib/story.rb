class Story
  attr_reader :id, :headline, :body

  def initialize(args = {})
    @id       = args[:id]
    @headline = args[:headline]
    @body     = args[:body]
  end
end