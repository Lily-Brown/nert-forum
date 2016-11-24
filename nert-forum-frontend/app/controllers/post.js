import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  currentUser: function() {
      return this.get('current.user');
    },
  actions: {
    edit() {
      this.toggleProperty('isEditing');
    },
    save() {
      if (this.currentUser()) {
        this.get('model').save().then(() => {
          this.toggleProperty('isEditing');
        });
      } else {
        this.transitionToRoute('login');
      }
    },
    delete() {
      if (this.currentUser()) {
        this.get('model').destroyRecord().then(() => {
          this.transitionToRoute('posts');
        });
      } else {
        this.transitionToRoute('login');
      }
    },
    addComment() { 
      if (this.currentUser()) {
        this.get('store').createRecord('comment', {
            textBody: this.get('newComment'),
            user: this.currentUser(),
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
