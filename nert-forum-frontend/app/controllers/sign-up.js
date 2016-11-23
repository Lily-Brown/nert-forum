import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    addUser() { 
      if (this.get('model.password') === this.get('passwordConfirmation')) {
        this.get('model').save().then(() => {
        console.log('here');
        this.transitionToRoute('users');
      });
      } else {
        alert('Passwords need to match.');
      }
    }
  }
});
