require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :stamps
  # attr_accessible :title, :body
  PASSWORD_SALT = "miko3moemoemikomoemoeHitagiTsundere"
  def self.register(args)
    user = User.new
    user.idm = args[:idm]
    user.username = args[:username]
    user.password = self.convert_sha1(args[:password])
    user.email = args[:email]
    user.save
    return user
  end

  def self.convert_sha1(text)
    return Digest::SHA1.hexdigest(PASSWORD_SALT + text)
  end

end
