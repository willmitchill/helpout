
require 'pry'
####HELPERS#####

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if
    session[:user_id]
  end
end

get '/' do
  erb :index
end

######### LOGIN / LOGOUT ###########

get '/login' do
  erb :login
end

post '/login' do
   @user = User.find_by(
    username: params[:username],
    password: params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/projects'
    @login_failed = false
  else
    @login_failed = true
    erb :login
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end


###### SIGN UP #######

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    org_name: params[:org_name],
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/projects'
  else
    erb :'signup'
  end
end

###### DASHBOARD #######


get '/projects' do
  @projects = Project.all.order(:start_date)
  erb :projects
end

##### NEW PROJECT ######

get '/new_project' do
  erb :new_project
end

post '/new_project' do
  @project = Project.new(
    name: params[:name],
    start_date: params[:start_date],
    end_date: params[:end_date],
    location: params[:location],
    bio: params[:bio],
    number_of_vols: params[:number_of_vols]
    )
  if @project.save
    redirect '/projects'
  else
    erb :new_projects
  end
end


####### USER PROFILE #######

get '/users/:id' do
  @user_projects = Project.where("user_id = ?", params[:id].to_i)
  @user = User.find(params[:id])
  erb :'user_profile'
end

post '/users/:id' do
    current_user.file = params[:uploaded_file]
    current_user.save
    redirect "/users/#{params[:id]}"
end

###### PROJECT PAGE #########

get 'projects/:id' do

  @project_id = Project.find_by(params[:id])
  erb :'project_profile'
end
