class Volunteer
  attr_accessor(:name, :project_id)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
  end

  def self.all
    all_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    all_volunteers.each do |volunteer|
    volunteers.push(Volunteer.new({:name => name, :project_id => project_id}))
    end
    volunteers
  end
end
