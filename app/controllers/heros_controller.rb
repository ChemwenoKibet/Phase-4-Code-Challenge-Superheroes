class HerosController < ApplicationController
    #Getting all heroes -> #GET /heroes
    def index
        heroes = Hero.all
        render json: heroes, status: :ok
    end
    
    #Shows a heroes using that ID -> #GET /heroes/:id
    def show
        hero = Hero.find(params[:id])
        render json: hero, status: :ok, serializer: HeroPowerSerializer
    end    
end
