class Basket

  items: []
  itemCount: 0

  add: (item) ->
    @items.push item
    @itemCount++


window.Basket = Basket
