deps:
	apt update
	apt install nodejs npm -y
	npm install --global gulp-cli yarn

site:
	git clone https://github.com/pcottle/learnGitBranching.git site
	cd site && \
	git apply --whitespace=nowarn ../extension.patch && \
	yarn install && \
	yarn gulp fastBuild

rebuild-site:
	cd site && \
	yarn gulp fastBuild

scorm:
	rm -rf dist
	mkdir dist
	cp -r imsmanifest.xml materials dist
	cp -r site/index.html site/build site/assets dist/materials
	cd dist && \
	zip scorm.zip -r .
	# ZIP file: ./dist/scorm.zip

clean:
	rm -rf site dist
