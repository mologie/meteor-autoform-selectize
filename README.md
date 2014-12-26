# reactive-selectize

Selectize.js input type for AutoForm using `mologie:reactive-selectize`.

This package integrates selectize.js controls with Meteor. It provides
a wrapper class which takes care of synchronizing the select field's
options with a data source provided when constructing the wrapper.

## Example

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
  _.map tags, -> value: tags

Tempalte.body.helpers = ->
  postSchema: -> PostSchema
  tagSelectize: ->
      options: getTagList
      valueField: 'value'
      labelField: 'value'
      multiple: true
      create: true
      createOnBlur: true
      persist: false
```


## License

This project is licensed under the MIT license.
