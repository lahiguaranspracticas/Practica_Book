class BooksController < ApplicationController
    
    def index
        author = Author.find(params[:author_id])
        books = author.books
        render json: books, status: 200
    end
    
    def show
       author = Author.find(params[:id])
       render json: author, status:200
    end
    
    
    
    def create
        author=Author.new(params[:author])
        if author.save
            render json:author, status: 201
        else
            render json: author.errors, status:unprocessable_entity
            
        end    
    end
    
    
    def update
        author = Author.find(params[:id])
        if author.update(params_author)
            render json:author, status: 201
        else
            render json: author.errors, status:unprocessable_entity
        end
    end
    
    
    def params_author
        params.require(:author).permit(:name, :age)
    end
    
end
