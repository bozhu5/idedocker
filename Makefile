build: 
	docker build -t idedocker .
run:
	nvidia-docker run -h VIMIDE -it -v ~/workspace:/workspace idedocker:latest /bin/bash
	#nvidia-docker run -h VIMIDE -it -e "TERM=xterm-256color" -v ~/workspace:/workspace idedocker:latest /bin/bash
