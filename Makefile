USERNAME = ajdevries
IMAGE_NAME = sti-gradle

build:
	docker build -t $(IMAGE_NAME) .
	docker tag $(IMAGE_NAME) $(USERNAME)/$(IMAGE_NAME):latest

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
