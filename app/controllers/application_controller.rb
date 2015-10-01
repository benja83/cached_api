class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # faking current user to be the first user
  def current_user
    @currenr_user = User.first
  end

  def cache(data)
    puts time_stamp = data.klass.order('updated_at DESC').limit(1).first.updated_at

    key = data.klass.to_s + time_stamp.to_i.to_s

    Rails.cache.fetch key do
      serialized_message(data)
    end
  end

  def serialized_message(data)
    Api::V1::ContentSerializer.new(data)
  end
end
