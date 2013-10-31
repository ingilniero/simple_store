class Basket

  constructor: ->
    @items = []
    @totalCount =    0
    @distinctCount = 0

  add: (item) ->
    itemInBasket = false

    for basketItem in @items
      itemInBasket = true if basketItem.item.id is item.id

    if itemInBasket
      currentItem = undefined
      for basketItem in @items
        currentItem = basketItem if basketItem.item.id is item.id

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

window.Basket = Basket
