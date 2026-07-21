
active-ssh:
	@eval "$(ssh-agent -s)"
	@ssh-add tgfdelivery-key.pem
	@ssh -A i tgfdelivery-key.pem ubuntu@3.214.144.213