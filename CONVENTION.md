## DXC Commit Message Proposition 

Every commit is important. 

By using an emoji on the commit messages it will help us figure out what kind of changes have been made 👌

---

## Why Keep a changelog ?

To make it easier for users and contributors to see what exactly 

## How do I make understandable changelog ?

### Guide

* Changelogs are for humans, not robots 🤖. 


* The latest version comes first (✔️)

* The release date of each version is displayed (✔️)

* The Same types of changes should be grouped (🔜@melfelah is working on it)

### Types of changes 

* New Features
* Changing an existing functionality
* Removing a feature 
* Fix a Bug
* Security Improving, in case of vulnerabilities 

## The Emoji Part

We need to follow some rules 

1. **IMPERATIVE** ↓
    - Make your Git commit messages imperative.
    - Write commit message like you're giving an order.
    - E.g., Use ✅ `Improve` instead of ❌ `Improved`.
    - E.g., Use ✅ `Create` instead of ❌ `Creating`.
1. **RULES** ↓
    - A small number of categories — easy to memorize.
    - Nothing more nothing less.
    - E.g. `📦NEW: `, `👌IMPROVE: `, `🐛FIX: `, `📖DOC: `, `🚀RELEASE: `, and  `✅TEST: `
1. **ACTIONS** ↓
    - Make git commits based on actions you take.
    - Use a good editor like [VSCode](https://code.visualstudio.com/) to commit the right files with commit messages.
<br>

### GETTING STARTED

Only use the following Git Commit Messages. A simple and small footprint is critical here.

1. `📦NEW: IMPERATIVE_MESSAGE_GOES_HERE`
    > Use when you add something entirely new.
    > E.g. `📦NEW: Add Git ignore file`

1. `👌IMPROVE: IMPERATIVE_MESSAGE_GOES_HERE`
    > Use when you improve/enhance piece of code like refactoring etc.
    > E.g. `👌IMPROVE: Remote IP API Function`

1. `🐛FIX: IMPERATIVE_MESSAGE_GOES_HERE`
    > Use when you fix a bug.
    > E.g. `🐛FIX: Rob Interaction`

1. `📖DOC: IMPERATIVE_MESSAGE_GOES_HERE`
    > Use when you add documentation like `README.md`, or even inline docs.
    > E.g. `📖DOC: Add Artifactory Documentation`


1. `🚀RELEASE: IMPERATIVE_MESSAGE_GOES_HERE`
    > Use when you release a new version.
    > E.g. `🚀RELEASE: Version 2.0.0`


1. `✅TEST: IMPERATIVE_MESSAGE_GOES_HERE`
    > Use when it's related to testing.
    > E.g. `✅TEST: Mock Lex interaction with rob`

_— Nothing more nothing less._

<br>

-------

### Commits Without Emoji 😧

Fixing function when rob is not responding


Improving Lex Utterances 


Writing Artifactory documentation.

Realsing chat vesion of Rob

Adding Unit Test to Jira

-----------

### Commits with Emoji 😃

🐛FIX: Fix Rob responding problem

👌IMPROVE: Update Lex Utterances 

📖DOC: Write Artifactory Documentation 

🚀RELEASE: Realase chat version of Rob

✅TEST: Add Unit-Test to Jira

----------

## How to add Emoji on comment ? 

There are various ways to make inserting emojis easier.

### OSX

You can pull up the emoji keyboard by hitting <kbd>ctrl</kbd>+<kbd>⌘</kbd>+<kbd>space</kbd>

### Windows 10

You can pull up the emoji keyboard by hitting <kbd>Win</kbd>+<kbd>;</kbd>

### Gnome Shell

You can show a list of emoji to copy to your system clipboard using the [Emoji Selector](https://extensions.gnome.org/extension/1162/emoji-selector/) Gnome extension.


### VS CODE

Install package for [Markdown Emoji](https://marketplace.visualstudio.com/search?term=emoji&target=VSCode&category=All categories&sortBy=Relevance).

### Vim 

Install package for [Vim-emoji](https://github.com/junegunn/vim-emoji#installation).

Add `set completefunc=emoji#complete` to `.vimrc` and then run emoji completion with `CTRL-X CTRL-U`








