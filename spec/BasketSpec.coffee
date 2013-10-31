describe 'Basket', ->
  it 'keeps track of items in the basket', ->
    basket = new Basket()
    laptop = new Item(1, 'Laptop', 400)
    mouse = new Item(2, 'Mouse', 10)

    basket.add laptop

    expect(basket.totalCount).toEqual 1
    expect(basket.distinctCount).toEqual 1

    basket.add laptop
    expect(basket.totalCount).toEqual 2
    expect(basket.distinctCount).toEqual 1

    basket.add mouse
    expect(basket.totalCount).toEqual 3
    expect(basket.distinctCount).toEqual 2
