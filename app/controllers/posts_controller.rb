class PostsController < ApplicationController
 
    get '/posts' do
        if logged_in?
            @posts = current_user.posts
            erb :'posts/index'
        else
            redirect '/login'
        end
    end

    get '/posts/new' do
        if logged_in?
            erb :'/posts/new'
        else
            redirect '/login'
        end
    end

    post '/posts' do
        if logged_in?
            post = current_user.posts.build(params)
            if post.save
                redirect '/posts'
            else
                redirect '/posts/new'
            end
        else
            redirect '/login'
        end
    end

    get '/posts/:id' do
        if logged_in?
            @post = current_user.posts.find_by_id(params[:id])
            if @post 
                erb :'/posts/show'
            else
                redirect '/posts'
            end
        else
            redirect '/login'
        end
    end

    get '/posts/:id/edit' do
        if logged_in?
            @post = current_user.posts.find_by_id(params[:id])
            if @post
                erb :'/posts/edit'
            else
                redirect '/posts'
            end
        else
            redirect '/login'
        end
    end
    
    patch '/posts/:id' do
        if logged_in?
            post = current_user.posts.find_by_id(params[:id])
            if post
                if post.update(title: params[:title], body: params[:body])
                    redirect "/posts/#{post.id}"
                else
                    redirect "/posts/#{post}/edit"
                end
            else
                redirect '/posts'
            end
        else
            redirect 'login'
        end
    end

    delete '/posts/:id' do
        if logged_in?
            post = Post.find_by_id(params[:id])
            if post
                post.delete
            end
            redirect '/posts'
        else
            redirect '/login'
        end
    end


end