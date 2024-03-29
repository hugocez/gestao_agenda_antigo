class User < ActiveRecord::Base
  
  belongs_to :funcionarios
  
  before_save {self.user_name = user_name.downcase}
  
  validates :name, presence: true, length: {maximum: 50}
  validates :user_name, presence: true, length: {minimum:5,maximum:20}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.a-z]+\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}
  
  has_secure_password
  
end
