From: =?iso-8859-1?Q?Cl=E9ment?= Vuchener <clement.vuchener@gmail.com>
Subject: Re: How to properly unregister LED class devices?
Date: Mon, 7 Sep 2015 11:05:56 +0200
Message-ID: <20150907090556.GA2549@untxi.home>
References: <20150906174806.GA16230@untxi.home>
 <CA+aCy1FDeTiyXA3cRDEw795xrxrkiZJqgB41c2tXn+NDWpp=jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38455 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152AbbIGJGF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 05:06:05 -0400
Received: by wiclk2 with SMTP id lk2so76548818wic.1
        for <linux-leds@vger.kernel.org>; Mon, 07 Sep 2015 02:06:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CA+aCy1FDeTiyXA3cRDEw795xrxrkiZJqgB41c2tXn+NDWpp=jg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pranay Srivastava <pranjas@gmail.com>
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-leds@vger.kernel.org

On Mon, Sep 07, 2015 at 12:08:17PM +0530, Pranay Srivastava wrote:
> On Sun, Sep 6, 2015 at 11:18 PM, Cl=E9ment Vuchener
> <clement.vuchener@gmail.com> wrote:
> > Hello,
> >
> > I am trying to write a driver that uses LED class devices using wor=
ks for setting the LED brightness but I am not sure of how to unregiste=
r the devices.
> >
> > I have been using code like this:
> >         led_classdev_unregister(&drvdata->backlight.cdev);
> >         cancel_work_sync(&drvdata->backlight.work);
> > trying with both flush_work or cancel_work_sync as I have seen it i=
n other drivers.
> >
> > Using flush_work, the kernel oops in my work function when I unplug=
 the device. cancel_work_sync seems to fix that, but I am not sure it w=
ill work every time. I would like to understand what happens and if I a=
m doing something wrong, to be sure it will not break in some different=
 setup.
>=20
> Can you post the backtrace?
>=20

I could not get it with my patched kernel (I must be missing some confi=
g option) so I used the code as a module on my fedora 22 (4.1.6) kernel=
=2E

general protection fault: 0000 [#1] SMP=20
Modules linked in: hid_corsair_k90(OE) bnep bluetooth nf_nat_h323 nf_co=
nntrack_h323 nf_nat_pptp nf_nat_proto_gre nf_conntrack_pptp nf_conntrac=
k_proto_g
 snd_hda_codec_hdmi coretemp arc4 kvm_intel snd_hda_codec_realtek iwldv=
m kvm snd_hda_codec_generic mac80211 snd_hda_intel snd_hda_controller s=
nd_hda_co
CPU: 2 PID: 491 Comm: kworker/2:3 Tainted: G           OE   4.1.6-200.f=
c22.x86_64 #1
Hardware name: CLEVO CO.                        W350ET/W350ET, BIOS 1.0=
2.21PM v3 07/01/2013
Workqueue: events k90_record_led_work [hid_corsair_k90]
task: ffff880223bd4f00 ti: ffff8800c92a0000 task.ti: ffff8800c92a0000
RIP: 0010:[<ffffffff814e8816>]  [<ffffffff814e8816>] __dev_printk+0x26/=
0x90
RSP: 0018:ffff8800c92a3d48  EFLAGS: 00010202
RAX: 657079740000009d RBX: ffff8801fcee7800 RCX: 000000000001a2e1
RDX: ffff8800c92a3d58 RSI: ffff8801fcee7800 RDI: ffffffff81a2673f
RBP: ffff8800c92a3d48 R08: 0000001400730102 R09: ffff8800c92a3d58
R10: ffffffff81578c4b R11: 0000000000000000 R12: ffff88022f317000
R13: ffff88022f31b900 R14: 0000000000000080 R15: ffff8801fcc7d320
=46S:  0000000000000000(0000) GS:ffff88022f300000(0000) knlGS:000000000=
0000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000002eee850 CR3: 0000000002c0b000 CR4: 00000000001406e0
Stack:
 ffff8800c92a3db8 ffffffff814e8bd2 ffffffffa09701f8 ffff8800c92a3d68
 ffff880100000010 ffff8800c92a3dc8 ffff8800c92a3d88 000000002440e468
 0000000000000000 ffff8801fcee7800 00000000ffffffed 000000000001a2e1
Call Trace:
 [<ffffffff814e8bd2>] dev_warn+0x62/0x80
 [<ffffffffa096f44c>] k90_record_led_work+0x8c/0xa0 [hid_corsair_k90]
 [<ffffffff8179da31>] ? __schedule+0x241/0x720
 [<ffffffff810baadb>] process_one_work+0x1bb/0x410
 [<ffffffff810baeec>] worker_thread+0x1bc/0x480
 [<ffffffff810bad30>] ? process_one_work+0x410/0x410
 [<ffffffff810bad30>] ? process_one_work+0x410/0x410
 [<ffffffff810c0bf8>] kthread+0xd8/0xf0
 [<ffffffff810c0b20>] ? kthread_worker_fn+0x180/0x180
 [<ffffffff817a2322>] ret_from_fork+0x42/0x70
 [<ffffffff810c0b20>] ? kthread_worker_fn+0x180/0x180
Code: 00 00 00 00 00 0f 1f 44 00 00 55 48 85 f6 49 89 d1 48 89 e5 74 60=
 4c 8b 46 50 4d 85 c0 74 26 48 8b 86 90 00 00 00 48 85 c0 74 2a <48> 8b=
 08 0f be
RIP  [<ffffffff814e8816>] __dev_printk+0x26/0x90

> >
> > Another problem I have with this unregistering is that the LED brig=
htness is set to zero when unregistering when the hardware is supposed =
to remember the last settings. Thus the LED state is reset when detachi=
ng and reattaching the driver.
> >
> > Below is the full code from my driver, if you need it:
> >
> > /*
> >  * HID driver for Corsair devices
> >  *
> >  * Supported devices:
> >  *  - Vengeance K90 Keyboard
> >  *
> >  * Copyright (c) 2015 Clement Vuchener
> >  */
> >
> > /*
> >  * This program is free software; you can redistribute it and/or mo=
dify it
> >  * under the terms of the GNU General Public License as published b=
y the Free
> >  * Software Foundation; either version 2 of the License, or (at you=
r option)
> >  * any later version.
> >  */
> >
> > #include <linux/hid.h>
> > #include <linux/module.h>
> > #include <linux/usb.h>
> > #include <linux/leds.h>
> >
> > #include "hid-ids.h"
> >
> > struct k90_led {
> >         struct led_classdev cdev;
> >         int brightness;
> >         struct work_struct work;
> > };
> >
> > struct k90_drvdata {
> >         int current_profile;
> >         int macro_mode;
> >         int meta_locked;
> >         struct k90_led backlight;
> >         struct k90_led record_led;
> > };
> >
> > #define K90_GKEY_COUNT  18
> >
> > static int k90_usage_to_gkey(unsigned int usage)
> > {
> >         /* G1 (0xd0) to G16 (0xdf) */
> >         if (usage >=3D 0xd0 && usage <=3D 0xdf)
> >                 return usage - 0xd0 + 1;
> >         /* G17 (0xe8) to G18 (0xe9) */
> >         if (usage >=3D 0xe8 && usage <=3D 0xe9)
> >                 return usage - 0xe8 + 17;
> >         return 0;
> > }
> >
> > static unsigned short k90_gkey_map[K90_GKEY_COUNT] =3D {
> >         BTN_TRIGGER_HAPPY1,
> >         BTN_TRIGGER_HAPPY2,
> >         BTN_TRIGGER_HAPPY3,
> >         BTN_TRIGGER_HAPPY4,
> >         BTN_TRIGGER_HAPPY5,
> >         BTN_TRIGGER_HAPPY6,
> >         BTN_TRIGGER_HAPPY7,
> >         BTN_TRIGGER_HAPPY8,
> >         BTN_TRIGGER_HAPPY9,
> >         BTN_TRIGGER_HAPPY10,
> >         BTN_TRIGGER_HAPPY11,
> >         BTN_TRIGGER_HAPPY12,
> >         BTN_TRIGGER_HAPPY13,
> >         BTN_TRIGGER_HAPPY14,
> >         BTN_TRIGGER_HAPPY15,
> >         BTN_TRIGGER_HAPPY16,
> >         BTN_TRIGGER_HAPPY17,
> >         BTN_TRIGGER_HAPPY18,
> > };
> >
> > module_param_array_named(gkey_codes, k90_gkey_map, ushort, NULL, S_=
IRUGO);
> >
> > #define K90_USAGE_SPECIAL_MIN 0xf0
> > #define K90_USAGE_SPECIAL_MAX 0xff
> >
> > #define K90_USAGE_MACRO_RECORD_START 0xf6
> > #define K90_USAGE_MACRO_RECORD_STOP 0xf7
> >
> > #define K90_USAGE_PROFILE 0xf1
> > #define K90_USAGE_M1 0xf1
> > #define K90_USAGE_M2 0xf2
> > #define K90_USAGE_M3 0xf3
> > #define K90_USAGE_PROFILE_MAX 0xf3
> >
> > #define K90_USAGE_META_OFF 0xf4
> > #define K90_USAGE_META_ON  0xf5
> >
> > #define K90_USAGE_LIGHT 0xfa
> > #define K90_USAGE_LIGHT_OFF 0xfa
> > #define K90_USAGE_LIGHT_DIM 0xfb
> > #define K90_USAGE_LIGHT_MEDIUM 0xfc
> > #define K90_USAGE_LIGHT_BRIGHT 0xfd
> > #define K90_USAGE_LIGHT_MAX 0xfd
> >
> > /* USB control protocol */
> >
> > #define K90_REQUEST_BRIGHTNESS 49
> > #define K90_REQUEST_MACRO_MODE 2
> > #define K90_REQUEST_STATUS 4
> > #define K90_REQUEST_GET_MODE 5
> > #define K90_REQUEST_PROFILE 20
> >
> > #define K90_MACRO_MODE_SW 0x0030
> > #define K90_MACRO_MODE_HW 0x0001
> >
> > #define K90_MACRO_LED_ON  0x0020
> > #define K90_MACRO_LED_OFF 0x0040
> >
> > /*
> >  * LED class devices
> >  */
> >
> > #define K90_BACKLIGHT_LED_SUFFIX ":blue:backlight"
> > #define K90_RECORD_LED_SUFFIX ":red:record"
> >
> > static enum led_brightness k90_brightness_get(struct led_classdev *=
led_cdev)
> > {
> >         struct k90_led *led =3D container_of(led_cdev, struct k90_l=
ed, cdev);
> >
> >         return led->brightness;
> > }
> >
> > static void k90_brightness_set(struct led_classdev *led_cdev,
> >                                enum led_brightness brightness)
> > {
> >         struct k90_led *led =3D container_of(led_cdev, struct k90_l=
ed, cdev);
> >
> >         led->brightness =3D brightness;
> >         schedule_work(&led->work);
> > }
> >
> > static void k90_backlight_work(struct work_struct *work)
> > {
> >         int ret;
> >         struct k90_led *led =3D container_of(work, struct k90_led, =
work);
> >         struct device *dev =3D led->cdev.dev->parent;
> >         struct usb_interface *usbif =3D to_usb_interface(dev->paren=
t);
> >         struct usb_device *usbdev =3D interface_to_usbdev(usbif);
> >
> >         ret =3D usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
> >                               K90_REQUEST_BRIGHTNESS,
> >                               USB_DIR_OUT | USB_TYPE_VENDOR |
> >                               USB_RECIP_DEVICE, led->brightness, 0,
> >                               NULL, 0, USB_CTRL_SET_TIMEOUT);
> >         if (ret !=3D 0)
> >                 dev_warn(dev, "Failed to set backlight brightness (=
error: %d).\n",
> >                          ret);
> > }
> >
> > static void k90_record_led_work(struct work_struct *work)
> > {
> >         int ret;
> >         struct k90_led *led =3D container_of(work, struct k90_led, =
work);
> >         struct device *dev =3D led->cdev.dev->parent;
> >         struct usb_interface *usbif =3D to_usb_interface(dev->paren=
t);
> >         struct usb_device *usbdev =3D interface_to_usbdev(usbif);
> >         int value;
> >
> >         if (led->brightness > 0)
> >                 value =3D K90_MACRO_LED_ON;
> >         else
> >                 value =3D K90_MACRO_LED_OFF;
> >
> >         ret =3D usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
> >                               K90_REQUEST_MACRO_MODE,
> >                               USB_DIR_OUT | USB_TYPE_VENDOR |
> >                               USB_RECIP_DEVICE, value, 0, NULL, 0,
> >                               USB_CTRL_SET_TIMEOUT);
> >         if (ret !=3D 0)
> >                 dev_warn(dev, "Failed to set record LED state (erro=
r: %d).\n",
> >                          ret);
> > }
> >
> > /*
> >  * Keyboard attributes
> >  */
> >
> > static ssize_t k90_show_macro_mode(struct device *dev,
> >                                    struct device_attribute *attr, c=
har *buf)
> > {
> >         struct k90_drvdata *drvdata =3D dev_get_drvdata(dev);
> >
> >         return snprintf(buf, PAGE_SIZE, "%s\n",
> >                         (drvdata->macro_mode ? "HW" : "SW"));
> > }
> >
> > static ssize_t k90_store_macro_mode(struct device *dev,
> >                                     struct device_attribute *attr,
> >                                     const char *buf, size_t count)
> > {
> >         int ret;
> >         struct usb_interface *usbif =3D to_usb_interface(dev->paren=
t);
> >         struct usb_device *usbdev =3D interface_to_usbdev(usbif);
> >         struct k90_drvdata *drvdata =3D dev_get_drvdata(dev);
> >         __u16 value;
> >
> >         if (strncmp(buf, "SW", 2) =3D=3D 0)
> >                 value =3D K90_MACRO_MODE_SW;
> >         else if (strncmp(buf, "HW", 2) =3D=3D 0)
> >                 value =3D K90_MACRO_MODE_HW;
> >         else
> >                 return -EINVAL;
> >
> >         ret =3D usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
> >                               K90_REQUEST_MACRO_MODE,
> >                               USB_DIR_OUT | USB_TYPE_VENDOR |
> >                               USB_RECIP_DEVICE, value, 0, NULL, 0,
> >                               USB_CTRL_SET_TIMEOUT);
> >         if (ret !=3D 0)
> >                 return ret;
> >
> >         drvdata->macro_mode =3D (value =3D=3D K90_MACRO_MODE_HW);
> >
> >         return count;
> > }
> >
> > static ssize_t k90_show_current_profile(struct device *dev,
> >                                         struct device_attribute *at=
tr,
> >                                         char *buf)
> > {
> >         struct k90_drvdata *drvdata =3D dev_get_drvdata(dev);
> >
> >         return snprintf(buf, PAGE_SIZE, "%d\n", drvdata->current_pr=
ofile);
> > }
> >
> > static ssize_t k90_store_current_profile(struct device *dev,
> >                                          struct device_attribute *a=
ttr,
> >                                          const char *buf, size_t co=
unt)
> > {
> >         int ret;
> >         struct usb_interface *usbif =3D to_usb_interface(dev->paren=
t);
> >         struct usb_device *usbdev =3D interface_to_usbdev(usbif);
> >         struct k90_drvdata *drvdata =3D dev_get_drvdata(dev);
> >         int profile;
> >
> >         if (kstrtoint(buf, 10, &profile))
> >                 return -EINVAL;
> >         if (profile < 1 || profile > 3)
> >                 return -EINVAL;
> >
> >         ret =3D usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
> >                               K90_REQUEST_PROFILE,
> >                               USB_DIR_OUT | USB_TYPE_VENDOR |
> >                               USB_RECIP_DEVICE, profile, 0, NULL, 0=
,
> >                               USB_CTRL_SET_TIMEOUT);
> >         if (ret !=3D 0)
> >                 return ret;
> >
> >         drvdata->current_profile =3D profile;
> >
> >         return count;
> > }
> >
> > static DEVICE_ATTR(macro_mode, 0644, k90_show_macro_mode, k90_store=
_macro_mode);
> > static DEVICE_ATTR(current_profile, 0644, k90_show_current_profile,
> >                    k90_store_current_profile);
> >
> > static struct attribute *k90_attrs[] =3D {
> >         &dev_attr_macro_mode.attr,
> >         &dev_attr_current_profile.attr,
> >         NULL
> > };
> >
> > static const struct attribute_group k90_attr_group =3D {
> >         .attrs =3D k90_attrs,
> > };
> >
> > /*
> >  * Driver functions
> >  */
> >
> > static int k90_init_special_functions(struct hid_device *dev)
> > {
> >         int ret;
> >         struct usb_interface *usbif =3D to_usb_interface(dev->dev.p=
arent);
> >         struct usb_device *usbdev =3D interface_to_usbdev(usbif);
> >         char data[8];
> >         struct k90_drvdata *drvdata =3D
> >             kzalloc(sizeof(struct k90_drvdata), GFP_KERNEL);
> >         size_t name_sz;
> >         char *name;
> >         struct k90_led *led;
> >
> >         if (!drvdata) {
> >                 ret =3D -ENOMEM;
> >                 goto fail_drvdata;
> >         }
> >         hid_set_drvdata(dev, drvdata);
> >
> >         /* Get current status */
> >         ret =3D usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
> >                               K90_REQUEST_STATUS,
> >                               USB_DIR_IN | USB_TYPE_VENDOR |
> >                               USB_RECIP_DEVICE, 0, 0, data, 8,
> >                               USB_CTRL_SET_TIMEOUT);
> >         if (ret < 0) {
> >                 hid_warn(dev, "Failed to get K90 initial state (err=
or %d).\n",
> >                          ret);
> >                 drvdata->backlight.brightness =3D 0;
> >                 drvdata->current_profile =3D 1;
> >         } else {
> >                 drvdata->backlight.brightness =3D data[4];
> >                 drvdata->current_profile =3D data[7];
> >         }
> >         /* Get current mode */
> >         ret =3D usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0),
> >                               K90_REQUEST_GET_MODE,
> >                               USB_DIR_IN | USB_TYPE_VENDOR |
> >                               USB_RECIP_DEVICE, 0, 0, data, 2,
> >                               USB_CTRL_SET_TIMEOUT);
> >         if (ret < 0)
> >                 hid_warn(dev, "Failed to get K90 initial mode (erro=
r %d).\n",
> >                          ret);
> >         else {
> >                 switch (data[0]) {
> >                 case K90_MACRO_MODE_HW:
> >                         drvdata->macro_mode =3D 1;
> >                         break;
> >                 case K90_MACRO_MODE_SW:
> >                         drvdata->macro_mode =3D 0;
> >                         break;
> >                 default:
> >                         hid_warn(dev, "K90 in unknown mode: %02x.\n=
",
> >                                  data[0]);
> >                 }
> >         }
> >
> >         /* Init LED device for backlight */
> >         name_sz =3D
> >             strlen(dev_name(&dev->dev)) + sizeof(K90_BACKLIGHT_LED_=
SUFFIX);
> >         name =3D devm_kzalloc(&dev->dev, name_sz, GFP_KERNEL);
> >         if (!name) {
> >                 ret =3D -ENOMEM;
> >                 goto fail_backlight;
> >         }
> >         snprintf(name, name_sz, "%s" K90_BACKLIGHT_LED_SUFFIX,
> >                  dev_name(&dev->dev));
> >         led =3D &drvdata->backlight;
> >         led->cdev.name =3D name;
> >         led->cdev.max_brightness =3D 3;
> >         led->cdev.brightness_set =3D k90_brightness_set;
> >         led->cdev.brightness_get =3D k90_brightness_get;
> >         INIT_WORK(&led->work, k90_backlight_work);
> >         ret =3D led_classdev_register(&dev->dev, &led->cdev);
> >         if (ret !=3D 0)
> >                 goto fail_backlight;
> >
> >         /* Init LED device for record LED */
> >         name_sz =3D strlen(dev_name(&dev->dev)) + sizeof(K90_RECORD=
_LED_SUFFIX);
> >         name =3D devm_kzalloc(&dev->dev, name_sz, GFP_KERNEL);
> >         if (!name) {
> >                 ret =3D -ENOMEM;
> >                 goto fail_record_led;
> >         }
> >         snprintf(name, name_sz, "%s" K90_RECORD_LED_SUFFIX,
> >                  dev_name(&dev->dev));
> >         led =3D &drvdata->record_led;
> >         led->cdev.name =3D name;
> >         led->cdev.max_brightness =3D 1;
> >         led->cdev.brightness_set =3D k90_brightness_set;
> >         led->cdev.brightness_get =3D k90_brightness_get;
> >         INIT_WORK(&led->work, k90_record_led_work);
> >         ret =3D led_classdev_register(&dev->dev, &led->cdev);
> >         if (ret !=3D 0)
> >                 goto fail_record_led;
> >
> >         /* Init attributes */
> >         ret =3D sysfs_create_group(&dev->dev.kobj, &k90_attr_group)=
;
> >         if (ret !=3D 0)
> >                 goto fail_sysfs;
> >
> >         return 0;
> >
> > fail_sysfs:
> >         led_classdev_unregister(&drvdata->record_led.cdev);
> >         cancel_work_sync(&drvdata->record_led.work);
> > fail_record_led:
> >         led_classdev_unregister(&drvdata->backlight.cdev);
> >         cancel_work_sync(&drvdata->backlight.work);
> > fail_backlight:
> >         kfree(drvdata);
> > fail_drvdata:
> >         hid_set_drvdata(dev, NULL);
> >         return ret;
> > }
> >
> > static void k90_cleanup_special_functions(struct hid_device *dev)
> > {
> >         struct k90_drvdata *drvdata =3D hid_get_drvdata(dev);
> >
> >         if (drvdata) {
> >                 sysfs_remove_group(&dev->dev.kobj, &k90_attr_group)=
;
> >                 led_classdev_unregister(&drvdata->record_led.cdev);
> >                 led_classdev_unregister(&drvdata->backlight.cdev);
>=20
> flush_work/cancel_work before doing unregistering?
>=20
If led_classdev_unregister generates work (setting the brightness to ze=
ro), there will still be work in the workqueue after the cleanup. I don=
't understand why the work should be flushed/cancelled while the led de=
vice is still active.
> >                 cancel_work_sync(&drvdata->record_led.work);
> >                 cancel_work_sync(&drvdata->backlight.work);
> >                 kfree(drvdata);
> >         }
> > }
> >
> > static int k90_probe(struct hid_device *dev, const struct hid_devic=
e_id *id)
> > {
> >         int ret;
> >         struct usb_interface *usbif =3D to_usb_interface(dev->dev.p=
arent);
> >
> >         ret =3D hid_parse(dev);
> >         if (ret !=3D 0) {
> >                 hid_err(dev, "parse failed\n");
> >                 return ret;
> >         }
> >         ret =3D hid_hw_start(dev, HID_CONNECT_DEFAULT);
> >         if (ret !=3D 0) {
> >                 hid_err(dev, "hw start failed\n");
> >                 return ret;
> >         }
> >
> >         if (usbif->cur_altsetting->desc.bInterfaceNumber =3D=3D 0) =
{
> >                 ret =3D k90_init_special_functions(dev);
> >                 if (ret !=3D 0)
> >                         hid_warn(dev, "Failed to initialize K90 spe=
cial functions.\n");
> >         } else
> >                 hid_set_drvdata(dev, NULL);
> >
> >         return 0;
> > }
> >
> > static void k90_remove(struct hid_device *dev)
> > {
> >         struct usb_interface *usbif =3D to_usb_interface(dev->dev.p=
arent);
> >
> >         if (usbif->cur_altsetting->desc.bInterfaceNumber =3D=3D 0)
> >                 k90_cleanup_special_functions(dev);
> >
> >         hid_hw_stop(dev);
> > }
> >
> > static int k90_event(struct hid_device *dev, struct hid_field *fiel=
d,
> >                      struct hid_usage *usage, __s32 value)
> > {
> >         struct k90_drvdata *drvdata =3D hid_get_drvdata(dev);
> >
> >         if (!drvdata)
> >                 return 0;
> >
> >         switch (usage->hid & HID_USAGE) {
> >         case K90_USAGE_MACRO_RECORD_START:
> >                 drvdata->record_led.brightness =3D 1;
> >                 break;
> >         case K90_USAGE_MACRO_RECORD_STOP:
> >                 drvdata->record_led.brightness =3D 0;
> >                 break;
> >         case K90_USAGE_M1:
> >         case K90_USAGE_M2:
> >         case K90_USAGE_M3:
> >                 drvdata->current_profile =3D
> >                     (usage->hid & HID_USAGE) - K90_USAGE_PROFILE + =
1;
> >                 break;
> >         case K90_USAGE_META_OFF:
> >                 drvdata->meta_locked =3D 0;
> >                 break;
> >         case K90_USAGE_META_ON:
> >                 drvdata->meta_locked =3D 1;
> >                 break;
> >         case K90_USAGE_LIGHT_OFF:
> >         case K90_USAGE_LIGHT_DIM:
> >         case K90_USAGE_LIGHT_MEDIUM:
> >         case K90_USAGE_LIGHT_BRIGHT:
> >                 drvdata->backlight.brightness =3D (usage->hid & HID=
_USAGE) -
> >                     K90_USAGE_LIGHT;
> >                 break;
> >         default:
> >                 break;
> >         }
> >
> >         return 0;
> > }
> >
> > static int k90_input_mapping(struct hid_device *dev, struct hid_inp=
ut *input,
> >                              struct hid_field *field, struct hid_us=
age *usage,
> >                              unsigned long **bit, int *max)
> > {
> >         int gkey;
> >
> >         gkey =3D k90_usage_to_gkey(usage->hid & HID_USAGE);
> >         if (gkey !=3D 0) {
> >                 hid_map_usage_clear(input, usage, bit, max, EV_KEY,
> >                                     k90_gkey_map[gkey - 1]);
> >                 return 1;
> >         }
> >         if ((usage->hid & HID_USAGE) >=3D K90_USAGE_SPECIAL_MIN &&
> >             (usage->hid & HID_USAGE) <=3D K90_USAGE_SPECIAL_MAX)
> >                 return -1;
> >
> >         return 0;
> > }
> >
> > static const struct hid_device_id k90_devices[] =3D {
> >         { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSA=
IR_K90) },
> >         {}
> > };
> >
> > MODULE_DEVICE_TABLE(hid, k90_devices);
> >
> > static struct hid_driver k90_driver =3D {
> >         .name =3D "k90",
> >         .id_table =3D k90_devices,
> >         .probe =3D k90_probe,
> >         .event =3D k90_event,
> >         .remove =3D k90_remove,
> >         .input_mapping =3D k90_input_mapping,
> > };
> >
> > static int __init k90_init(void)
> > {
> >         return hid_register_driver(&k90_driver);
> > }
> >
> > static void k90_exit(void)
> > {
> >         hid_unregister_driver(&k90_driver);
> > }
> >
> > module_init(k90_init);
> > module_exit(k90_exit);
> >
> > MODULE_LICENSE("GPL");
> > MODULE_AUTHOR("Clement Vuchener");
> > MODULE_DESCRIPTION("HID driver for Corsair Vengeance K90 Keyboard")=
;
> >
> > _______________________________________________
> > Kernelnewbies mailing list
> > Kernelnewbies@kernelnewbies.org
> > http://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
>=20
>=20
>=20
> --=20
>         ---P.K.S
