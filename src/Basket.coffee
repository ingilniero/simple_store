class Basket

  constructor: ->
    @items = []
    @totalCount =    0
    @distinctCount = 0

  add: (item, quantity = 1) ->

    if @itemExistsInBasket item
      currentItem = @getItemFromBasket item
      currentItem.quantity += quantity
    else
      @items.push {
        item
        quantity
      }

    @updateCounts()

  empty: ->
    @items = []
    @totalCount = 0
    @distinctCount = 0

  getItemFromBasket: (item) ->
    for basketItem in @items
      return basketItem if basketItem.item.id is item.id

  getItemIndex: (item) ->
    count = 0
    for basketItem in @items
      return count if basketItem.item.id is item.id
      count++
    -1

  getQuantity: (item) ->
    if @itemExistsInBasket item
      @getItemFromBasket(item).quantity
    else
      0

  itemExistsInBasket: (item) ->
    for basketItem in @items
      return true if basketItem.item.id is item.id

  remove: (item, quantity = 1) ->
    return unless @itemExistsInBasket item

    basketItem = @getItemFromBasket item
    basketItem.quantity -= quantity

    if basketItem.quantity < 1
      itemLoc = @getItemIndex item
      @items.splice(itemLoc, 1)

    @updateCounts()

  updateCounts: ->
    total = 0
    for item in @items
      total += item.quantity

    @distinctCount = @items.length
    @totalCount = total


window.Basket = Basket
