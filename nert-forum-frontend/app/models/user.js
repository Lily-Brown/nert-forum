import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  email: DS.attr('string'),
  neighborhood: DS.attr('string'),
  image: DS.attr('string'),
  password_digest: DS.attr('string'),
  posts: DS.hasMany('post'),
  comments: DS.hasMany('comment')
});