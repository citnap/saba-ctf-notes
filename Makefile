all: deploy

deploy:
	bash build.sh

clean:
	rm -rf ./writeups
