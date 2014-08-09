class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->


  hit: ->
    if @scores()[0] < 21
      @add(@deck.pop()).last()
    playerScore = @scores()
    checkScore()

  stand: ->
    @models[0].flip()
    if @scores().length > 1
      if @scores()[1] < 17
        @add(@deck.pop()).last()
      else if @scores()[1] > 21
        while @scores()[0] < 17
          @add(@deck.pop()).last()
    while @scores()[0] < 17
      @add(@deck.pop()).last()

    if playerScore.length > 1 and playerScore[1] < 22
      playerScore = playerScore[1]
      else playerScore = playerScore[0]

    if @scores()[]



  checkScore: ->
    console.log 'checking score'
    if @scores()[0] > 21
      @trigger 'lost'
    if @scores()[0] == 21
      @trigger 'won'

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
