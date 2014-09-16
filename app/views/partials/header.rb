		%header
			-if current_user
				Hi #{current_user.username}!
				%a{ href: '/chits/new' }
					New Chit
				%form{ method: 'POST', action: '/sessions' }
					%input{ type: 'hidden', name: '_method', value: 'delete' }
					%input{ type: 'submit', value: 'Sign out' }
			-else
				%a{href: "/users/new"}
					Sign up
				%a{href: "/sessions/new"}
					Log in
