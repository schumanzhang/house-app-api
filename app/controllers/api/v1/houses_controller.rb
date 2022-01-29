class Api::V1::HousesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    # GET /api/v1/houses
    def index
        houses = House.all
        render json: HouseSerializer.new(houses).to_serialized_json
    end

    # GET /api/v1/houses/{house_id}
    def show
        house = House.find_by(id: params[:id])

        if house
            render json: HouseSerializer.new(house).to_serialized_json
        else
            render status: :not_found
        end
    end

    # POST /api/v1/houses
    def create
        house = House.new(house_params)

        # add your active record validations
        if house.valid?
            house.save
            render json: HouseSerializer.new(house).to_serialized_json, status: :created
        else
            # error message and error status code
            # check Rails http status codes at
            # http://www.railsstatuscodes.com/
            render json: {
                message: 'Failed to create house',
            },
            status: :unprocessable_entity
        end
    end

    # PUT /api/v1/houses/{house_id}
    def update
        house = House.find(params[:id])

        if house.valid?
            house.update(house_params)
            render json: HouseSerializer.new(house).to_serialized_json, status: :ok
        else
            render json: {
                message: 'Failed to update house',
            },
            status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/houses/{house_id}
    def destroy
        house = House.find(params[:id])
        house.destroy
        render status: :ok
    end

    private

    # strong params
    def house_params
        params.require(:house).permit(:address, :size, :sold, :bed, :bath, :garage, :image)
    end

end