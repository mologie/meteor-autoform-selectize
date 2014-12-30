autoform-selectize
==================

**Here be dragons.** While basic functionality is implemented and working,
not all features of selectize.js are currently supported by the underlying
helper library `mologie:reactive-selectize`. Proper documentation and tests
are missing. However, if you are familiar with AutoForm and selectize.js,
you may already find this project useful. Pull requests and issue reports
are welcome.

This package provides a
[Selectize.js](//github.com/brianreavis/selectize.js)
input type for AutoForm using `mologie:reactive-selectize`.

Usage
-----

Visit the
[mologie:reactive-selectize repository](//github.com/mologie/meteor-reactive-selectize#usage)
for a full list of available options.

To use this package, simply add a function which returns an option
dictionary, and assign it to the `selectize` property of the input
field (either through the template, or through the form's schema).


Example
-------

The following snippets illustrate building a tag input field:

```html
<body>
  {{#autoForm schema=postSchema}}
    {{> afQuickField name="tags" type="selectize" selectize=tagSelectize}}
  {{/autoForm}}
</body>
```

```js
PostSchema = new SimpleSchema
  tags:
    type: [String]

getTagList = ->
  tags = _.union.apply null, Posts.find().map((post) -> post.tags)
  _.map tags, (tag) -> value: tag

Template.body.helpers = ->
  postSchema: -> PostSchema
  tagSelectize: ->
      options: getTagList
      valueField: 'value'
      labelField: 'value'
      maxItems: null
      create: true
      createOnBlur: true
      persist: false
```

License
-------

This project is licensed under the MIT license.
