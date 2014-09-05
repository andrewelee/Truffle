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

  // getOrFetch: function(id) {
  //   var user = this.get(id)
  //   if (user){
  //     user.fetch()
  //   } else {
  //     user = new Truffle.Models.User({ id: id })
  //     user.fetch({
  //       success: function() {
  //         Truffle.Collections.users.add(user);
  //       }
  //     });
  //   }
  //
  //   return user;
  // }
	
});

// What does this do again? Read up on get or fetch
// Truffle.Collections.users = new Truffle.Collections.Users();