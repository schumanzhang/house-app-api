class ApplicationController < ActionController::API
    # this line locks down all the routes
    before_action :authorized

    def encode_token(payload)
        # check out https://jwt.io/
        JWT.encode(payload, 'some_secret')
    end

    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]

            # header: { 'Authorization': 'Bearer <token>' }
            begin
                JWT.decode(token, 'some_secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_admin
        if decoded_token
            admin_id = decoded_token[0]['admin_id']
            @admin = Admin.find_by(id: admin_id)
        end
    end

    def logged_in?
        # checks if current_admin is nil or not
        !!current_admin
    end

    def authorized
        unless logged_in?
            render json: { message: 'Please log in' }, status: :unauthorized
        end
    end
end
