class ChannelsController < ApplicationController
  def new
  end

  def show
    @channel = Channel.find_by(id: params[:id])
    return unless @channel.nil?

    redirect_to root_url
  end

  def edit
  end

  def destroy
  end
end
