class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    fail
    id = params[:id]
    render json: User.find(id)
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
      json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render(
      json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
    # .permit(:name, :email))
  end

  def destroy
    user = User.find(params[:id])

    if user.delete
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end


# .require
# .permit
#
#
# .require(:user)
# .permit
#
# def user_params
#   params.require(:user).permit(:name, :email, :admin, :this) # => {name: "sam", email: "sam@google.com"}
# end
