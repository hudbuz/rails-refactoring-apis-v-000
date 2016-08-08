class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gh_service = GithubService.new
    binding.pry
    session[:token] = gh_service.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])


    redirect_to '/'
  end
end