namespace :utils do
  #Foi criado porque quando rodas seeds no servidor vai acabar criando também os dados fake
  # e é interessate separar os dados fake dos reais
  desc "Popular banco de dados (Comando: rails g task utils seed )"
  task seed: :environment do
    puts "Criando contatos"
    for x in (0..10)
        puts "Criando contato #{x}"
        Contact.create!([
            {
                name: Faker::StarWars.character,
                email: Faker::Internet.email,
                rmk: Faker::Lorem.paragraph(2),
                kind: Kind.all.sample
            }
            ])
    end
    puts "fim de Contatos"
    
    puts "Criando Endereços"
    Contact.all.each do |contact|
      puts "Criando endereço do contato: #{contact.name}"
      Address.create!(
        street: Faker::Address.street_name,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts "Fim de endereços"
    
    puts "Criando Telefones"
    Contact.all.each do |contact|
      Random.rand(1..5).times do |time|
      puts "Criando telefone #{time} do contato: #{contact.name}"
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Fim de endereços"
  end

end