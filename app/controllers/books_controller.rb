class BooksController < ApplicationController
before_action :authenticate_user!

    def new
    end

    def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
           redirect_to book_path(@book.id)
           flash[:notice] = 'successfully'
        else
           @books = Book.all
           @user = current_user
           render 'index'
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
           redirect_to book_path(@book)
           flash[:notice] = 'You have updated book successfully'
        else
           render 'edit'
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user.id != current_user.id
            redirect_to books_path
        end
    end

    def index
    	@books = Book.all
        @book = Book.new
        @users = User.all
        @user = current_user
    end

    def show
    	@book = Book.find(params[:id])
        @books = Book.new
        @users = User.all
        @user = @book.user
    end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
