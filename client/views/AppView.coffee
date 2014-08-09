class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('dealerHand').stand()

  initialize: ->
    @model.on('lost', @render(), @)
    @model.on('won', @render(), @)
    @model.on('tie', @render(), @)
    @render()

  render: ->
    console.log('re rendering')
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  restart: ->
    $('body div').remove()
    new AppView(model: new App()).$el.appendTo 'body'
    # @$el.children().detach()
    # @$el.html @template()
    # console.log('here')
    # @model.set 'deck', deck = new Deck()
    # @model.set 'playerHand', deck.dealPlayer()
    # @model.set 'dealerHand', deck.dealDealer()
    # @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    # @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el




