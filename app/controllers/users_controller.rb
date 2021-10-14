# This class defines the Users controller, which is responsible for viewing users that subscribed to our bot.
class UsersController < ApplicationController
    before_action :load_entities

    # This method views all the users subscribed to our bot and make the available to be selected to chat to.
    def index
      @users = User.all
    end
  
    protected
    # This method is responsible for querying the Users and RoomMessages activeRecords from the DB before any action. 
    def load_entities
      @users = User.all
    end

  end