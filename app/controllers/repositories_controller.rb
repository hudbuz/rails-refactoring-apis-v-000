class RepositoriesController < ApplicationController
  def index
    service = GithubService.new({'access_token' => session[:token]})
    
    @repos_array = service.get_repos
    session[:username]= service.get_username
    #response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
   # @repos_array = JSON.parse(response.body)
  end

  def create
    #response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    service = GithubService.new({'access_token' => session[:token]})
    service.create_repo(params[:name])
    redirect_to '/'
  end
end
