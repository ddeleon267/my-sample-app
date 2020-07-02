class PostsController < ApplicationController
 
    get '/posts' do
        redirect_if_not_logged_in
        @posts = current_user.posts
        erb :'posts/index'
    end

    get '/posts/new' do
        redirect_if_not_logged_in
        erb :'/posts/new'
    end

     get '/posts/:id' do
        redirect_if_not_logged_in
        @post = set_post
        if @post 
            erb :'/posts/show'
        else 
            redirect '/posts'
        end
    end

    post '/posts' do
        redirect_if_not_logged_in
        post = current_user.posts.build(params)
        if post.save
            redirect '/posts'
        end
        redirect '/posts/new'
    end

    get '/posts/:id/edit' do
        redirect_if_not_logged_in
        @post = set_post
        
        if @post
            erb :'/posts/edit'
        else
            redirect '/posts'
        end
    end
    
    patch '/posts/:id' do
        redirect_if_not_logged_in
        post = set_post
        if post
            if post.update(title: params[:title], body: params[:body])
                redirect "/posts/#{post.id}"
            end
            redirect "/posts/#{post}/edit"
        end
        redirect '/posts'
    end

    delete '/posts/:id' do
        redirect_if_not_logged_in
        post = set_post
        if post
            post.delete
        end
        redirect '/posts'
    end

    private

    def set_post
        current_user.posts.find_by_id(params[:id])
    end

end