/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_2195335957")

  // add field
  collection.fields.addAt(3, new Field({
    "hidden": false,
    "id": "file708945776",
    "maxSelect": 1,
    "maxSize": 0,
    "mimeTypes": [],
    "name": "coverImageurl",
    "presentable": false,
    "protected": false,
    "required": false,
    "system": false,
    "thumbs": [],
    "type": "file"
  }))

  // add field
  collection.fields.addAt(4, new Field({
    "exceptDomains": null,
    "hidden": false,
    "id": "url1414540853",
    "name": "downloadurl",
    "onlyDomains": null,
    "presentable": false,
    "required": false,
    "system": false,
    "type": "url"
  }))

  // add field
  collection.fields.addAt(5, new Field({
    "hidden": false,
    "id": "number185142749",
    "max": null,
    "min": null,
    "name": "Price",
    "onlyInt": false,
    "presentable": false,
    "required": false,
    "system": false,
    "type": "number"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_2195335957")

  // remove field
  collection.fields.removeById("file708945776")

  // remove field
  collection.fields.removeById("url1414540853")

  // remove field
  collection.fields.removeById("number185142749")

  return app.save(collection)
})
