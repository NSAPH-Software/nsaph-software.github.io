(using_r_package_in_research)=
# Using an R Package in an Ongoing Research 

- By: Naeem Khoshnevis 
- Last Update: July 06, 2022


This blog post addresses the need to use a modified version of R packages in ongoing research studies. Most of our packages and 90% of open source packages are rapidly underdevelopment. Although they have the core modules for the initial research, they might not be sufficient for conducting similar or completely different analyses. As a result, at some point, either you need some new features in the package, or you would like to see some modified version of the implemented functions. This post will go through best practices for handling these situations. There are two main scenarios with several subsections:

- **Asking for new features** (you want the core developers (or any other open-source contributor) to implement it)
  - The changes are minor, or they fit in the current design.
  - The requested features may require some discussions, and you do not know where they fit. 
- **Implementing new features**
  - You do not plan on merging your code to the original code base.
  - You are not sure if you will merge the code to the original code base.
  - You plan on merging the code to the original code base.

The first category mainly deals with applied research, and the second category mostly happens with method research. 

## Asking for new features

We can divide the features based on their complexity, and wether it does fit in the current design or not.

### Minor changes

The best place to request for minor changes is the `issues` tab on the project repository. Although, opening an issue, opens doors for more discussions, it would be efficient if you put it in a user story format. 

```{note} User stories helps the developers to understand the feature. Here is a template:

- As a (who wants to accomplish something)
- I want to (what they want to accomplish)
- So that (why they want to accomplish that thing)

Examples: 
- As a Macbook Pro user, I want to be able define max memory limit, so I am not constrained by limited memory on my system. 

- As a PBS system user, I want to be able to submit separate jobs for each exposure level, so I can ask for less memory during job submission.  

Note: In scientific topics, it might not be easy to write the user stories in the exact format. Just try your best. 
```

### Major Enhancements

Significant enhancements require comprehensive discussions and sometimes revisions in the design. The best place to discuss these topics is the `Discussions` tab. Just open a new discussion and discuss your idea. We suggest checking other discussions first. It might be an ongoing discussion, and you can contribute to it rather than starting a new discussion. 

## Implementing new features

Sometimes, you need to control the codebase, modify it, and debug it. In these situations, first, you need to make sure that the package license allows you to get the code, and also, you need to build some communication with the package developers. The extent of the communication depends on your final goal with the development. In the following, the extent of the communication is listed from low to high. Technical details are mentioned in the next section. 

### You do not plan on merging your code to the original code base

If you are 100% sure that you are not going to ask for help, or merge your code to the original codebase, you can just fork the project into your Github account and start modifying the code. 

```{warning} According to the GPLv3 license, on which most of our packages are based, you are obligated to share your code after modification, regardless of the status of merging the code to the original codebase. 
```

### You are not sure if you will merge the code to the original code base

Sometimes, you are working on a new idea, and you try to see if you can get better results or prove a concept. You are planning to merge your changes if you get acceptable results. In that case, you need to:

- Follow the styling guides 
- Make sure you do not remove or modify the existing tests. 
- Make sure that your changes can pass old tests. 
- Closely track the developed branch and try to keep your branch updated as much as possible. 
- Keep your changes small and commit them with elaborate commit message. 
- Use new branches for subtasks. 
- Update NEWS.md file with each change.


### You plan on merging the code to the original code base

In case you are working on one of the open issues, or you need significant support from the core developers in adding new features, or you are working on some features that you are convinced that it should be part of the original code base, Additional to the previously mentioned tasks:

- Open an issue or a discussion if there isn't one.
- Attend the weekly meetings. 

## Technical Details

Regardless of your decision in merging the code, these are the steps to take:

- **Step 1**: Fork the project into your Github account.
- **Step 2**: Clone the repository into your local system.
- **Step 3**: Click on the `.Rproj` file to open the project in RStudio.
- **Step 4**: Install `devtools`.
  ```r
  install.packages("devtools")
  ```
- **Step 5**: Modify your code. 
- **Step 6**: Load modified code. 
  ```r
  devtools::load_all()
  ```
- **Step 7**: Repeat steps 5 and 6. 

## Frequently Asked Questions

- *How can I make sure that the code passes all tests?*

  - Run:
  ```r
  devtools::test()
  ```

- *How can I make sure that the code passes all checks?* 

  - Run:
  ```r
  devtools::check()
  ```

- *Where can I read more about these details?*

  - [R Packages](https://r-pkgs.org/) book by Hadley Wickham and Jenny Bryan is the best source to learn more about R packaging. 

- *I have changed the code and tested it; now I want to install it in another study; how can I make sure that I install the exact modified version?*

  - The best way is to install it from Github. Each commit has a hash value that can be used to install the package. For example:

  ```r
  library(devtools)
  try(detach("package:CausalGPS", unload = TRUE), silent = TRUE) # if already you have the package, detach and unload it, to have a new install. 
  install_github("fasrc/CausalGPS", ref="6b2b4d085eb53c5926f9deabe55da7d35c3b10aa")
  library(CausalGPS)
  ```

- *I need to add changes to one of the functions, as a result of those changes, the tests will fail, can I modify the tests?*

  - Modifying the tests are not recommended. However, in case, you have no choice, please, comment out the origininal test, and add your new tests. Put the commented out tests and new tests in the following blocks. 

  ```r

  ## --- TODO: Commented out tests ---
  # Test 1
  # Test 2
  # ...
  # ----------------------------------

  # --- TODO: Added tests ------------
  Test 1a
  Test 2a
  # ...
  # ----------------------------------

  ``` 

- *I want to refactor the entire function, what are the best practices?*

  -  In the case of major refactoring, please duplicate the function and add a numerical suffix. However, you need to keep the git history. A simple copy and paste will remove the original file's git history. To do that, let's say you are on the `main` branch and you want to create a duplicate of the `generate_pseudo_pop.R` file. You can follow these steps that mentioned [here](https://stackoverflow.com/a/46484848/6246352):

  ```sh
  git checkout -b duplicate # create and checkout to duplicate branch
  git mv generate_pseudo_pop.R generate_pseudo_pop_1.R # Make the duplicate
  git commit -m "duplicate generate_pseudo_pop.R to generate_pseudo_pop_1.R"
  git checkout HEAD~ generate_pseudo_pop.R # Bring back the original file.
  git commit -m "restore the original file."
  git checkout main # Switch back to the main branch
  git merge --no-ff duplicate # merge duplicate into main branch.
  ```
  

