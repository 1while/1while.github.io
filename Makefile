
# run server local
.PHONY: a
a:
	hugo server --minify -D -p 1313

# generate site to the public folder
.PHONY: build
build:
	hugo

# commit
.PHONY: commit
commit:
	cd public
	git add .
	git commit
	git push

# clean
.PHONY: clean
clean:
	echo "clean"
	#@-rm -rf public

# public
.PHONY: p
p: clean build commit
