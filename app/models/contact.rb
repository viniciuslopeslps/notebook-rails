class Contact < ActiveRecord::Base
  #Um contato pertence a um tipo de contato "Kind"
  belongs_to :kind
  
  #Um contato tem um endereço, só pode usar o has_one se existir do outro lado
  #Exemplo: Kind não tem has_one porque não existe um contact_id lá
  has_one :address
  
  has_many :phones
  
  #Quando for enviado dados do contato e já tiver dados de endereço
  #Automaticamente já cadastra o endereço como address_attributes "Aceita atributos alinhados para"   
  #http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  accepts_nested_attributes_for :address
  
  #Está no plural porque é has_many
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  
  #validações
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true

end
