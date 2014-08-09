#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('lost', @lost, @)
    @get('playerHand').on('won', @won, @)
    @get('dealerHand').on('score', @score, @)

  newGame: ->
    console.log('newgame')
    @set 'deck', deck = new Deck()
    @get('playerHand').dealNewGame()
    @get('dealerHand').dealNewGame()

  lost: ->
    # @trigger 'lost'
    setTimeout((=>
      alert 'You lost!'
      @newGame())
      , 200)

  won: ->
    # @trigger 'won'
    setTimeout((=>
      alert 'You won!'
      @newGame())
      , 200)

  tie: ->
    # @trigger 'tie'
    setTimeout((=>
      alert 'You tied!'
      @newGame())
      , 200)

  score: ->
    console.log('score triggered')
    playerScore = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores()

    if playerScore.length > 1 and playerScore[1] < 22
      playerScore = playerScore[1]
    else
      playerScore = playerScore[0]

    if dealerScore.length > 1 and dealerScore[1] < 22
      dealerScore = dealerScore[1]
    else
      dealerScore = dealerScore[0]

    if dealerScore > 21
      @won()

    if dealerScore > playerScore
      @lost()
    else if playerScore > dealerScore
      @won()
    else
      @tie()
