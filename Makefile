github:
	@rm -rf docs/*
	@touch docs/.nojekyll
	@jupyter-book build nsaph-software
	@cp -a nsaph-software/_build/html/. docs 
