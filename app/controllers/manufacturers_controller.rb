class ManufacturersController < ApplicationController
  inherit_resources


  def update
    update!(notice: 'Material criado com sucesso!') { root_url }
  end
end

