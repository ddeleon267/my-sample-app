class UsersController < ApplicationController
    get '/signup' do
        erb :'users/new'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/posts' 
        else
            redirect '/signup'
        end
    end

end