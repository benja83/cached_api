class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # faking current user to be the first user
  def current_user
    @currenr_user = User.first
  end

  def render_cached(data, serializer)
    time_stamp = data.order('updated_at DESC').limit(1).first.updated_at.to_i.to_s
    key = data.klass.to_s + time_stamp

    Rails.cache.fetch key do
      render json: data, each_serializer: serializer
    end
  end
end
