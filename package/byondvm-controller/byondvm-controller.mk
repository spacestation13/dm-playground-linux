################################################################################
#
# byondvm-controller
#
################################################################################

BYONDVM_CONTROLLER_VERSION = v2.1.0
BYONDVM_CONTROLLER_SITE = $(call github,spacestation13,dm-playground_controller,$(BYONDVM_CONTROLLER_VERSION))
BYONDVM_CONTROLLER_LICENSE = ISC

BYONDVM_CONTROLLER_DEPENDENCIES = host-rustc
BYONDVM_CONTROLLER_CARGO_ENV = \
	CARGO_HOME=$(HOST_DIR)/share/cargo \
	LIBRARY_PATH=$(HOST_DIR)/usr/lib

BYONDVM_CONTROLLER_CARGO_OPTS = \
	--release \
	--manifest-path=$(@D)/Cargo.toml \
	--target=$(RUSTC_TARGET_NAME)

define BYONDVM_CONTROLLER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BYONDVM_CONTROLLER_CARGO_ENV) \
		cargo build $(BYONDVM_CONTROLLER_CARGO_OPTS)
endef

define BYONDVM_CONTROLLER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/dm-playground_controller $(TARGET_DIR)/usr/bin/controller
endef

$(eval $(generic-package))
