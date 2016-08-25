From: Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH RFC V3.5] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 10:27:03 +0200
Message-ID: <d5d60eaa-43de-8a7b-4c8d-602a57f5e5c2@suse.com>
References: <20160823220404.9887-1-zajec5@gmail.com>
 <20160824175345.7033-1-zajec5@gmail.com>
 <ebef68e9-a987-3829-8823-827b2efc6626@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ebef68e9-a987-3829-8823-827b2efc6626@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Stephan Linz <linz@li-pro.net>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org



On 25/08/16 10:03, Jacek Anaszewski wrote:
> zOn 08/24/2016 07:52 PM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This commit adds a new trigger responsible for turning on LED when USB
>> device gets connected to the specified USB port. This can can useful for
>> various home routers that have USB port(s) and a proper LED telling user
>> a device is connected.
>>
>> The trigger gets its documentation file but basically it just requires
>> specifying USB port in a Linux format (e.g. echo 1-1 > new_port).
>>
>> During work on this trigger there was a plan to add DT bindings for it,
>> but there wasn't an agreement on the format yet. This can be worked on
>> later, a sysfs interface is needed anyway for platforms not using DT.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: Trying to add DT support, idea postponed as it will take more time
>>     to discuss the bindings.
>> V3: Fix typos in commit and Documentation (thanks Jacek!)
>>     Use "ports" sysfs file for adding and removing USB ports (thx Jacek)
>>     Check if there is USB device connected after adding new USB port
>>     Fix memory leak or two
>> V3.5: Fix e-mail address (thanks Matthias)
>>       Simplify conditions in usbport_trig_notify (thx Matthias)
>>       Make "ports" a subdirectory with file per port, to match one value
>>       per file sysfs rule (thanks Greg)
>>       As "ports" couldn't be used for adding and removing ports anymore,
>>       there are now "new_port" and "remove_port". Having them makes this
>>       API also common with e.g. pci and usb buses.
>
> Now writing new_port with "1-1" produces a file named "1-1" in the
> ports directory with 000 permissions. I think that what Greg had
> on mind by referring to "one value per file" rule was a set of
> files representing ports, like "1-1 1-2 2-1", and each file should be
> readable/writeable.
>
> For instance "echo 1 > 1-1" would enable the trigger for the port 1-1
> and "echo 0 > 1-1" would disable it. The problem is that we don't know
> the number of required ports at compilation time and the sysfs
> attributes would have to be dynamically created on driver instantiation.
> What is more, as the USB ports can dynamically appear/disappear in the
> system, the files would have to be created/removed accordingly during
> LED class device lifetime, which is not the best design for the sysfs
> interface I think.
>
> Therefore, maybe it would be good to follow the "triggers" sysfs
> attribute pattern, where it lists the available LED triggers?
>
> The question is whether there is some mechanism available for
> notifying addition/removal of a USB port?
>

I think this should be easily doable through the notifier catching 
USB_BUS_[ADD,REMOVE].

Regards,
Matthias

> Also a description of the device connected to the port would be a nice
> feature, however I am not certain about the feasibility thereof.
>
>> The last big missing thing is Documentation update (this is why I'm
>> sending RFC). Greg pointed out we should have some entries in
>> Documentation/ABI, but it seems none of triggers have it. Any idea why
>> is that? Do we need to change it? Or is it required for new code only?
>> If so, should I care about Documentation/leds/ledtrig-usbport.txt at
>> all in this patch?
>>
>> For now I didn't update Documentation/leds/ledtrig-usbport.txt with the
>> new new_port and remove_port API, until I get a clue how to proceed.
>> ---
>>  Documentation/leds/ledtrig-usbport.txt |  49 ++++++
>>  drivers/leds/trigger/Kconfig           |   8 +
>>  drivers/leds/trigger/Makefile          |   1 +
>>  drivers/leds/trigger/ledtrig-usbport.c | 309
>> +++++++++++++++++++++++++++++++++
>>  4 files changed, 367 insertions(+)
>>  create mode 100644 Documentation/leds/ledtrig-usbport.txt
>>  create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
>>
>> diff --git a/Documentation/leds/ledtrig-usbport.txt
>> b/Documentation/leds/ledtrig-usbport.txt
>> new file mode 100644
>> index 0000000..fa42227
>> --- /dev/null
>> +++ b/Documentation/leds/ledtrig-usbport.txt
>> @@ -0,0 +1,49 @@
>> +USB port LED trigger
>> +====================
>> +
>> +This LED trigger can be used for signalling to the user a presence of
>> USB device
>> +in a given port. It simply turns on LED when device appears and turns
>> it off
>> +when it disappears.
>> +
>> +It requires specifying a list of USB ports that should be observed.
>> Used format
>> +matches Linux kernel format and consists of a root hub number and a
>> hub port
>> +separated by a dash (e.g. 3-1).
>> +
>> +It is also possible to handle devices with internal hubs (that are
>> always
>> +connected to the root hub). User can simply specify internal hub
>> ports then
>> +(e.g. 1-1.1, 1-1.2, etc.).
>> +
>> +Please note that this trigger allows assigning multiple USB ports to
>> a single
>> +LED. This can be useful in two cases:
>> +
>> +1) Device with single USB LED and few physical ports
>> +
>> +In such a case LED will be turned on as long as there is at least one
>> connected
>> +USB device.
>> +
>> +2) Device with a physical port handled by few controllers
>> +
>> +Some devices have e.g. one controller per PHY standard. E.g. USB 3.0
>> physical
>> +port may be handled by ohci-platform, ehci-platform and xhci-hcd. If
>> there is
>> +only one LED user will most likely want to assign ports from all 3 hubs.
>> +
>> +
>> +This trigger can be activated from user space on led class devices as
>> shown
>> +below:
>> +
>> +  echo usbport > trigger
>> +
>> +This adds the following sysfs attributes to the LED:
>> +
>> +  ports - Reading it lists all USB ports assigned to the trigger.
>> Writing USB
>> +      port number to it will make this driver start observing it.
>> It's also
>> +      possible to remove USB port from observable list by writing it
>> with a
>> +      "-" prefix.
>> +
>> +Example use-case:
>> +
>> +  echo usbport > trigger
>> +  echo 4-1 > ports
>> +  echo 2-1 > ports
>> +  echo -4-1 > ports
>> +  cat ports
>> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
>> index 3f9ddb9..bdd6fd2 100644
>> --- a/drivers/leds/trigger/Kconfig
>> +++ b/drivers/leds/trigger/Kconfig
>> @@ -126,4 +126,12 @@ config LEDS_TRIGGER_PANIC
>>        a different trigger.
>>        If unsure, say Y.
>>
>> +config LEDS_TRIGGER_USBPORT
>> +    tristate "USB port LED trigger"
>> +    depends on LEDS_TRIGGERS && USB
>> +    help
>> +      This allows LEDs to be controlled by USB events. Enabling this
>> option
>> +      allows specifying list of USB ports that should turn on LED
>> when some
>> +      USB device gets connected.
>> +
>>  endif # LEDS_TRIGGERS
>> diff --git a/drivers/leds/trigger/Makefile
>> b/drivers/leds/trigger/Makefile
>> index a72c43c..56e1741 100644
>> --- a/drivers/leds/trigger/Makefile
>> +++ b/drivers/leds/trigger/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)    +=
>> ledtrig-default-on.o
>>  obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)    += ledtrig-transient.o
>>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)    += ledtrig-camera.o
>>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)    += ledtrig-panic.o
>> +obj-$(CONFIG_LEDS_TRIGGER_USBPORT)    += ledtrig-usbport.o
>> diff --git a/drivers/leds/trigger/ledtrig-usbport.c
>> b/drivers/leds/trigger/ledtrig-usbport.c
>> new file mode 100644
>> index 0000000..1532b60
>> --- /dev/null
>> +++ b/drivers/leds/trigger/ledtrig-usbport.c
>> @@ -0,0 +1,309 @@
>> +/*
>> + * USB port LED trigger
>> + *
>> + * Copyright (C) 2016 Rafał Miłecki <rafal@milecki.pl>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or (at
>> + * your option) any later version.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/usb.h>
>> +#include "../leds.h"
>> +
>> +struct usbport_trig_port {
>> +    char *name;
>> +    struct device_attribute attr;
>> +    struct list_head list;
>> +};
>> +
>> +struct usbport_trig_data {
>> +    struct led_classdev *led_cdev;
>> +    struct list_head ports;
>> +    struct kobject *ports_dir;
>> +    struct notifier_block nb;
>> +    int count; /* Amount of connected matching devices */
>> +};
>> +
>> +/*
>> + * Helpers
>> + */
>> +
>> +/**
>> + * usbport_trig_usb_dev_observed - Check if dev is connected to
>> observerd port
>> + */
>> +static bool usbport_trig_usb_dev_observed(struct usbport_trig_data
>> *usbport_data,
>> +                      struct usb_device *usb_dev)
>> +{
>> +    struct usbport_trig_port *port;
>> +    const char *name = dev_name(&usb_dev->dev);
>> +
>> +    list_for_each_entry(port, &usbport_data->ports, list) {
>> +        if (!strcmp(port->name, name))
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static int usbport_trig_usb_dev_check(struct usb_device *usb_dev,
>> void *data)
>> +{
>> +    struct usbport_trig_data *usbport_data = data;
>> +
>> +    if (usbport_trig_usb_dev_observed(usbport_data, usb_dev))
>> +        usbport_data->count++;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * usbport_trig_update_count - Recalculate amount of connected
>> matching devices
>> + */
>> +static void usbport_trig_update_count(struct usbport_trig_data
>> *usbport_data)
>> +{
>> +    struct led_classdev *led_cdev = usbport_data->led_cdev;
>> +
>> +    usbport_data->count = 0;
>> +    usb_for_each_dev(usbport_data, usbport_trig_usb_dev_check);
>> +    led_set_brightness_nosleep(led_cdev,
>> +                   usbport_data->count ? LED_FULL : LED_OFF);
>> +}
>> +
>> +static int usbport_trig_add_port(struct usbport_trig_data *usbport_data,
>> +                 const char *name)
>> +{
>> +    struct usbport_trig_port *port;
>> +    int err;
>> +
>> +    port = kzalloc(sizeof(*port), GFP_KERNEL);
>> +    if (!port) {
>> +        err = -ENOMEM;
>> +        goto err_out;
>> +    }
>> +
>> +    port->name = kzalloc(strlen(name) + 1, GFP_KERNEL);
>> +    if (!port->name) {
>> +        err = -ENOMEM;
>> +        goto err_free_port;
>> +    }
>> +    strcpy(port->name, name);
>> +
>> +    port->attr.attr.name = port->name;
>> +
>> +    err = sysfs_create_file(usbport_data->ports_dir, &port->attr.attr);
>> +    if (err)
>> +        goto err_free_name;
>> +
>> +    list_add_tail(&port->list, &usbport_data->ports);
>> +
>> +    return 0;
>> +
>> +err_free_name:
>> +    kfree(port->name);
>> +err_free_port:
>> +    kfree(port);
>> +err_out:
>> +    return err;
>> +}
>> +
>> +static void usbport_trig_remove_port(struct usbport_trig_data
>> *usbport_data,
>> +                     struct usbport_trig_port *port)
>> +{
>> +    list_del(&port->list);
>> +    sysfs_remove_file(usbport_data->ports_dir, &port->attr.attr);
>> +    kfree(port->name);
>> +    kfree(port);
>> +}
>> +
>> +/*
>> + * Device attr
>> + */
>> +
>> +static ssize_t new_port_store(struct device *dev, struct
>> device_attribute *attr,
>> +                  const char *buf, size_t size)
>> +{
>> +    struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +    struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
>> +    struct usbport_trig_port *port;
>> +    char *name;
>> +    size_t len;
>> +
>> +    len = strlen(buf);
>> +    /* For user convenience trim line break */
>> +    if (len && buf[len - 1] == '\n')
>> +        len--;
>> +    if (!len)
>> +        return -EINVAL;
>> +
>> +    name = kzalloc(len + 1, GFP_KERNEL);
>> +    if (!name)
>> +        return -ENOMEM;
>> +    strncpy(name, buf, len);
>> +
>> +    list_for_each_entry(port, &usbport_data->ports, list) {
>> +        if (!strcmp(port->name, name))
>> +            return -EEXIST;
>> +    }
>> +
>> +    usbport_trig_add_port(usbport_data, name);
>> +
>> +    kfree(name);
>> +
>> +    usbport_trig_update_count(usbport_data);
>> +
>> +    return size;
>> +}
>> +
>> +static DEVICE_ATTR(new_port, S_IWUSR, NULL, new_port_store);
>> +
>> +static ssize_t remove_port_store(struct device *dev,
>> +                 struct device_attribute *attr, const char *buf,
>> +                 size_t size)
>> +{
>> +    struct led_classdev *led_cdev = dev_get_drvdata(dev);
>> +    struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
>> +    struct usbport_trig_port *port, *tmp;
>> +    size_t len;
>> +
>> +    len = strlen(buf);
>> +    /* For user convenience trim line break */
>> +    if (len && buf[len - 1] == '\n')
>> +        len--;
>> +    if (!len)
>> +        return -EINVAL;
>> +
>> +    list_for_each_entry_safe(port, tmp, &usbport_data->ports,
>> +                    list) {
>> +        if (strlen(port->name) == len &&
>> +            !strncmp(port->name, buf, len)) {
>> +            usbport_trig_remove_port(usbport_data, port);
>> +            usbport_trig_update_count(usbport_data);
>> +            return size;
>> +        }
>> +    }
>> +
>> +    return -ENOENT;
>> +}
>> +
>> +static DEVICE_ATTR(remove_port, S_IWUSR, NULL, remove_port_store);
>> +
>> +/*
>> + * Init, exit, etc.
>> + */
>> +
>> +static int usbport_trig_notify(struct notifier_block *nb, unsigned
>> long action,
>> +                   void *data)
>> +{
>> +    struct usbport_trig_data *usbport_data =
>> +        container_of(nb, struct usbport_trig_data, nb);
>> +    struct led_classdev *led_cdev = usbport_data->led_cdev;
>> +
>> +    if (!usbport_trig_usb_dev_observed(usbport_data, data))
>> +        return NOTIFY_DONE;
>> +
>> +    switch (action) {
>> +    case USB_DEVICE_ADD:
>> +        if (usbport_data->count++ == 0)
>> +            led_set_brightness_nosleep(led_cdev, LED_FULL);
>> +        return NOTIFY_OK;
>> +    case USB_DEVICE_REMOVE:
>> +        if (--usbport_data->count == 0)
>> +            led_set_brightness_nosleep(led_cdev, LED_OFF);
>> +        return NOTIFY_OK;
>> +    }
>> +
>> +    return NOTIFY_DONE;
>> +}
>> +
>> +static void usbport_trig_activate(struct led_classdev *led_cdev)
>> +{
>> +    struct usbport_trig_data *usbport_data;
>> +    int err;
>> +
>> +    usbport_data = kzalloc(sizeof(*usbport_data), GFP_KERNEL);
>> +    if (!usbport_data)
>> +        return;
>> +    usbport_data->led_cdev = led_cdev;
>> +
>> +    /* Storing ports */
>> +    INIT_LIST_HEAD(&usbport_data->ports);
>> +    usbport_data->ports_dir = kobject_create_and_add("ports",
>> +                             &led_cdev->dev->kobj);
>> +    if (!usbport_data->ports_dir)
>> +        goto err_free;
>> +
>> +    /* API for ports management */
>> +    err = device_create_file(led_cdev->dev, &dev_attr_new_port);
>> +    if (err)
>> +        goto err_put_ports;
>> +    err = device_create_file(led_cdev->dev, &dev_attr_remove_port);
>> +    if (err)
>> +        goto err_remove_new_port;
>> +
>> +    /* Notifications */
>> +    usbport_data->nb.notifier_call = usbport_trig_notify,
>> +    led_cdev->trigger_data = usbport_data;
>> +    usb_register_notify(&usbport_data->nb);
>> +
>> +    led_cdev->activated = true;
>> +    return;
>> +
>> +err_remove_new_port:
>> +    device_remove_file(led_cdev->dev, &dev_attr_new_port);
>> +err_put_ports:
>> +    kobject_put(usbport_data->ports_dir);
>> +err_free:
>> +    kfree(usbport_data);
>> +}
>> +
>> +static void usbport_trig_deactivate(struct led_classdev *led_cdev)
>> +{
>> +    struct usbport_trig_data *usbport_data = led_cdev->trigger_data;
>> +    struct usbport_trig_port *port, *tmp;
>> +
>> +    if (!led_cdev->activated)
>> +        return;
>> +
>> +    list_for_each_entry_safe(port, tmp, &usbport_data->ports, list) {
>> +        usbport_trig_remove_port(usbport_data, port);
>> +    }
>> +
>> +    usb_unregister_notify(&usbport_data->nb);
>> +
>> +    device_remove_file(led_cdev->dev, &dev_attr_remove_port);
>> +    device_remove_file(led_cdev->dev, &dev_attr_new_port);
>> +
>> +    kobject_put(usbport_data->ports_dir);
>> +
>> +    kfree(usbport_data);
>> +
>> +    led_cdev->activated = false;
>> +}
>> +
>> +static struct led_trigger usbport_led_trigger = {
>> +    .name     = "usbport",
>> +    .activate = usbport_trig_activate,
>> +    .deactivate = usbport_trig_deactivate,
>> +};
>> +
>> +static int __init usbport_trig_init(void)
>> +{
>> +    return led_trigger_register(&usbport_led_trigger);
>> +}
>> +
>> +static void __exit usbport_trig_exit(void)
>> +{
>> +    led_trigger_unregister(&usbport_led_trigger);
>> +}
>> +
>> +module_init(usbport_trig_init);
>> +module_exit(usbport_trig_exit);
>> +
>> +MODULE_AUTHOR("Rafał Miłecki <rafal@milecki.pl>");
>> +MODULE_DESCRIPTION("USB port trigger");
>> +MODULE_LICENSE("GPL");
>>
>
>
