Contributing to AsYetUntitled
=======================

**AsYetUntitled** is a project spun off from [ArmaLife/Framework](https://github.com/ArmaLife/Framework). AsYetUntitled aims to improve upon [Tonic](https://github.com/TAWTonic)'s Altis Life RPG mission for both the [Altis](https://arma3.com/features/terrain) and [Tanoa](https://arma3.com/apex) maps. 

## Guidelines

1. **Don't break the build**: We have a simple continuous integration system setup with [Travis](https://travis-ci.org/AsYetUntitled/Framework). If your pull request does not pass then it will not be merged. Travis will only check your changes after you submit a pull request. 
2. **Search before posting**: It is likely that what you have to say has already been said. Use the search function to see if someone else has already made a similar issue or pull request. 
3. **Test, test, and test**: Test your changes thoroughly prior to submitting a pull request. If you were unable to test your changes then ask if someone else can test them for you in your pull request message. Take it a step further and test another person's pull request and report your result to them. 
4. **Bug fixes over features**: New features may be cool, but ideally bug fixes and optimisations for existing features should be prioritised above implementing new features. 

## Issues
#### Before creating a new issue make sure to... 
* **...check that the issue you are reporting does not already exist.** 
  * If it does exist and it is still open then you may wish to add more information to that issue in a comment. 
  * If it does exist but it has been closed then comment on **that** issue instead of creating a new one. An [organisation member](https://github.com/orgs/AsYetUntitled/people) will then decide if the issue needs to be reopened. 
* **...check that you are using the latest files from the master branch.** 
  * If your files are behind then it is possible that the issue you are reporting has already been fixed in a recent commit. 
* **...check that you have not modified the files from what is on the repository.** 
  * If your files are different from what is on the repository then it is possible that a change that you made is what is causing the issue. 
* **...check that you can reproduce the issue**. 
  * If you cannot reproduce the issue then it can be very difficult to fix it. 

#### When creating a new issue make sure to... 
* **...give your issue a descriptive but concise title.** 
  * Straightaway anyone should be able to understand what the issue is about just by reading the title. 
  * Avoid making the title ambiguous or a sentence that is finished in the body of your issue. 
* **...provide as much detail as necessary about the issue.** 
  * Describe what should have occurred. Provide screenshots or video footage if applicable. 
  * Describe what actually occurred. Provide screenshots or video footage if applicable. 
  * If you can reproduce the behaviour then also provide steps on how to do so. 
  * If errors or other messages were output to the game's [RPT](https://community.bistudio.com/wiki/Crash_Files) and/or extDB3 log files then paste those messages into your issue. If the errors or other messages are so long that they cover the whole screen then upload the log files to GitHub instead of pasting them into the issue. 
  * Include the version of Altis Life RPG that you are using. The version information can be found in core/[init.sqf](https://github.com/AsYetUntitled/Framework/blob/master/Altis_Life.Altis/core/init.sqf), briefingName in [mission.sqm](https://github.com/AsYetUntitled/Framework/tree/master/SQMs), or changelog in [briefing.sqf](https://github.com/AsYetUntitled/Framework/blob/master/Altis_Life.Altis/briefing.sqf). 
  * Include the version of *Arma 3* that you are using. You can acquire this info by starting the *Arma 3* launcher, clicking OPTIONS, and then clicking the version information displayed below. This will copy the info to your clipboard which you can then paste at the bottom of your issue. 
* **...tag your issue with all applicable labels (if you have the permissions to do so).** 
  * See [applying labels to issues and pull requests](https://help.github.com/articles/applying-labels-to-issues-and-pull-requests/). 
  * See [labels](https://github.com/AsYetUntitled/Framework/labels) for a list of the available custom labels. 
  * See [FAQ_Labels](https://github.com/AsYetUntitled/Framework/wiki/FAQ_Labels) on the wiki for the purpose of each label. 
* **...associate an applicable milestone to better track its progress (if you have the permissions to do so).** 
  * See [associating milestones with issues and pull requests](https://help.github.com/articles/associating-milestones-with-issues-and-pull-requests/). 
  * See [milestones](https://github.com/AsYetUntitled/Framework/milestones) for a list of available milestones. 
* **...assign yourself to the issue (if you intend to solve it and if you have the permissions to do so).** 
  * See [assigning issues and pull requests to other GitHub users](https://help.github.com/articles/assigning-issues-and-pull-requests-to-other-github-users/). 

## Pull Requests
* If your pull request fixes an existing issue then be sure to associate your pull request with the issue. This means that if your pull request is merged then the corresponding issue will automatically be closed. See [closing issues via commit messages](https://help.github.com/articles/closing-issues-using-keywords/) for what keywords to use. 
* If your pull request fixes an issue that has not been reported then be sure to clearly specify the fix in your pull request message. 
* If your pull request adds a new feature to the mission then...
  * ...decide if the mission would actually benefit from your new feature. You may wish to create an issue to discuss the implementation of your feature with other contributors. 
    * ...if others think that your feature should be implemented then go ahead and submit a pull request. 
  * ...be sure to thoroughly test your code for any errors and, if applicable, possible exploits. 
  * ...optimise your code to have as little impact on performance as possible. See [code optimisation](https://community.bistudio.com/wiki/Code_Optimisation) on the Bohemia Interactive Wiki for more information. 
  * ...if applicable, be sure to update the [BattlEye filters](https://github.com/AsYetUntitled/Framework/tree/master/BEFilters) and [SpyGlass variables](https://github.com/AsYetUntitled/Framework/blob/master/Altis_Life.Altis/config/Config_SpyGlass.hpp) to be compatible with your changes. If you are unsure on how to do so then ask if someone else would be kind enough to do so for you. 
* If you make a change to the [life_server](https://github.com/AsYetUntitled/Framework/tree/master/life_server) files then you (probably) have to make that same change to the corresponding [life_hc](https://github.com/AsYetUntitled/Framework/tree/master/life_hc) files or vice versa. 
* It is recommended that changes are committed to a new branch on your fork. Avoid directly editing the `master` branch. This practice helps prevent merge conflicts if changes are committed to the `master` branch ahead of your pull request being merged. See [creating and deleting branches within your repository](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/). 
* Keep to one bug fix, new feature, or other unique change per pull request. For example if you wish to fix two separate [issues](https://github.com/AsYetUntitled/Framework/issues) then please submit two pull requests. 

### Help! The Travis CI build failed!
* If the Travis CI build on your pull request fails then Travis may have detected a syntax error in the code. Click "Show all checks" near the bottom of your pull request and then click "Details" next to the check that failed. Search for "ERROR" to find what is causing the check to fail. 
* If the error is...
  * ..."possible missing white space after if detected" then you need to add a space after the `if`. 
    * Example: `if (condition) then { code } else { code }`
  * ..."possible missing [round/square/curly] [bracket/brace] detected" then check the syntax of your code. A syntax highlighter for the SQF language may be helpful. Syntax highlighting is available for [Notepad++](http://www.armaholic.com/page.php?id=8680&highlight=SQF%2BSYNTAX%2BHIGHLIGHTING) and [Atom](https://atom.io/packages/search?utf8=%E2%9C%93&q=language+arma+atom&commit=Search).
  * ..."possible missing semi-colon detected" then add a `;` where it is needed. 
  * ..."tab detected" then you need to indent with four (4) spaces for each one (1) tab. 

## Can I help?
* If you are competent in any of the below then you have what it takes to help us expand and improve upon this framework. 
  * [SQF](https://community.bistudio.com/wiki/SQF_syntax) - Scripting. 
  * [SQL](https://en.wikipedia.org/wiki/SQL) - Database structure. 
  * [C++](https://en.wikipedia.org/wiki/C%2B%2B) - Configs and [dialogs](https://community.bistudio.com/wiki/Dialog_Control). 
  * [Regular expressions](https://www.regular-expressions.info/) (Regex) - Enhanced [BattlEye filter](https://github.com/AsYetUntitled/Framework/tree/master/BEFilters) functionality. 
  * English, Czech, French, Spanish, Italian, Polish, Portuguese, Russian, or German - [Stringtable](https://community.bistudio.com/wiki/Stringtable.xml) localisation. 
* If not, but you can setup and run your own server, then you can help us test the build for bugs, exploits, security and performance issues. 
* See [issues](https://github.com/AsYetUntitled/Framework/issues) for a full list of all open tasks and bugs. If you would like to work on a solution to an issue then please leave a comment on that issue so that others know a solution is in progress. 

## Contact
* If you need to chat with us in real-time then you can do so on the [ArmA RPG Life Discord server](https://discord.gg/ajGUDSH). 
