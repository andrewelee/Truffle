Truffle.Collections.Users = Backbone.Collection.extend({
  model: Truffle.Models.User,
  url: '/api/users',

	getOrFetch: function (id) {
    var users = this;
    var user;
		
    if (!(user = this.get(id))) {
      user = new Truffle.Models.User({ id: id });
      user.fetch({ success: function () { users.add(user); } });
		}
	
    return user;
	}
});
