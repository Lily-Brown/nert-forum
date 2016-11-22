import DS from 'ember-data';

export default DS.Model.extend({
  textBody: DS.attr('string'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),
  user: DS.belongsTo('user'),
  post: DS.belongsTo('post')
});