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

get('/volunteers') do
  @project_list = Project.all
  @volunteers_list = Volunteer.all
  erb(:volunteers)
end

post('/volunteers') do
  @project_list = Project.all
  erb(:volunteers)
end

get('/operator/add_city') do
  @city_list = City_add.all
  erb(:add_city)
end

post('operator/add_city') do
  new_train = Train_add.new({:train_name => params[:train_name], :cities => params[:cities]})
  new_train.save
  route_list = new_train.get_route

  erb(:add_city)
end

get('/operator/add_train') do
  @train_list = Train_add.all
  erb(:add_train)
end

post('/operator/add_train') do
  new_train = Train_add.new({:train_name => params[:train_name], :cities => params[:cities]})
  new_train.save
  route_list = new_train.get_route
  erb(:add_train)
end

# delete("/operator/add_train/:id") do
#   @train_list = Train_add.find(params.fetch("id").to_i())
#   @train_list.delete()
#   @train_list = Train_add.all()
#   erb(:add_train)
# end

get('/timetable') do

  erb(:timetable)
end

get('/schedule') do
  Table.all

  erb(:get_times)
end

post('/schedule') do
  station_id = new_time.get_station_id
  train_id = new_time.get_train_id

  # new_time = Table.new({:station => station, :train => train, :time_of_day => time_of_day, :time => addtime})


  erb(:get_times)
end
