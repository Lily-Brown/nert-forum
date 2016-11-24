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
    },
    addComment() { 
      this.get('store').createRecord('comment', {
          textBody: this.get('newComment'),
          user: this.get('model.user'),
          post: this.get('model')
        }).save()then(() => {
              this.set('newComment','');
            },
            () => {
              alert('Changes have not been saved.');
            });
    }
  }
});
