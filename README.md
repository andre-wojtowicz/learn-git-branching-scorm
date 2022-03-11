# LearnGitBranching as SCORM

This repository contains scripts to wrap <https://learngitbranching.js.org> into SCORM package. I use it to grade students' activity in Moodle.

Latest automatic build are on [releases page](https://github.com/andre-wojtowicz/learn-git-branching-scorm/releases).

## Manual build

Clone this repo and init submodule:

```shell
$ git clone --recurse-submodules https://github.com/andre-wojtowicz/learn-git-branching-scorm.git
```

Install dependencies:

```shell
$ sudo make deps
```

Build site:

```shell
$ make site
```

Build `scorm.zip` in `dist` directory:

```shell
$ make scorm
```

## Moodle SCORM activity settings

```plaintext
Appearance:

    Display package:                        New window
    Width:                                  100%
    Height:                                 100%
    Options:                                [all unchecked]
    Student skip content structure page:    Always
    Disable preview mode:                   Yes
    Display activity name:                  [unchecked]
    Display course structure on entry page: No
    Display course structure in player:     Disabled
    Display attempt status:                 No

Grade:

    Grading method:                         Highest grade
    Maximum grade:                          1 (note: this can be customized
                                               in Gradebook setup)

Attempts management:

    Number of attempts:                     1
    Force new attempt:                      No
    Lock after final attempt:               No

Compatibility settings:

    Force completed:                        No
    Auto-continue:                          No
    Auto-commit:                            No
    Mastery score overrides status:         Yes
```