build_arm64:
	docker build --tag alexmaze/devenv:arm64-latest .

run_arm64:
	docker run --rm -it --hostname devenv alexmaze/devenv:arm64-latest zsh

build_amd64:
	docker build --tag alexmaze/devenv:amd64-latest .

run_amd64:
	docker run --rm -it --hostname devenv alexmaze/devenv:amd64-latest zsh
