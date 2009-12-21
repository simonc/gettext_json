// The GetText main class
function GetTextJson() {
  this.default_locale = 'en'; // The default locale to use
  this.locale         = null; // Can be set by the user
  this.translations   = null; // List of all translations

  // Returns the locale currently in use.
  // Returns default_locale if locale is null.
  this.current_locale = function() {
    if (typeof(this._current_locale) == 'undefined') {
      this._current_locale = (this.locale || this.default_locale);
    }
    return this._current_locale;
  };

  // Returns the translation of a string if it exists.
  // Otherwise the string itself is returned.
  this.translate = function(msgid) {
    var msgstr = msgid;
    var locale = this.current_locale();

    if (this.translations[locale] != undefined) {
       if (this.translations[locale][msgid] != undefined) {
         msgstr = this.translations[locale][msgid];
       }
    }
    return msgstr;
  };
  // Aliasing translate() to t()
  this.t = this.translate;
}

// Creating the GetText instance
var GetText = new GetTextJson();
