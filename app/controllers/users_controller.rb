# todos_controller.rb
class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map {|user| user.to_pleasant_string}.join("\n")
  end

  def create
    email = params[:email]
    name = params[:name]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
      created_at: DateTime.now
    )

    response_text = "Hey, your user todo is created with ID #{new_user.id}"
    render plain:"#{response_text}"
  end

  def verify_login
    email = params[:email]
    password = params[:password]

    curr_users = User.where(["email = ?", "#{params[:email]}"])

    if(curr_users.size == 0)
      render plain: "false"
    elsif (curr_users[0][:password] != password)
      render plain: "false"
    else
      render plain: "true"
    end
  end

end
