class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    # authentication
    # need to produce a jwt (access token) from the client to store
    def login

    end

end