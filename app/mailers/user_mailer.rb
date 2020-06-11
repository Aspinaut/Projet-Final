class UserMailer < ApplicationMailer
 default from: 'no-reply@yopmail.com'
	def welcome_email(user)
		@user = user
		@url = 'http://monsite.fr/login'
		mail(to: '@user.email', subject: 'Bienvenue dans Reconversion Web Pro!')
	end
end
