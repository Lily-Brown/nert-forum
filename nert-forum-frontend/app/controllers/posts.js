import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  actions: {
    addPost() {
      this.set('isEditing', true);
    },
    save() {
      this.get('store').createRecord('post', {
          title: this.get('postTitle'),
          textBody: this.get('postTextBody'),
          user: this.get('current.user')
        }).save();
    }
  }
});
