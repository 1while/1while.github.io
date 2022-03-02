
# run server local
.PHONY: a
a:
	hugo server --minify -D -p 1314

# generate site to the public folder
.PHONY: b
b:
	hugo

# clean
.PHONY: c
c:
	@-rm -rf public