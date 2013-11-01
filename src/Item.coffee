class Item
  constructor: (@id, @title, @price) ->
    @protectedFields = ['id']

  update: (opts) ->
    for key, val of opts
      if @[key]?
        @[key] = val

window.Item = Item
