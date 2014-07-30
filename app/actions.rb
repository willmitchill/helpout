# Homepage (Root path)
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

get '/login' do
  erb :login
end

post '/login' do
   @user = User.find_by(
    username: params[:username],
    password: params[:password]

    )
   if @user
    session[:user_id] = @user.id
    redirect '/projects'

  else
    erb :signup
  end
end

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
  @user.save
  redirect '/projects'   
end

get '/projects' do
  @projects = Project.all.order(:start_date)
  erb :projects
end




