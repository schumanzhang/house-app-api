class Api::V1::AdminsController < ApplicationController

    def create
        @admin = Admin.create(admin_params)

        if @admin.valid?
            render json: { admin: AdminSerializer.new(@admin) }, status: :created
        else
            render json: { error: "failed to create admin" }, status: :unprocessable_entity
        end
    end

    private 

    def admin_params
        params.require(:admin).permit(:username, :password, :firstname, :lastname)
    end

end
