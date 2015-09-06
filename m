From: =?iso-8859-1?Q?Cl=E9ment?= Vuchener <clement.vuchener@gmail.com>
Subject: How to properly unregister LED class devices?
Date: Sun, 6 Sep 2015 19:48:06 +0200
Message-ID: <20150906174806.GA16230@untxi.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:34280 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752091AbbIFRsO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 6 Sep 2015 13:48:14 -0400
Received: by wicfx3 with SMTP id fx3so66811706wic.1
        for <linux-leds@vger.kernel.org>; Sun, 06 Sep 2015 10:48:13 -0700 (PDT)
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: kernelnewbies@kernelnewbies.org
Cc: linux-leds@vger.kernel.org

Hello,

I am trying to write a driver that uses LED class devices using works for setting the LED brightness but I am not sure of how to unregister the devices.

I have been using code like this:
	led_classdev_unregister(&drvdata->backlight.cdev);
	cancel_work_sync(&drvdata->backlight.work);
trying with both flush_work or cancel_work_sync as I have seen it in other drivers.

Using flush_work, the kernel oops in my work function when I unplug the device. cancel_work_sync seems to fix that, but I am not sure it will work every time. I would like to understand what happens and if I am doing something wrong, to be sure it will not break in some different setup.

Another problem I have with this unregistering is that the LED brightness is set to zero when unregistering when the hardware is supposed to remember the last settings. Thus the LED state is reset when detaching and reattaching the driver.

Below is the full code from my driver, if you need it:

/*
 * HID driver for Corsair devices
 *
 * Supported devices:
 *  - Vengeance K90 Keyboard
 *
 * Copyright (c) 2015 Clement Vuchener
 */

/*
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option)
 * any later version.
 */

#include <linux/hid.h>
#include <linux/module.h>
#include <linux/usb.h>
#include <linux/leds.h>

#include "hid-ids.h"

struct k90_led {
	struct led_classdev cdev;
	int brightness;
	struct work_struct work;
};

struct k90_drvdata {
	int current_profile;
	int macro_mode;
	int meta_locked;
	struct k90_led backlight;
	struct k90_led record_led;
};

#define K90_GKEY_COUNT	18

static int k90_usage_to_gkey(unsigned int usage)
{
	/* G1 (0xd0) to G16 (0xdf) */
	if (usage >= 0xd0 && usage <= 0xdf)
		return usage - 0xd0 + 1;
	/* G17 (0xe8) to G18 (0xe9) */
	if (usage >= 0xe8 && usage <= 0xe9)
		return usage - 0xe8 + 17;
	return 0;
}

static unsigned short k90_gkey_map[K90_GKEY_COUNT] = {
	BTN_TRIGGER_HAPPY1,
	BTN_TRIGGER_HAPPY2,
	BTN_TRIGGER_HAPPY3,
	BTN_TRIGGER_HAPPY4,
	BTN_TRIGGER_HAPPY5,
	BTN_TRIGGER_HAPPY6,
	BTN_TRIGGER_HAPPY7,
	BTN_TRIGGER_HAPPY8,
	BTN_TRIGGER_HAPPY9,
	BTN_TRIGGER_HAPPY10,
	BTN_TRIGGER_HAPPY11,
	BTN_TRIGGER_HAPPY12,
	BTN_TRIGGER_HAPPY13,
	BTN_TRIGGER_HAPPY14,
	BTN_TRIGGER_HAPPY15,
	BTN_TRIGGER_HAPPY16,
	BTN_TRIGGER_HAPPY17,
	BTN_TRIGGER_HAPPY18,
};

module_param_array_named(gkey_codes, k90_gkey_map, ushort, NULL, S_IRUGO);

#define K90_USAGE_SPECIAL_MIN 0xf0
#define K90_USAGE_SPECIAL_MAX 0xff

#define K90_USAGE_MACRO_RECORD_START 0xf6
#define K90_USAGE_MACRO_RECORD_STOP 0xf7

#define K90_USAGE_PROFILE 0xf1
#define K90_USAGE_M1 0xf1
#define K90_USAGE_M2 0xf2
#define K90_USAGE_M3 0xf3
#define K90_USAGE_PROFILE_MAX 0xf3

#define K90_USAGE_META_OFF 0xf4
#define K90_USAGE_META_ON  0xf5

#define K90_USAGE_LIGHT 0xfa
#define K90_USAGE_LIGHT_OFF 0xfa
#define K90_USAGE_LIGHT_DIM 0xfb
#define K90_USAGE_LIGHT_MEDIUM 0xfc
#define K90_USAGE_LIGHT_BRIGHT 0xfd
#define K90_USAGE_LIGHT_MAX 0xfd

/* USB control protocol */

#define K90_REQUEST_BRIGHTNESS 49
#define K90_REQUEST_MACRO_MODE 2
#define K90_REQUEST_STATUS 4
#define K90_REQUEST_GET_MODE 5
#define K90_REQUEST_PROFILE 20

#define K90_MACRO_MODE_SW 0x0030
#define K90_MACRO_MODE_HW 0x0001

#define K90_MACRO_LED_ON  0x0020
#define K90_MACRO_LED_OFF 0x0040

/*
 * LED class devices
 */

#define K90_BACKLIGHT_LED_SUFFIX ":blue:backlight"
#define K90_RECORD_LED_SUFFIX ":red:record"

static enum led_brightness k90_brightness_get(struct led_classdev *led_cdev)
{
	struct k90_led *led = container_of(led_cdev, struct k90_led, cdev);

	return led->brightness;
}

static void k90_brightness_set(struct led_classdev *led_cdev,
			       enum led_brightness brightness)
{
	struct k90_led *led = container_of(led_cdev, struct k90_led, cdev);

	led->brightness = brightness;
	schedule_work(&led->work);
}

static void k90_backlight_work(struct work_struct *work)
{
	int ret;
	struct k90_led *led = container_of(work, struct k90_led, work);
	struct device *dev = led->cdev.dev->parent;
	struct usb_interface *usbif = to_usb_interface(dev->parent);
	struct usb_device *usbdev = interface_to_usbdev(usbif);

	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
			      K90_REQUEST_BRIGHTNESS,
			      USB_DIR_OUT | USB_TYPE_VENDOR |
			      USB_RECIP_DEVICE, led->brightness, 0,
			      NULL, 0, USB_CTRL_SET_TIMEOUT);
	if (ret != 0)
		dev_warn(dev, "Failed to set backlight brightness (error: %d).\n",
			 ret);
}

static void k90_record_led_work(struct work_struct *work)
{
	int ret;
	struct k90_led *led = container_of(work, struct k90_led, work);
	struct device *dev = led->cdev.dev->parent;
	struct usb_interface *usbif = to_usb_interface(dev->parent);
	struct usb_device *usbdev = interface_to_usbdev(usbif);
	int value;

	if (led->brightness > 0)
		value = K90_MACRO_LED_ON;
	else
		value = K90_MACRO_LED_OFF;

	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
			      K90_REQUEST_MACRO_MODE,
			      USB_DIR_OUT | USB_TYPE_VENDOR |
			      USB_RECIP_DEVICE, value, 0, NULL, 0,
			      USB_CTRL_SET_TIMEOUT);
	if (ret != 0)
		dev_warn(dev, "Failed to set record LED state (error: %d).\n",
			 ret);
}

/*
 * Keyboard attributes
 */

static ssize_t k90_show_macro_mode(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	struct k90_drvdata *drvdata = dev_get_drvdata(dev);

	return snprintf(buf, PAGE_SIZE, "%s\n",
			(drvdata->macro_mode ? "HW" : "SW"));
}

static ssize_t k90_store_macro_mode(struct device *dev,
				    struct device_attribute *attr,
				    const char *buf, size_t count)
{
	int ret;
	struct usb_interface *usbif = to_usb_interface(dev->parent);
	struct usb_device *usbdev = interface_to_usbdev(usbif);
	struct k90_drvdata *drvdata = dev_get_drvdata(dev);
	__u16 value;

	if (strncmp(buf, "SW", 2) == 0)
		value = K90_MACRO_MODE_SW;
	else if (strncmp(buf, "HW", 2) == 0)
		value = K90_MACRO_MODE_HW;
	else
		return -EINVAL;

	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
			      K90_REQUEST_MACRO_MODE,
			      USB_DIR_OUT | USB_TYPE_VENDOR |
			      USB_RECIP_DEVICE, value, 0, NULL, 0,
			      USB_CTRL_SET_TIMEOUT);
	if (ret != 0)
		return ret;

	drvdata->macro_mode = (value == K90_MACRO_MODE_HW);

	return count;
}

static ssize_t k90_show_current_profile(struct device *dev,
					struct device_attribute *attr,
					char *buf)
{
	struct k90_drvdata *drvdata = dev_get_drvdata(dev);

	return snprintf(buf, PAGE_SIZE, "%d\n", drvdata->current_profile);
}

static ssize_t k90_store_current_profile(struct device *dev,
					 struct device_attribute *attr,
					 const char *buf, size_t count)
{
	int ret;
	struct usb_interface *usbif = to_usb_interface(dev->parent);
	struct usb_device *usbdev = interface_to_usbdev(usbif);
	struct k90_drvdata *drvdata = dev_get_drvdata(dev);
	int profile;

	if (kstrtoint(buf, 10, &profile))
		return -EINVAL;
	if (profile < 1 || profile > 3)
		return -EINVAL;

	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
			      K90_REQUEST_PROFILE,
			      USB_DIR_OUT | USB_TYPE_VENDOR |
			      USB_RECIP_DEVICE, profile, 0, NULL, 0,
			      USB_CTRL_SET_TIMEOUT);
	if (ret != 0)
		return ret;

	drvdata->current_profile = profile;

	return count;
}

static DEVICE_ATTR(macro_mode, 0644, k90_show_macro_mode, k90_store_macro_mode);
static DEVICE_ATTR(current_profile, 0644, k90_show_current_profile,
		   k90_store_current_profile);

static struct attribute *k90_attrs[] = {
	&dev_attr_macro_mode.attr,
	&dev_attr_current_profile.attr,
	NULL
};

static const struct attribute_group k90_attr_group = {
	.attrs = k90_attrs,
};

/*
 * Driver functions
 */

static int k90_init_special_functions(struct hid_device *dev)
{
	int ret;
	struct usb_interface *usbif = to_usb_interface(dev->dev.parent);
	struct usb_device *usbdev = interface_to_usbdev(usbif);
	char data[8];
	struct k90_drvdata *drvdata =
	    kzalloc(sizeof(struct k90_drvdata), GFP_KERNEL);
	size_t name_sz;
	char *name;
	struct k90_led *led;

	if (!drvdata) {
		ret = -ENOMEM;
		goto fail_drvdata;
	}
	hid_set_drvdata(dev, drvdata);

	/* Get current status */
	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
			      K90_REQUEST_STATUS,
			      USB_DIR_IN | USB_TYPE_VENDOR |
			      USB_RECIP_DEVICE, 0, 0, data, 8,
			      USB_CTRL_SET_TIMEOUT);
	if (ret < 0) {
		hid_warn(dev, "Failed to get K90 initial state (error %d).\n",
			 ret);
		drvdata->backlight.brightness = 0;
		drvdata->current_profile = 1;
	} else {
		drvdata->backlight.brightness = data[4];
		drvdata->current_profile = data[7];
	}
	/* Get current mode */
	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
			      K90_REQUEST_GET_MODE,
			      USB_DIR_IN | USB_TYPE_VENDOR |
			      USB_RECIP_DEVICE, 0, 0, data, 2,
			      USB_CTRL_SET_TIMEOUT);
	if (ret < 0)
		hid_warn(dev, "Failed to get K90 initial mode (error %d).\n",
			 ret);
	else {
		switch (data[0]) {
		case K90_MACRO_MODE_HW:
			drvdata->macro_mode = 1;
			break;
		case K90_MACRO_MODE_SW:
			drvdata->macro_mode = 0;
			break;
		default:
			hid_warn(dev, "K90 in unknown mode: %02x.\n",
				 data[0]);
		}
	}

	/* Init LED device for backlight */
	name_sz =
	    strlen(dev_name(&dev->dev)) + sizeof(K90_BACKLIGHT_LED_SUFFIX);
	name = devm_kzalloc(&dev->dev, name_sz, GFP_KERNEL);
	if (!name) {
		ret = -ENOMEM;
		goto fail_backlight;
	}
	snprintf(name, name_sz, "%s" K90_BACKLIGHT_LED_SUFFIX,
		 dev_name(&dev->dev));
	led = &drvdata->backlight;
	led->cdev.name = name;
	led->cdev.max_brightness = 3;
	led->cdev.brightness_set = k90_brightness_set;
	led->cdev.brightness_get = k90_brightness_get;
	INIT_WORK(&led->work, k90_backlight_work);
	ret = led_classdev_register(&dev->dev, &led->cdev);
	if (ret != 0)
		goto fail_backlight;

	/* Init LED device for record LED */
	name_sz = strlen(dev_name(&dev->dev)) + sizeof(K90_RECORD_LED_SUFFIX);
	name = devm_kzalloc(&dev->dev, name_sz, GFP_KERNEL);
	if (!name) {
		ret = -ENOMEM;
		goto fail_record_led;
	}
	snprintf(name, name_sz, "%s" K90_RECORD_LED_SUFFIX,
		 dev_name(&dev->dev));
	led = &drvdata->record_led;
	led->cdev.name = name;
	led->cdev.max_brightness = 1;
	led->cdev.brightness_set = k90_brightness_set;
	led->cdev.brightness_get = k90_brightness_get;
	INIT_WORK(&led->work, k90_record_led_work);
	ret = led_classdev_register(&dev->dev, &led->cdev);
	if (ret != 0)
		goto fail_record_led;

	/* Init attributes */
	ret = sysfs_create_group(&dev->dev.kobj, &k90_attr_group);
	if (ret != 0)
		goto fail_sysfs;

	return 0;

fail_sysfs:
	led_classdev_unregister(&drvdata->record_led.cdev);
	cancel_work_sync(&drvdata->record_led.work);
fail_record_led:
	led_classdev_unregister(&drvdata->backlight.cdev);
	cancel_work_sync(&drvdata->backlight.work);
fail_backlight:
	kfree(drvdata);
fail_drvdata:
	hid_set_drvdata(dev, NULL);
	return ret;
}

static void k90_cleanup_special_functions(struct hid_device *dev)
{
	struct k90_drvdata *drvdata = hid_get_drvdata(dev);

	if (drvdata) {
		sysfs_remove_group(&dev->dev.kobj, &k90_attr_group);
		led_classdev_unregister(&drvdata->record_led.cdev);
		led_classdev_unregister(&drvdata->backlight.cdev);
		cancel_work_sync(&drvdata->record_led.work);
		cancel_work_sync(&drvdata->backlight.work);
		kfree(drvdata);
	}
}

static int k90_probe(struct hid_device *dev, const struct hid_device_id *id)
{
	int ret;
	struct usb_interface *usbif = to_usb_interface(dev->dev.parent);

	ret = hid_parse(dev);
	if (ret != 0) {
		hid_err(dev, "parse failed\n");
		return ret;
	}
	ret = hid_hw_start(dev, HID_CONNECT_DEFAULT);
	if (ret != 0) {
		hid_err(dev, "hw start failed\n");
		return ret;
	}

	if (usbif->cur_altsetting->desc.bInterfaceNumber == 0) {
		ret = k90_init_special_functions(dev);
		if (ret != 0)
			hid_warn(dev, "Failed to initialize K90 special functions.\n");
	} else
		hid_set_drvdata(dev, NULL);

	return 0;
}

static void k90_remove(struct hid_device *dev)
{
	struct usb_interface *usbif = to_usb_interface(dev->dev.parent);

	if (usbif->cur_altsetting->desc.bInterfaceNumber == 0)
		k90_cleanup_special_functions(dev);

	hid_hw_stop(dev);
}

static int k90_event(struct hid_device *dev, struct hid_field *field,
		     struct hid_usage *usage, __s32 value)
{
	struct k90_drvdata *drvdata = hid_get_drvdata(dev);

	if (!drvdata)
		return 0;

	switch (usage->hid & HID_USAGE) {
	case K90_USAGE_MACRO_RECORD_START:
		drvdata->record_led.brightness = 1;
		break;
	case K90_USAGE_MACRO_RECORD_STOP:
		drvdata->record_led.brightness = 0;
		break;
	case K90_USAGE_M1:
	case K90_USAGE_M2:
	case K90_USAGE_M3:
		drvdata->current_profile =
		    (usage->hid & HID_USAGE) - K90_USAGE_PROFILE + 1;
		break;
	case K90_USAGE_META_OFF:
		drvdata->meta_locked = 0;
		break;
	case K90_USAGE_META_ON:
		drvdata->meta_locked = 1;
		break;
	case K90_USAGE_LIGHT_OFF:
	case K90_USAGE_LIGHT_DIM:
	case K90_USAGE_LIGHT_MEDIUM:
	case K90_USAGE_LIGHT_BRIGHT:
		drvdata->backlight.brightness = (usage->hid & HID_USAGE) -
		    K90_USAGE_LIGHT;
		break;
	default:
		break;
	}

	return 0;
}

static int k90_input_mapping(struct hid_device *dev, struct hid_input *input,
			     struct hid_field *field, struct hid_usage *usage,
			     unsigned long **bit, int *max)
{
	int gkey;

	gkey = k90_usage_to_gkey(usage->hid & HID_USAGE);
	if (gkey != 0) {
		hid_map_usage_clear(input, usage, bit, max, EV_KEY,
				    k90_gkey_map[gkey - 1]);
		return 1;
	}
	if ((usage->hid & HID_USAGE) >= K90_USAGE_SPECIAL_MIN &&
	    (usage->hid & HID_USAGE) <= K90_USAGE_SPECIAL_MAX)
		return -1;

	return 0;
}

static const struct hid_device_id k90_devices[] = {
	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K90) },
	{}
};

MODULE_DEVICE_TABLE(hid, k90_devices);

static struct hid_driver k90_driver = {
	.name = "k90",
	.id_table = k90_devices,
	.probe = k90_probe,
	.event = k90_event,
	.remove = k90_remove,
	.input_mapping = k90_input_mapping,
};

static int __init k90_init(void)
{
	return hid_register_driver(&k90_driver);
}

static void k90_exit(void)
{
	hid_unregister_driver(&k90_driver);
}

module_init(k90_init);
module_exit(k90_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Clement Vuchener");
MODULE_DESCRIPTION("HID driver for Corsair Vengeance K90 Keyboard");
