import Ember from 'ember';

export default Ember.Controller.extend({
  current: Ember.inject.service(),
  actions: {
    login() { 
      this.get('model').save().then(
        function() {
          var currentService = this.get('current');
          var user = this.get('model.user');
          var authKey = this.get('model.authKey');
          currentService.set('user',user);
          currentService.set('token',authKey);
          this.transitionToRoute('user',user);
        }, 
        function() { 
          alert('Invalid email or password.'); 
        }
      );
    }
  }
});
