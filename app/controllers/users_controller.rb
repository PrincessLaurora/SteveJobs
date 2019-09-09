class UsersController < ApplicationController

  # Set a session value
  session[:current_user_id] = user.id

  # Access a session value
  some_other_variable_value = session[:other_variable_key]

  # Reset a session key
  session[:key_to_be_reset] = nil

  # Reset the entire session
  reset_session
end
