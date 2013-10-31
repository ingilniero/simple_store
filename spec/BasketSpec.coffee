describe 'Basket', ->
  it 'keeps track of items in the basket', ->
    basket = new Basket()
    item = new Item()
    basket.add item

    expect(basket.itemCount).toEqual 1

    basket.add item

    expect(basket.itemCount).toEqual 2
