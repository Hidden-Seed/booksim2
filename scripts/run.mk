CONFIG_PATH := netconfig
NET_NAME    ?= mesh
NET_CONFIG  := $(CONFIG_PATH)/$(NET_NAME)_config
SWEEP       := utils/sweep.sh

.PHONY: run run-sweep

run: $(PROG)
	$(PROG) $(NET_CONFIG)

run-sweep: $(PROG)
	$(SWEEP) $(PROG) $(NET_CONFIG)
