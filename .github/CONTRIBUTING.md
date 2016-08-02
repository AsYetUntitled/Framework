Contributing to AsYetUntitled
=======================

AsYetUntitled is an unofficial project spun off from [ArmaLife/Framework](https://github.com/ArmaLife/Framework). AsYetUntitled aims to improve upon Tonic's Altis Life RPG mission for both the Altis and Tanoa maps. 

## Guidelines

1. **Don't break the build**: We have a simple continuous integration system setup with [Travis](https://travis-ci.org/AsYetUntitled/Framework). If your pull request does not pass then it will not be merged. Travis will only check your changes after you submit a pull request. 
2. **Search before posting**: It is likely that what you have to say has already been said. Use the search function to see if someone else has already made a similar issue or pull request. 
3. **Test, test, and test** - Test your changes thoroughly prior to submitting a pull request. If you were unable to test your changes then ask if someone else can test them for you in your pull request message. Take it a step further and test another person's pull request and report your result to them. 
4. **Bug fixes over features** - New features may be cool, but ideally bug fixes and optimisations for existing features should be prioritised above implementing new features. 

## Issues
#### Before creating a new issue make sure to... 
* **...check that the issue you are reporting does not already exist.** 
  * If it does exist and it is still open then you may wish to add more information to that issue in a comment. 
  * If it does exist but it has been closed then comment on **that** issue instead of creating a new one. An [organisation member](https://github.com/AsYetUntitled) will then decide if the issue needs to be reopened. 
* **...check that you are using the latest files from the master branch.** 
  * If your files are behind then it is possible that the issue you are reporting has already been fixed in a recent commit. 
* **...check that you have not modified the files from what is on the repository.** 
  * If your files are different from what is on the repository then it is possible that a change that you made is what is causing the issue. 
* **...check that you can reproduce the issue**. 
  * If you cannot reproduce the issue then it can be very difficult to fix it. 

## Pull Requests
* If your pull request fixes an existing issue then be sure to associate your pull request with the issue. This means that if your pull request is merged then the corresponding issue will automatically be closed. See [closing issues via commit messages](https://help.github.com/articles/closing-issues-via-commit-messages/) for what keywords to use. 
* If your pull request fixes an issue that has not been reported then be sure to clearly specify the fix in your pull request message. 
* If your pull request adds a new feature to the mission then...
  * ...decide if the mission would actually benefit from your new feature. You may wish to create an issue to discuss the implementation of your feature with other contributors. 
    * ...if others think that your feature should be implemented then go ahead and submit a pull request. 
    * ...if not then consider posting a tutorial on how to install it on the [Altis Life RPG forums](http://www.altisliferpg.com/). 
  * ...be sure to thoroughly test your code for any errors and, if applicable, possible exploits. 
  * ...optimise your code to have as little impact on performance as possible. See [code optimisation](https://community.bistudio.com/wiki/Code_Optimisation) on the Bohemia Interactive Wiki for more information. 
  * ...if applicable, be sure to update the [BattlEye filters](https://github.com/AsYetUntitled/Framework/tree/master/BEFilters) and [SpyGlass variables](https://github.com/AsYetUntitled/Framework/blob/master/Altis_Life.Altis/config/Config_SpyGlass.hpp) to be compatible with your changes. If you are unsure on how to do so then ask if someone else would be kind enough to do so for you.

## Can I help?
* If you are knowledgeable in [SQF](https://community.bistudio.com/wiki/SQF_syntax), [SQL](https://en.wikipedia.org/wiki/SQL), [C++](https://en.wikipedia.org/wiki/C%2B%2B), or [regular expressions](http://www.regular-expressions.info/), or are fluent in one or more of [these languages](https://community.bistudio.com/wiki/Stringtable.xml#Languages) then **you** have what it takes to helps us expand and improve upon this mission. 
* If not, but you can setup your own server then you can help us test the build for bugs, exploits, security and performance issues. 

## Contact
If you need to chat with us in real-time then you can do so on [our Discord server](https://discord.gg/yfAMTFp). 
