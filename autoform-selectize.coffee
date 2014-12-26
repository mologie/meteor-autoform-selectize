#
# mologie:autoform-selectize
# Copyright 2014 Oliver Kuckertz <oliver.kuckertz@mologie.de>
# See COPYING for license information.
#

#
# Private utility functions
#

# Support for dynamically evaluating default values (non-standard)
evaluateArray = (values) -> _.map values, (value) ->
	if typeof value is "function"
		Tracker.nonreactive -> value()
	else
		value


#
# AutoForm type registration
#

AutoForm.addInputType "selectize",
	template: "afSelectize"
	valueIsArray: true
	
	valueOut: ->
		# Selectize.js will return a string for single-value fields, and an array of strings for multi-select fields
		$(this)[0].selectize.getValue()
	
	contextAdjust: (context) ->
		# Defaults
		config = context.atts.selectize
		config.valueField ?= "_id"
		config.placeholder ?= context.atts.placeholder
		config.options ?= context.selectOptions
		config.selected ?= evaluateArray _.compact context.value
		
		# Adjust context
		context.atts.multiple = true if config.multiple
		delete context.atts.selectize
		
		# Remove config extensions
		delete config.multiple
		
		# Create controller
		controller = new ReactiveSelectizeController config
		_.extend context, controller: controller


#
# View template hooks
#

Template.afSelectize.rendered = ->
	controller = @data.controller
	controller.attach @$('select')

Template.afSelectize.destroyed = ->
	@controller.stop()
	@$('select.selectized')[0].selectize.destroy()
