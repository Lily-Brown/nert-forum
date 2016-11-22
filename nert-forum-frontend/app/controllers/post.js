import Ember from 'ember';

export default Ember.Controller.extend({
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
    }
  }
});
