USER = gennadi
PATH_QMK = ./qmk_firmware

.PHONY: init
init:
	ln -s $(shell pwd)/corne $(PATH_QMK)/keyboards/crkbd/keymaps/$(USER)

.PHONY: compile
compile:
	# init submodule
	git submodule update --init --recursive

	cd $(PATH_QMK); qmk lint -km $(USER) -kb crkbd --strict
	make BUILD_DIR=$(shell pwd)/build/ -j1 -C qmk_firmware crkbd:$(USER)

.PHONY: clean
clean:
	rm -r build
