class DogsController < ApplicationController
    def index
        render json: Dog.all
    end

    def create
        dog = Dog.create(dog_params)
        render json: dog
    end
      
    private 
      
    def dog_params
        params.require(:dog).permit(:name, :age)
    end

    def update
        dog = Dog.find(params[:id])
        dog.update_attributes(dog_params)
        render json: dog
    end

    def destroy
        Dog.destroy(params[:id])
    end
end
