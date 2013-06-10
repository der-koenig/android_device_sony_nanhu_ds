LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),nanhu_ds)
    include $(call first-makefiles-under,$(LOCAL_PATH))
endif
