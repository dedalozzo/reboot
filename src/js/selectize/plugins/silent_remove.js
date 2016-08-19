/**
 * Created by wadjei on 19/02/2015.
 */

Selectize.define('silent_remove', function(options){
  var self = this;

  // override the setup method to add an extra "click" handler
  this.on('item_remove', function(){
    this.plugin_silent_remove_in_remove = true;
  });

  this.search = (function() {
    var original = self.search;
    return function() {
      if (typeof(this.plugin_silent_remove_in_remove) != "undefined") {
        delete this.plugin_silent_remove_in_remove;
        return {
          items: {},
          query: [],
          tokens: []
        };
      }
      else {
        return original.apply(this, arguments);
      }
    };
  })();
});