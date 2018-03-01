#Volunteer Tracker

####An Application that allows you to schedule volunteers, update their names, and create tasks at the Walt Disney Family Museum.

#### By Katie Fujihara
## Description

#Backend
##There is a database called volunteer_tracker and two tables, one called projects, and the other called volunteers. Both can be accessed through psql.

#Frontend Requirements
##As a non-profit employee, I want to view, add, update and delete projects.
##As a non-profit employee, I want to view and add volunteers.
##As a non-profit employee, I want to add volunteers to a project.

#Views
##The first view is the home page which splits off into Adminstrator and Volunteers. In the Administrator portal, you can handle creating new projects and viewing the projects. In the volunteers portal, you can add volunteers to projects, view volunteers, and change the name of the person being assigned to a specific project. From the administrator portal you can edit the project title and delete projects.

## Setup/Installation Requirements

* git clone https://github.com/KaitlynFujihara/volunteer_tracker
* run ruby app.rb in your console
* open psql and navigate to volunteer_tracker if you would like to make specific queries
* click on administrator portal to create projects
* click on current vollunters to see current volunteers and assign a new volunteer to an existing projects

## Known Bugs

Having issues with project_id vs. volunteer_id and routing.

## Support and contact details

contact katiefujihara@gmail.com

## Technologies Used

Ruby, Sinatra, PostgreSQL, Javascript, HTML, CSS

### License

MIT

Copyright (c) 2018 **Katie Fujihara**
