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

  describe 'protected fields', ->
    it 'should have the id as a proptected field', ->
      expect(item.protectedFields).toContain('id')
      expect(item.protectedFields.length).toEqual 1

    it 'lets us add a protected field', ->
      item.addProtectedField 'title'
      expect(item.protectedFields).toContain 'title'

    it 'should not allow protected fields to be updated', ->
      item.addProtectedField 'title'
      item.update
        id: 2
        title: 'New title'
        price: 15

      expect(item.id).toEqual 1
      expect(item.title).toEqual 'Mouse'
      expect(item.price).toEqual 15

  describe 'fieldIsProtected', ->
    it 'returns true if field is protected', ->
      expect(item.fieldIsProtected 'id').toBeTruthy()

    it 'returns false if field is not protected', ->
      expect(item.fieldIsProtected 'title').toBeFalsy()
