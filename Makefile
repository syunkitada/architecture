add:
	sudo chown -R ${USER}:${USER} .
	find . -type d | grep -v .git | xargs chmod 755
	find . -type f | grep -v .git | xargs chmod 644
	git add .
