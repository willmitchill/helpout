
require 'pry'

####HELPERS#####

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if
    session[:user_id]
  end

  def youtube_embed(youtube)
    if youtube[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

  %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
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
    number_of_vols: params[:number_of_vols],
    youtube: params[:youtube],
    user_id: current_user.id
      )
  if @project.save
    redirect '/projects'
  else
    erb :new_project
  end
end


####### USER PROFILE #######


get '/users/:id' do
  @projects = Project.all

  @user_commitments = Commitment.where("user_id = ?", params[:id].to_i)
  @user_projects = Project.where("user_id = ?", params[:id].to_i)
  @user = User.find(params[:id])
  @rated_user = Rating.where(params[:id])
  @score_average = @rated_user.average(:score).round(1)
    if @rated_user==nil
      puts "no ratings yet!"
    else
      @rated_user
    end
  erb :'user_profile'
end

post '/users/:id' do

  
  @rating = Rating.create(user_id: params[:id], score: params[:score])

  # @rated_user = User.find(params[:id])
    if @rating

      redirect "/"
    else
      redirect "/admin"
    end

    current_user.file = params[:uploaded_file]
    current_user.save
    redirect "/users/#{params[:id]}"

  end


###### PROJECT PAGE #########

get '/projects/:id' do

  @project= Project.find(params[:id])
  @youtube = @project.youtube
  erb :'project_profile'
end


post '/projects/:id' do

  current_project_id = params[:id].to_i
  @commitment = Commitment.new(
    user_id: current_user.id,
    project_id: current_project_id
  )
  if @commitment.save
    redirect '/projects'
  else
    erb :new_project
  end
end



###### ADMIN ACTIONS #########

get '/admin' do
  erb :'/admin'
end

get '/admin/project/user/:id' do

  @user = User.find(params[:id])
  erb :'/project_edit'

end

get '/admin/users' do
  erb :'/admin_user_view'
end


delete '/admin/users/:id' do

  @user = User.find(params[:id])
  @user.destroy

  redirect '/admin'
end
