class PagesController < ApplicationController
  caches_action :splash if Rails.env.production?

  def splash
    render :layout => "splashpage"
  end

  def about; end
  def contact; end
  def submit; end
  def portfolio
    @items_design = %w(domo top cw sebrae trofeu bike)
    @items_lab = %w(tvxta zrzs case mineo simp horta)
    @items_sustentabilidade = %w(obra mcl sist marins evento cad p120 mochila eva)
    @items_saber = %w(mb expo siemens gnt ws educa)
  end
end
