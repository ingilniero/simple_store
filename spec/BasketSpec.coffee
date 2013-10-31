describe 'Basket', ->
  it 'keeps track of items in the bascket', ->
    basket = new Basket()
    item = new Item()
    basket.add item

    expect(basket.itemCount).toEqual 1

    basket.add item

    expect(basket.itemCount).toEqual 2
