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

get('/administrator') do
  @project_list = Project.all
  erb(:administrator)
end

post('/administrator') do
  title = params[:title]
  project = Project.new({:title => title})
  project.save
  @project_list = Project.all
  erb(:administrator)
end

get('/administrator/:id') do
  @find_id = Project.find(params[:id])
  title = params[:title]
  erb(:projects)
end


post('/adminstrator/:id') do
  @find_id = Project.find(params[:id])
  project = Project.new({:title => title})
  title = params[:title]
  project.save
 erb(:projects)
end

get('/volunteers') do
  name = params[:name]
  project_id = params[:project_id]
  volunteer = Volunteer.new({:name => name, :project_id => project_id})
  @project_list = Project.all
  erb(:volunteers)
end

post('/volunteers') do
  name = params[:name]
  project_id = params[:project_id]
  volunteer = Volunteer.new({:name => name, :project_id => project_id})
  @project_list = Project.all
  @project_list.volunteers
  erb(:volunteers)
end

patch("/volunteers/:id") do
  name = params.fetch("name")
  @find_id = Project.find(params.fetch("id").to_i())
  @find_id.update({:name => name})
  erb(:volunteers)
end
