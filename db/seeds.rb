User.create(
        email: 'learric@gmail.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'Rickey',
        last_name: 'Lear',
        favorite_team: 'Auburn Tigers',
        role: 2,
        school_id: 1
)

User.create(
    email: 'jimowen52@aol.com',
    password: 'password',
    password_confirmation: 'password',
    first_name: 'Jim',
    last_name: 'Owen',
    favorite_team: 'Auburn Tigers',
    role: 2,
    school_id: 1
)

School.create(
          id: 1,
          name: 'The Chalkboard Classroom',
          address: '100 Main Street',
          city: 'Jackson',
          state: 'Alabama',
          zip: '36320',
          mascot: 'Tigers'
)