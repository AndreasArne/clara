install:
	@sudo apt install cython lp-solve liblpsolve55-dev python3-dev
	@export LD_LIBRARY_PATH=/usr/lib/lp_solve/
	@python3 -m pip install --upgrade pip setuptools
	@pip install -r requirements.txt
	@python setup.py sdist
	@pip install dist/clara*.tar.gz

uninstall:
	@pip uninstall clara

reinstall:
	make uninstall
	make install

build:
	@python setup.py build

clean:
	@find . \( -name \*.pyc -o -name \*~ -o -name \*.so \) -exec rm -fv {} \;
	@find clara/ -name \*.c -exec rm -fv {} \;
	@rm -fv MANIFEST
	@rm -rvf build/ dist/
