class Address < ActiveRecord::Base
    #Um endereço pertence a um contato "Contact"
    belongs_to :contact
end
