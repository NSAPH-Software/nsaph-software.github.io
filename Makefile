github:
	@rm -rf docs/*
	@touch docs/.nojekyll
	@jupyter-book clean nsaph-software
	@jupyter-book build nsaph-software
	@cp -a nsaph-software/_build/html/. docs 
