class Volunteer
  attr_accessor(:name, :project_id)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id].to_i
    @id = attributes[:id]

  end

  def self.all
    all_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    all_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id")
      id = volunteer.fetch("id").to_i()
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")
    name = result.first().fetch("name")
    project_id = result.first().fetch("project_id")
    Volunteer.new({:name => name, :project_id => project_id, :id => id})
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name).&(self.project_id().==(another_volunteer.project_id))
  end
end
