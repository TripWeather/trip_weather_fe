def stub_omniauth
   OmniAuth.config.test_mode = true
   omniauth_google_hash = {
     provider: 'google_oauth2',
     uid: '100000000000000000000',
     info: {
       name: 'John Doe',
       email: 'john@doe.com',
       unverified_email: 'john@doe.com',
       email_verified: true,
       first_name: 'John',
       last_name: 'Doe',
       image: 'https://lh4.googleusercontent.com/photo.jpg'
     },
     credentials: {
       token: 'MOCK_OMNIAUTH_GOOGLE_TOKEN',
       refresh_token: 'MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN',
       expires_at: DateTime.now,
       expires: true
     },
     extra: {
       id_token: 'ID_TOKEN',

       raw_info: {
         sub: '100000000000000000000',
         name: 'John Doe',
         given_name: 'John',
         family_name: 'Doe',
         picture: 'https://lh4.googleusercontent.com/photo.jpg?sz=50',
         email: 'john@Doe.com',
         email_verified: 'true',
         locale: 'en'
       }
     }
   }
   OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(omniauth_google_hash)
 end
