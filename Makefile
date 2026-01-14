NAME       = booksim2
WORK_DIR  := $(shell pwd)
BUILD_DIR := $(WORK_DIR)/build
OBJ_DIR    = $(BUILD_DIR)/obj-$(NAME)

# Source files
INC_PATH += src src/arbiters src/allocators \
			src/routers src/networks src/power
CXXSRCS += $(wildcard src/*.cpp) $(wildcard src/*/*.cpp)

include scripts/flex_bison.mk
include scripts/build.mk
include scripts/manual.mk
include scripts/run.mk

.PHONY: all clean-all

all: app manual

clean-all:
	-rm -rf $(BUILD_DIR)
