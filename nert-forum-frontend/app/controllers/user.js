import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  actions: {
    edit() {
      this.set('isEditing', true);
    },
    save() {
      var user = this.get('model');
      user.save().then(
        () => {
          this.set('isEditing', false);
        },
        (response) => {
          console.log(response.errors[0].detail)
          this.set('current.flash', 'Your changes were not saved.'); // TODO: Fix flash
        });
    }
  }
});
