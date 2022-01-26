class Api::V1::AdminsController < ApplicationController
    # create action doesn't need authentication
    # because that's where we sign up users
    skip_before_action :authorized, only: [:create]

    def create
        @admin = Admin.create(admin_params)

        if @admin.valid?
            @token = encode_token(admin_id: @admin.id)
            render json: { admin: AdminSerializer.new(@admin), jwt: @token }, status: :created
        else
            render json: { error: "failed to create admin" }, status: :unprocessable_entity
        end
    end

    private 

    def admin_params
        params.require(:admin).permit(:username, :password, :firstname, :lastname)
    end

end
