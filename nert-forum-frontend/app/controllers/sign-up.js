import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    addUser() { 
      if (this.get('model.password') === this.get('passwordConfirmation')) {
        this.get('model').save().then(
          function() {
            this.transitionToRoute('users');
          });
      } else {
        alert('Passwords need to match.');
      }
    }
  }
});
