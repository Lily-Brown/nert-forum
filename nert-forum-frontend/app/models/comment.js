import DS from 'ember-data';

export default DS.Model.extend({
  text_body: DS.attr('string'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date'),
  user: DS.belongsTo('user'),
  post: DS.belongsTo('post')
});