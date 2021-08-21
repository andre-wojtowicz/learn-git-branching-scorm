deps:
	@echo \* Installing dependencies...
	apt update
	apt install nodejs npm -y
	npm install --global gulp-cli yarn
	@echo \* ...done

site:
	@echo \* Preparing learnGitBranching website files...
	git clone https://github.com/pcottle/learnGitBranching.git site
	cd site && \
	git apply --whitespace=nowarn ../extension.patch && \
	yarn install && \
	yarn gulp fastBuild
	@echo \* ...done

rebuild-site:
	@echo \* Rebuilding learnGitBranching website files...
	cd site && \
	yarn gulp fastBuild
	@echo \* ...done

scorm:
	@echo \* Creating SCORM ZIP file...
	rm -rf dist
	mkdir dist
	cp -r imsmanifest.xml materials dist
	sed -i "s/Last edit: .../Last edit: $(shell date '+%Y-%m-%d %H:%M')/" dist/imsmanifest.xml
	cp -r site/index.html site/build site/assets dist/materials
	cd dist && \
	zip "lgb-scorm-$(shell date '+%Y_%m_%d-%H_%M').zip" -r .
	@echo ------------------------------------------
	@echo \* SCORM ZIP file created:
	@ls ./dist/*.zip

clean:
	@echo \* Removing learnGitBranching website files and SCORM build directory...
	rm -rf site dist
	@echo \*...done
