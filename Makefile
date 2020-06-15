

setup: clean get untar admin

get:
	wget -O orangeforum-v1.4.0.tar.gz https://github.com/s-gv/orangeforum/releases/download/v1.4.0/orangeforum-v1.4.0.tar.gz

untar:
	tar -xvzf orangeforum-v1.4.0.tar.gz

admin: orangeforum.db

orangeforum.db:
	./orangeforum -migrate
	./orangeforum -createsuperuser

clean:
	rm -fv orangeforum orangeforum.db orangeforum.db-shm orangeforum.db-wal orangeforum-v1.4.0.tar.gz

container:
	docker build -t eyedeekay/orangeforum .

docker:
	docker run -it --name orangeforum --restart always --publish 127.0.0.1:9123:9123 eyedeekay/orangeforum

backup:
	docker cp orangeforum:/opt/www/orangeforum.db orangeforum.db
	docker cp orangeforum:/opt/www/orangeforum.db-shm orangeforum.db-shm
	docker cp orangeforum:/opt/www/orangeforum.db-wal orangeforum.db-wal
