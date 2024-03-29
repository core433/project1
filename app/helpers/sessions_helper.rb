module SessionsHelper

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

	# For storing the project id so we can pass the
	# proper project to controllers of models that
	# rely on the project, like Datasets
	def store_project_id(the_id)
		session[:project_id] = the_id
	end

	def get_stored_project_id
		session[:project_id]
	end

	# For storing the "edit state" of a project - there
	# are 3 states: upload data, make visualization, and
	# get embedded link
	def store_edit_state(the_state)
		session[:edit_state] = the_state
	end

	def get_edit_state
		session[:edit_state] || 0
	end

end
