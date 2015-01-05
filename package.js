Package.describe({
	name:    'mologie:autoform-selectize',
	summary: 'Selectize.js input type for AutoForm using mologie:reactive-selectize',
	version: '0.0.4',
	git:     'https://github.com/mologie/meteor-autoform-selectize'
});

var clientDependencies = [
	'coffeescript',
	'jquery',
	'underscore',
	'templating',
	'mologie:reactive-selectize@0.1.4',
	'aldeed:autoform@4.0.0'
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
