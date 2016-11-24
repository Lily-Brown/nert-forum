import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  actions: {
    addPost() {
      this.set('isEditing', true);
    },
    save() {
      var currentUser = this.get('current.user');
      if (currentUser) {
        this.get('store').createRecord('post', {
            title: this.get('postTitle'),
            textBody: this.get('postTextBody'),
            user: currentUser
          }).save().then(() => {
              this.set('isEditing', false);
            },
            () => {
              alert('Changes have not been saved.');
            });
      } else {
        this.transitionToRoute('login');
      }
    }
  }
});
