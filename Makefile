.PHONY: clean

test:
	g++ ./test.cpp
	./a.out
all:
	g++ ./test.cpp
	./a.out
	sh ./build.sh
clean:
	rm a.out
	rm -rf out
	rm -rf cache
