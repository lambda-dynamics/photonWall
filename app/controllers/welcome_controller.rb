class WelcomeController < ApplicationController
  def index
      @decks = Deck.all
  end

  def utils

  end
end
