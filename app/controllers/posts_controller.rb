class PostsController < ApplicationController
 
    get '/posts' do
        binding.pry
        @posts = Post.all
        erb :'posts/index'
    end

    get '/posts/new' do
        @users = User.all
        erb :'/posts/new'
    end

    post '/posts' do
        user = User.find_by_id(params[:user_id])
        post = user.posts.build(params)
        binding.pry
        if post.save
            redirect '/posts'
        else
            redirect '/posts/new'
        end
    end

    get '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        if @post 
            erb :'/posts/show'
        else
            redirect '/posts'
        end
    end

    get '/posts/:id/edit' do
        @post = Post.find_by_id(params[:id])
        erb :'/posts/edit'
    end
    
    patch '/posts/:id' do
        post = Post.find_by_id(params[:id])
        if post.update(title: params[:title], body: params[:body])
            redirect "/posts/#{post.id}"
        else
            redirect "/posts/#{post}/edit"
        end
    end

    delete '/posts/:id' do
        post = Post.find_by_id(params[:id])
        if post
            post.delete
        end
        redirect '/posts'
    end


end