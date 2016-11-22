import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  text_body: DS.attr('string')
});