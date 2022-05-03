# Contribution

Contributions to any of the NSAPH-Software packages are welcome and strongly encouraged.  These contributions can come in different forms, including but not limited to:

- Adding new features,
- Improving documentation, 
- Addressing open issues, 
- Reporting a bug or requesting a new feature,
- Fixing typos in the documentation, 
- Improving logging messages,
- And many more.

Please read the following documents before making changes to the codebase.

## Git Branching Model

Although, in your personal repository, you can pick any branch name, however, to keep consistency and understand who is working on what, the following convention is strongly recommended. In this project, we follow the convention that Vincent Driessen proposes in his [A successful Git branching model](A successful Git branching model) post.

Here is the summary of the branches:

- **master/main**: master/main branch only hosts the released software packages. Only project maintainers have a write-access on the master/main branch.  
- **develop**: develop branch is considered the main branch where the source code of HEAD always reflects a state with the latest delivered development changes for the next release.   
- **supporting branch**: There are different supporting branches; three main supporting branches that we suggest the contributors follow the naming convention include:   
  - **feature**: we start a new feature branch to add new features to the software. The naming convention is iss[issue_number]_short_description. For example, if I need to add unittest to one of the functions in the package and the issue number is 12, iss12_add_unittest can be a valid git branch name. We start with the issue number to go back and take a look at the issue details if necessary. Although feature branches are temporary, this naming convention helps developers to understand the situation while working on the codebase. If you are working on some features that there is no open issue for that, please open an issue and put a comment that you are working on that issue.    

    ```{note} 
    It is a good idea to consult with the package maintainers and/or core developers before committing significant time to add new features to make sure that it fits into the short-term and long-term release plans. 
    ```
  - **hotfix**: hotfix branches will be only used for fixing a bug on a released package. After fixing the bug, the third digit of the version number should be incremented by one. For example, 2.3.5 –> 2.3.6. These branches will be prefixed with hotfix and followed by the upcoming version number (e.g., in this case, hotfix_2.3.6)    
  - **release**: Release branches support the preparation of a new production release.    


## Submitting a Pull Request (PR)

All pull requests should be submitted to the develop branch of each package. Here is the PR checklist:

- If you added a new feature, make sure that appropriate unittests and documentation are also added.
- Make sure that you have merged the latest code from the develop branch into your feature branch. 
- Update the NEWS.md file with the changes that you make (Do not change the version or title of the NEWS.md file).
- Make sure to clean up white spaces. Read more [here](https://softwareengineering.stackexchange.com/questions/121555/why-is-trailing-whitespace-a-big-deal).
- Make sure the code passes all tests in your local system.
- After submitting a PR, please keep an eye on the CI test/check results. If there is a failed test or check, please address them and resubmit.  


## Reporting Bugs

Please report potential bugs by opening a new issue in the package repository. Please include the following information in your bug report:

- A brief description of what you are doing, what you expected to happen, and what happened.
- OS that you are using and whether you are using a personal computer or HPC cluster.
- The version of the package that you have installed.

## Scientific Discussions

In scientific research, many decisions can still be open research questions. We may choose an approach, document it, and move forward. However, other options can be valid and open to discussion. We strongly encourage contributing to these discussions under each repository's `Discussions` tab.

## Log Messages

All packages come with logging capabilities. Log messages are very important in understanding the internal processes, catching bugs, and developing robust software. If you add new features, please also add logging messages. TODO: Different levels of logging messages.

