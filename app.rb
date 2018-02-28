require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  erb(:home)
end

post('/') do
  erb(:home)
end

get('/projects') do
  @project_list = Project.all
  erb(:administrator)
end

post('/projects') do
  title = params[:title]
  project = Project.new({:title => title})
  project.save
  @project_list = Project.all
  erb(:administrator)
end

get('/projects/:id') do
  @find_id = Project.find(params[:id])
  title = params[:title]
  erb(:projects)
end

post('/projects/:id') do
  @find_id = Project.find(params[:id])
  project = Project.new({:title => title})
  title = params[:title]
  project.save
  name = params[:name]
  project_id = params[:project_id]
  volunteer = Volunteer.new({:name => name, :project_id => project_id})
  volunteer.save
  @project_list = Project.all
  @volunteer_list = Volunteer.all
 erb(:projects)
end

get("/projects/:id/edit") do
  @find_id = Project.find(params.fetch("id").to_i())
  erb(:update)

end

patch("/projects/:id") do
  title = params[:title]
  @find_id = Project.find(params.fetch("id").to_i())
  @find_id.update({:title => title})
  @find_id.save
  erb(:projects)
end

delete("/projects/:id") do
  @find_id = Project.find(params.fetch("id").to_i())
  @find_id.delete()
  @find_id = Project.all()
  erb(:projects)
end

get('/volunteers') do
  @volunteer_list = Volunteer.all
  @project_list = Project.all
  erb(:volunteers)
end

post('/volunteers') do
  name = params[:name]
  project_id = params[:project_id]
  volunteer = Volunteer.new({:name => name, :project_id => project_id})
  volunteer.save
  @project_list = Project.all
  @volunteer_list = Volunteer.all

  erb(:volunteers)
end
