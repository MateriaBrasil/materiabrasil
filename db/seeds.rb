#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
AdminUser.create!(:email => "test@test.com", :password => "testuser")

produto = Category.create(name: 'Produto')
classe = Category.create(name: 'Classe', parent: produto)
Category.create!(name: 'Cerâmico/cimentício', parent: classe)
Category.create!(name: 'Compósito', parent: classe)
Category.create!(name: 'Couro', parent: classe)
Category.create!(name: 'Fibras naturais', parent: classe)
Category.create!(name: 'Florestal não-madeireiro', parent: classe)
Category.create!(name: 'Madeira', parent: classe)
Category.create!(name: 'Metal', parent: classe)
Category.create!(name: 'Papel e celulose', parent: classe)
Category.create!(name: 'Polímero', parent: classe)
Category.create!(name: 'Vidro', parent: classe)
sustentabilidade = Category.create(name: 'Sustentabilidade', parent: produto)
agua = Category.create(name: 'Água', parent: sustentabilidade)
Category.create!(name: 'Água1', parent: agua)
Category.create!(name: 'Água2', parent: agua)
Category.create!(name: 'Água3', parent: agua)
ciclo = Category.create(name: 'Ciclo', parent: sustentabilidade)
Category.create!(name: 'Ciclo1', parent: ciclo)
Category.create!(name: 'Ciclo2', parent: ciclo)
Category.create!(name: 'Ciclo3', parent: ciclo)
seguranca = Category.create(name: 'Segurança', parent: sustentabilidade)
Category.create!(name: 'Segurança1', parent: seguranca)
Category.create!(name: 'Segurança2', parent: seguranca)
Category.create!(name: 'Segurança3', parent: seguranca)
uso = Category.create(name: 'Uso', parent: produto)
Category.create!(name: 'Casa e construção', parent: uso)
Category.create!(name: 'Esporte e Lazer', parent: uso)
Category.create!(name: 'Moda', parent: uso)
situacao = Category.create(name: 'Situação', parent: produto)
Category.create!(name: 'Disponível para venda', parent: situacao)
Category.create!(name: 'Em desenvolvimento', parent: situacao)
local = Category.create(name: 'Local de produção', parent: produto)
Category.create!(name: 'Acre', parent: local)
Category.create!(name: 'Alagoas', parent: local)
Category.create!(name: 'Amapá', parent: local)
Category.create!(name: 'Amazonas', parent: local)

