class GuildsController < ApplicationController
  before_action :check_logged_in, only: [:index]
  def index
    @guilds = @user.guilds
  end

  def new
    @guild = Guild.new
  end

  def create
    @guild = Guild.new(guild_params)
    if @guild.save
      redirect_to @guild
    else
      render 'guild/new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    @guild = Guild.find_by(id: params[:id])
    return unless @guild.nil?

    redirect_to root_url
  end

  private

  def guild_params
    params.require(:guild).permit(:name)
  end

  def check_logged_in
    @user = current_user
    return unless @user.nil?

    redirect_to root_url
  end
end
