#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on('lost', @lost, @)
    @get('playerHand').on('won', @won, @)

  lost: ->
    alert 'You lost!'
    @trigger 'lost'

  won: ->
    alert 'You won!'
    @trigger 'won'


