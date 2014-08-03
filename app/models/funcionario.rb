class Funcionario < ActiveRecord::Base
  
  has_one :user
  belongs_to :empresa
  
  validates :nome, presence:true, length: {maximum: 50}  
  
end
