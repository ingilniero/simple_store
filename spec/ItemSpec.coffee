describe 'Item', ->
  item = undefined

  beforeEach ->
    item = new Item 1, 'Mouse', 10

  describe 'Updating an item', ->
    it 'updates properties passed in', ->
      item.update
        title: 'Super mouse'
        price: 15

      expect(item.title).toEqual 'Super mouse'
      expect(item.price).toEqual 15
      expect(item.id).toEqual 1
