class User < ActiveRecord::Base
  def to_pleasant_string
    return "#{id} #{email}. #{password}"
  end
end
