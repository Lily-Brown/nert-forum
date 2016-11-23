import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    addUser() { 
      if (this.get(model.password) == this.get(model.passwordConfirmation)) {
        this.get('store').createRecord('user', {
            name: this.get('model.name'),
            email: this.get('model.email'),
            password: this.get('password')
          }).save();
      } else {
        alert('Passwords need to match.');
      }

    }
  }
});
