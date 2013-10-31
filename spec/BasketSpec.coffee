describe 'Basket', ->
  describe 'Adding to basket', ->
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

  describe 'Emptying a basket', ->
    it 'empties a basket with items in', ->
      basket = new Basket()
      laptop = new Item(1, 'Laptop', 400)

      basket.add laptop
      basket.empty()

      expect(basket.items.length).toEqual 0

    it 'updates count variables', ->
      basket = new Basket()
      laptop = new Item(1, 'Laptop', 400)

      basket.add laptop
      basket.empty()

      expect(basket.distinctCount).toEqual 0
      expect(basket.totalCount).toEqual 0
