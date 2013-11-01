class Basket

  constructor: ->
    @items = []
    @totalCount =    0
    @distinctCount = 0
    @discountAmount = 0

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

  applyDiscount: (price) ->
    price * (1 - (@discountAmount / 100))

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

  setDiscount: (amount) ->
    @discountAmount = Math.abs amount


  totalPrice: ->
    price = 0
    for item in @items
      price += item.quantity * item.item.price

    @applyDiscount price

  updateCounts: ->
    total = 0
    for item in @items
      total += item.quantity

    @distinctCount = @items.length
    @totalCount = total


window.Basket = Basket
