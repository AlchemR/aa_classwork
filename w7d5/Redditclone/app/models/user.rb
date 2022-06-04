# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

  validates :username, :session_token, presence:true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6} , allow_nil:true
  after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    # return nil if @user.nil?
      # is_password?(password) ? @user : nil
    if @user && @user.is_password?(password)
      @user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
   password_object = BCrypt::Password.new(self.password_digest)
   password_object.is_password?(password)  
  end

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  has_many :moderated_subs,
  primary_key: :id,
  foreign_key: :moderator_id,
  class_name: :Sub

  has_many :posts,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Post

end
