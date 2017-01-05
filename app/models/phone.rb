class Phone < ActiveRecord::Base
    #Um telefone pertence a um contato
    belongs_to :contact
end
