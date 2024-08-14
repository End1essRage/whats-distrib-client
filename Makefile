#defaults
port ?= 8080

#для докера
d_build: 
	docker build -t end1essrage/whats-distrib-client .

d_run:
#удаляем все запущенный контейнеры с этим образом
	docker ps -a --filter "ancestor=end1essrage/whats-distrib-client" -q | xargs -r docker stop
	docker ps -a --filter "ancestor=end1essrage/whats-distrib-client" -q | xargs -r docker rm

	@container_id=$$(docker run --rm -d -p ${port}:8080 end1essrage/whats-distrib-client) && \
	echo "ID контейнера: $$container_id"

d_stop:
#как обычный флаг d_connect container=1234
	docker container stop ${container}
	docker container rm ${container}

d_connect:
	docker exec -it ${container} /bin/bash


#для подмена
p_build: 
	podman build -t end1essrage/whats-distrib-client .

p_run:
#удаляем все запущенный контейнеры с этим образом
	podman ps -a --filter "ancestor=end1essrage/whats-distrib-client" -q | xargs -r podman stop 
	podman ps -a --filter "ancestor=end1essrage/whats-distrib-client" -q | xargs -r podman rm 

	@container_id=$$(podman run --rm -d -p ${port}:8080 end1essrage/whats-distrib-client) && \
	echo "ID контейнера: $$container_id"

p_stop:
#как обычный флаг p_connect container=1234
	podman container stop ${container}
	podman container rm ${container}

p_connect:
	podman exec -it ${container} /bin/bash
