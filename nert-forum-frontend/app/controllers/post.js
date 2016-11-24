import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  actions: {
    edit() {
      this.toggleProperty('isEditing');
    },
    save() {
      this.get('model').save().then(() => {
        this.toggleProperty('isEditing');
      });
    },
    delete() {
      this.get('model').destroyRecord().then(() => {
        this.transitionToRoute('posts');
      });
    },
    addComment() { 
      var currentUser = this.get('current.user');
      if (currentUser) {
        this.get('store').createRecord('comment', {
            textBody: this.get('newComment'),
            user: currentUser,
            post: this.get('model')
          }).save().then(() => {
                this.set('newComment','');
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
