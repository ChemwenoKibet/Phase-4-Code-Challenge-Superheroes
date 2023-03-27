class PowersController < ApplicationController
    #SHows all powers -> #GET /powers
    def index
        powers = Power.all
        render json: powers, status: :ok
    end
    
    #Show users using IDs -> #GET /powers/:id
    def show 
        power = Power.find(params[:id])
        render json: power, status: :ok
    end
    
    #Update details -> #PATCH /powers/:id
    def update
        power = Power.find(params[:id])
        power.update!(power_params)
        render json: power, status: :ok
    end
    
    private
    def power_params
        params.permit(:description)
    end    

    def find_power
        Power.find(params[:id])
    end
    
    def not_found_response
        render json: {error: "Power not found"}, status: 404
    end 
    
    def validation_errors(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
        
end




