add:
	sudo chown -R ${USER}:${USER} .
	find . -type d | grep -v .git | xargs chmod 755
	find . -type f | grep -v .git | xargs chmod 644
	git add .


fix-owner:
	sudo chown -R ${USER}:${USER} .
	find . -type d -exec chmod 755 \{\} \;
	find . -type f -exec chmod 644 \{\} \;
