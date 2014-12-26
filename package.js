Package.describe({
	name:    'mologie:autoform-selectize',
	summary: 'Selectize.js input type for AutoForm using mologie:reactive-selectize',
	version: '0.0.1',
	git:     'TODO'
});

var clientDependencies = [
	'coffeescript',
	'jquery',
	'underscore',
	'templating',
	'mologie:reactive-selectize',
	'aldeed:autoform'
];

var clientFiles = [
	'autoform-selectize.html',
	'autoform-selectize.coffee'
];

Package.onUse(function(api) {
	api.versionsFrom('1.0');
	api.use(clientDependencies, 'client');
	api.addFiles(clientFiles, 'client');
});
