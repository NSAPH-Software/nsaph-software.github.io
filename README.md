# National Studies on Air Pollution and Health Software

This repo builds the NSAPH Software website, which is a collection of open-source packages to carry out **N**ational **S**tudies on **A**ir **P**ollution and **H**ealth.

To contribute to the website, please run the following:

```bash
# clone this repository
git clone https://github.com/NSAPH-Software/nsaph-software.github.io.git

# change directory to the cloned repository
cd nsaph-software.github.io

# install the required packages
conda install -f env_dev.yml

# build the website using make
make
```

Importantly, the make command will build the website and also go through the process of copying the build files to the `docs` directory, which is where GitHub Pages will serve the content from.

To preview the website locally, you can simply open the file `docs/index.html` in your web browser once the `make` command has completed.
