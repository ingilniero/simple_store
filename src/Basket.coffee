class Basket

  constructor: ->
    @items = []
    @totalCount =    0
    @distinctCount = 0

  add: (item) ->

    if @itemExistsInBasket item
      currentItem = @getItemFromBasket item
      currentItem.quantity++
    else
      @items.push
        item:     item
        quantity: 1

    @distinctCount = @items.length
    @totalCount++

  empty: ->
    @items = []
    @totalCount = 0
    @distinctCount = 0

  getItemFromBasket: (item) ->
    for basketItem in @items
      return basketItem if basketItem.item.id is item.id

  itemExistsInBasket: (item) ->
    for basketItem in @items
      return true if basketItem.item.id is item.id

window.Basket = Basket
