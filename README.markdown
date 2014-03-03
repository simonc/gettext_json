**ATTENTION:** This project is not maintained anymore.

# GettextJson

Rails plugin that make possible to use GetText ranslations in javascipt.

## Installation

GettextJson can be installed as a gem :

    gem install gettext_json

Or directly as a Rails plugin :

    ./script/plugin install git://github.com/simonc/gettext_json.git

Or as a dependency of your Rails app :

    # config/environment.rb
    config.gem "gettext_json", :version => ">= 0.0.2"
    
    # and then in the console
    rake gems:install

## Usage

### Initialization

To install the GettextJson files in your application use the following generator :

    ./script/generate gettext_json

It will create three files :

    public/javascripts/gettext_json.js
    lib/js_parser.rb
    lib/tasks/gettext_json.rake

`gettext_json.js` is the GetText micro library for javascript. To use gettext_json you have to call this file from your layout.  

`lib/js_parser.rb` is a Javascript gettext parser. To use it, require the file inn your rake tasks for gettext.  

`lib/tasks/gettext_json.rake` contains the `makemo:json` rake task.

For more informations, see [GetText micro library](http://wiki.github.com/simonc/gettext_json/gettext-micro-library)
and [Javascript parser](http://wiki.github.com/simonc/gettext_json/javascript-parser) in the wiki.

### Getting the translations

To create the translations file, use the following rake task :

    rake makemo:json

It will generate the `public/javascripts/gettext_json_translations.js` file that contains the translated strings for all languages.
To make the GetText translations work, you need to call this file in your layout.

### Use it in your scripts

To translate strings in your scripts, simply use the GetText micro library API :

    GetText.locale = 'fr'; // To set the current locale (default is 'en')
    
    var str = GetText.t('Hello World');
    //=> "Bonjour le Monde"

## Copyright

Copyright (c) 2009 Simon COURTOIS, released under the MIT license
