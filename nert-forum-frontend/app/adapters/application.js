// import DS from 'ember-data';
import Ember from 'ember';
import JSONAPIAdapter from 'ember-data/adapters/json-api';


const { String: { pluralize, underscore } } = Ember;

export default JSONAPIAdapter.extend({
  current: Ember.inject.service(),
  headers: function() {
    var token = this.get('current.token');
    return {
      "Authorization":'Token token=' + token
    };
  }.property().volatile(),

  pathForType(type) {
    return pluralize(underscore(type));
  }

});