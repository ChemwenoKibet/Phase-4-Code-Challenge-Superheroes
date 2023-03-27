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
    
    def not_found_response
        render json: {error: "Hero not found"}, status: 404
    end    
end
