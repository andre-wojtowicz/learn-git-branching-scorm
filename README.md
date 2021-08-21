# LearnGitBranching as SCORM

This repository contains scripts to wrap <https://learngitbranching.js.org> into SCORM package. I use it to grade students' activity in Moodle.

Install dependencies:

```shell
$ sudo make deps
```

Download [LearnGitBranching](https://github.com/pcottle/learnGitBranching) files and build site:

```shell
$ make site
```

Build `scorm.zip` in `dist` directory:

```shell
$ make scorm
```
