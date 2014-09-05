Truffle.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users/',

  likes: function () {
    var likes = Truffle.currentUser.get('likes');
    var collection = new Truffle.Collections.Likes();
    collection.reset(likes);
    return collection;
  },

  followedUsers: function () {
    var followedUsers = Truffle.currentUser.get('followedUsers');
    var collection = new Truffle.Collections.followedUsers();
    collection.reset(followedUsers);
    return collection;
  },

});