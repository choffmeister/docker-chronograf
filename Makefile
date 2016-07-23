VERSION=0.13.0

run: build
	docker run -d -p 10000:10000 choffmeister/chronograf:$(VERSION)

push: build
	docker push choffmeister/chronograf:$(VERSION)

build:
	docker build -t choffmeister/chronograf:$(VERSION) .
