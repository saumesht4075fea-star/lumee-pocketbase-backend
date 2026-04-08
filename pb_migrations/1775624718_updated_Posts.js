/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_2195335957")

  // update collection data
  unmarshal({
    "name": "books"
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_2195335957")

  // update collection data
  unmarshal({
    "name": "Posts"
  }, collection)

  return app.save(collection)
})
