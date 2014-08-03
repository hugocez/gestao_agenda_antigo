class Empresa < ActiveRecord::Base

  has_many :funcionarios
  
  validates :razao_social, presence: true, length: {maximum: 50}
  validates :cnpj, :cnpj => true
  
end
