import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  email: DS.attr(),
  neighborhood: DS.attr(),
  image: DS.attr(),
  passwordDigest: DS.attr()
});
