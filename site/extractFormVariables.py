from flask import session, request

session['test'] = request.form.get('UserName')

formResult = '<p>Account created</p>'
print(formResult)