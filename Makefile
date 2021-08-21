deps:
	apt update
	apt install nodejs npm -y
	npm install --global gulp-cli yarn

site:
	git clone https://github.com/pcottle/learnGitBranching.git site
	cd site && \
	yarn install && \
	yarn gulp fastBuild

scorm:
	rm -rf dist
	mkdir dist
	cp -r imsmanifest.xml materials dist
	cp -r site/index.html site/build site/assets dist/materials
	rm dist/materials/assets/learnGitBranching.png
	sed -e '/<meta property="og:url"/d' \
	    -e '/<meta property="og:image"/d' \
		-e '/<!-- The advantage/,/<\/script>/d' \
		-e '/<meta http-equiv="content-language" content="en">/a <script src="js/scorm.js" type="text/javascript"></script>' \
		-e 's/<body>/<body onload="ScormProcessInitialize();" onbeforeunload="ScormProcessTerminate();" onunload="ScormProcessTerminate();">/' \
		-i dist/materials/index.html
	cd dist && \
	zip scorm.zip -r .
	# ZIP file: ./dist/scorm.zip

clean:
	rm -rf site dist
