class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

    # authentication
    # need to produce a jwt (access token) for the client to store in localStorage
    def login
        @admin = Admin.find_by(username: admin_login_params[:username])

        if @admin && @admin.authenticate(admin_login_params[:password])
            token = encode_token({ admin_id: @admin.id })
            render json: {
                        admin: AdminSerializer.new(@admin),
                        jwt: token,
                    },
                    status: :accepted
        else
            render json: {
               message: 'Invalid username or password',
             },
            status: :unauthorized
        end
    end

    private

    def admin_login_params
        params.require(:admin).permit(:username, :password)
    end

end