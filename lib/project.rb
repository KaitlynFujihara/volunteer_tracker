class Project
  attr_accessor(:title, :project_id)
  attr_reader(:id)

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all
    all_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    all_projects.each do |project|
      title = project.fetch("title")
      project_id = project.fetch("id").to_i()
      id = project.fetch("id").to_i()
    projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    title = result.first().fetch("title")
    project_id = result.first().fetch("id")
    Project.new({:title => title, :id => id})
  end

  def volunteers
    volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
    list_volunteers = []
    volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id")
      list_volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    list_volunteers
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = self.id()
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_project)
    self.title().==(another_project.title).&(self.id().==(another_project.id))
  end
end
