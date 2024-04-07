class GuildsController < ApplicationController
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

  private

  def guild_params
    params.require(:guild).permit(:name)
  end
end
