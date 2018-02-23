class Volunteer
  attr_accessor(:name, :project_id)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id].to_i
  end

  def self.all
    all_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    all_volunteers.each do |volunteer|
    volunteers.push(Volunteer.new({:name => volunteer['name'], :project_id => volunteer['project_id']}))
    end
    volunteers
  end

  def save
    DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id});")
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name).&(self.project_id().==(another_volunteer.project_id))
  end
end
