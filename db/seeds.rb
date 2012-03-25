#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
AdminUser.create!(:email => "runeroniek@gmail.com", :password => "skeeter")



Category.create!([
  {:name => "Classes"},
    { :name => "Cerâmico", :parent_id => 1, :code_reference => 1},
    { :name => "Couro", :parent_id => 1, :code_reference => 20},
    { :name => "Fibras Naturais", :parent_id => 1, :code_reference => 40},
    { :name => "Madeira", :parent_id => 1, :code_reference => 60},
    { :name => "Metal", :parent_id => 1, :code_reference => 80},
    { :name => "Papel e celulose", :parent_id => 1, :code_reference => 100},
    { :name => "Polímero", :parent_id => 1, :code_reference => 120},
    { :name => "Florestal não-madeireiro", :parent_id => 1, :code_reference => 140},
    { :name => "Vidro", :parent_id => 1, :code_reference => 160},
    { :name => "Compósito", :parent_id => 1, :code_reference => 180},
  {:name => "Usos"},
    { :name => "Acabamento tintas/vernizes", :parent_id => 12, :code_reference => 500},
    { :name => "Acessórias", :parent_id => 12, :code_reference => 520},
    { :name => "Adesivo", :parent_id => 12, :code_reference => 540}
])
