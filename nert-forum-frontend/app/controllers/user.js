import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  currentUser: function() {
    return this.get('current.user');
  },
  actions: {
    edit() {
      this.set('isEditing', true);
    },
    save() {
      var user = this.get('model');
      if (this.currentUser()) {
        if (this.get('model.data') === this.get('current.user.data')) {
          user.save().then(
            () => {
              this.set('isEditing', false);
            },
            (response) => {
              alert('Your changes were not saved.'); // TODO: Fix flash
            });
        } else {
          this.transitionToRoute('user', this.currentUser()); // TODO: Fix transition?
          alert('You are not authorized to edit this User.');
        }
      } else {
        this.transitionToRoute('login');
      }
    }
  }
});
