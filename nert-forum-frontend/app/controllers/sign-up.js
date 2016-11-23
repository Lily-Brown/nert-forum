import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    addUser() { 
      if (this.get('model.password') === this.get('passwordConfirmation')) {
        this.get('model').save();
      } else {
        alert('Passwords need to match.');
      }
    }
  }
});
