deps:
	@echo \* Installing dependencies...
	apt update
	curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
	apt install nodejs -y
	curl -o- -L https://yarnpkg.com/install.sh | bash
	@echo \* ...done

site:
	@echo \* Preparing learnGitBranching website files...
	export PATH=$$HOME/.yarn/bin:$$HOME/.config/yarn/global/node_modules/.bin:$$PATH && \
	cd learnGitBranching && \
	git apply --whitespace=fix ../extension.patch && \
	yarn install && \
	yarn gulp fastBuild
	@echo \* ...done

rebuild-site:
	@echo \* Rebuilding learnGitBranching website files...
	export PATH=$$HOME/.yarn/bin:$$HOME/.config/yarn/global/node_modules/.bin:$$PATH && \
	cd learnGitBranching && \
	yarn gulp fastBuild
	@echo \* ...done

scorm:
	@echo \* Creating SCORM ZIP file...
	rm -rf dist
	mkdir dist
	cp -r imsmanifest.xml materials dist
	sed -i "s/Last edit: .../Last edit: $(shell date '+%Y-%m-%d %H:%M')/" dist/imsmanifest.xml
	cp -r learnGitBranching/build/* dist/materials
	cd dist && \
	zip "lgb-scorm-$(shell date '+%Y_%m_%d-%H_%M').zip" -r .
	@echo ------------------------------------------
	@echo \* SCORM ZIP file created:
	@ls ./dist/*.zip

clean:
	@echo \* Removing learnGitBranching website files and SCORM build directory...
	rm -rf learnGitBranching dist
	@echo \*...done
