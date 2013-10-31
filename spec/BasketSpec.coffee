describe 'Basket', ->

  basket = laptop = mouse = undefined

  beforeEach ->
    basket = new Basket()
    laptop = new Item(1, 'Laptop', 400)
    mouse = new Item(2, 'Mouse', 10)


  describe 'Adding to basket', ->
    it 'keeps track of items in the basket', ->
      basket.add laptop

      expect(basket.totalCount).toEqual 1
      expect(basket.distinctCount).toEqual 1

      basket.add laptop
      expect(basket.totalCount).toEqual 2
      expect(basket.distinctCount).toEqual 1

      basket.add mouse
      expect(basket.totalCount).toEqual 3
      expect(basket.distinctCount).toEqual 2

  describe 'Finding and item in basket', ->
    it 'returns true if the item exists', ->
      basket.add laptop

      expect(basket.itemExistsInBasket(laptop)).toBeTruthy()

    it 'returns false if the item is not in basket', ->
      expect(basket.itemExistsInBasket(laptop)).toBeFalsy()


  describe 'Fetching item from basket', ->
    it 'returns the item object if it exists', ->
      basket.add laptop
      result = basket.getItemFromBasket laptop

      expect(result.item).toEqual laptop
      expect(result.quantity).toEqual 1

    it 'returns false if the item is not in basket', ->
      expect(basket.getItemFromBasket(laptop)).toBeFalsy()

  describe 'Emptying a basket', ->
    it 'empties a basket with items in', ->
      basket.add laptop
      basket.empty()

      expect(basket.items.length).toEqual 0

    it 'updates count variables', ->
      basket.add laptop
      basket.empty()

      expect(basket.distinctCount).toEqual 0
      expect(basket.totalCount).toEqual 0

  describe 'Getting the quantity of an item in basket', ->
   it 'returns the correct quantity', ->
     basket.add laptop
     basket.add laptop

     expect(basket.getQuantity(laptop)).toEqual 2

   it 'returns 0 if the item is not in basket', ->
     expect(basket.getQuantity(laptop)).toEqual 0

  describe 'Getting index of an item', ->
    it 'returns the index', ->
      basket.add laptop
      expect(basket.getItemIndex(laptop)).toEqual 0

    it 'returns -1 if item doesnt exist', ->
      expect(basket.getItemIndex(laptop)).toEqual -1

  describe 'Removing from basket', ->
    it 'deducts the quantity passed in', ->
      basket.add laptop
      basket.add laptop

      basket.remove laptop, 1

      expect(basket.getQuantity(laptop)).toEqual 1
      expect(basket.distinctCount).toEqual 1
      expect(basket.totalCount).toEqual 1

    it 'removes the item completely if removing the total quantity', ->
      basket.add laptop
      basket.add laptop

      basket.remove laptop, 2
      expect(basket.getQuantity(laptop)).toEqual 0
      expect(basket.itemExistsInBasket(laptop)).toBeFalsy()

    it 'deals with multiple items correctly', ->
      basket.add laptop
      basket.add laptop
      basket.add mouse

      basket.remove mouse

      expect(basket.itemExistsInBasket(mouse)).toBeFalsy()
      expect(basket.getQuantity(laptop)).toEqual 2


    it 'should not break totalCount with invalid quantities', ->
      basket.add laptop
      basket.add laptop
      basket.add mouse

      basket.remove laptop, 3

      expect(basket.totalCount).toEqual 1
