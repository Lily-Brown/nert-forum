import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  currentUser: function() {
    return this.get('current.user');
  },
  post: function() {
    return this.get('model');
  },
  postOwner: function() {
    return this.get('model.user');
  },
  actions: {
    edit() {
      this.toggleProperty('isEditing');
    },
    save() {
      if (this.currentUser()) {
        if (this.get('model.user.data') === this.get('current.user.data')) {
          this.post().save().then(() => {
            this.toggleProperty('isEditing');
          });
        } else {
          alert('You are not authorized to edit this User.');
        }
      } else {
        this.transitionToRoute('login');
      }
    },
    delete() {
      if (this.currentUser()) {
        if (this.get('model.user.data') === this.get('current.user.data')) {
          this.post().destroyRecord().then(() => {
            this.transitionToRoute('posts');
          });
        } else {
          alert('You are not authorized to delete this User.');
        }
      } else {
        this.transitionToRoute('login');
      }
    },
    addComment() { 
      if (this.currentUser()) {
        this.get('store').createRecord('comment', {
            textBody: this.get('newComment'),
            user: this.currentUser(),
            post: this.post()
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
