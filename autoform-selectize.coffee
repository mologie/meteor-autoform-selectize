# mologie:autoform-selectize
# Copyright 2014 Oliver Kuckertz <oliver.kuckertz@mologie.de>
# See COPYING for license information.


# Support for dynamically evaluating default values (non-standard)
evaluateArray = (values) -> _.map values, (value) ->
	if typeof value is "function"
		Tracker.nonreactive -> value()
	else
		value


AutoForm.addInputType "selectize",
	template: "afSelectize"
	valueIsArray: true
	
	valueOut: ->
		# Selectize.js will return a string for single-value fields, and an
		# array of strings for multi-select fields
		this[0].selectize.getValue()
	
	contextAdjust: (context) ->
		# Build configuration
		defaults =
			valueField: "_id"
			placeholder: context.atts.placeholder
			options: context.selectOptions
			selected: evaluateArray _.compact context.value
		config = _.extend defaults, context.atts.selectize
		
		# Adjust context
		context.atts.multiple = true if config.multiple
		delete context.atts.selectize
		
		# Remove configuration extensions
		delete config.multiple
		
		# Create controller
		context.controller = new ReactiveSelectizeController config
		context


Template.afSelectize.rendered = ->
	controller = @data.controller
	controller.attach @$('select')

Template.afSelectize.destroyed = ->
	controller = @data.controller
	controller.stop()
