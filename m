From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V3] leds: trigger: Introduce an USB port trigger
Date: Wed, 24 Aug 2016 13:02:38 +0200
Message-ID: <CACna6rxz1xV7K__3w+8LM2QO47CC634K4t1iQXPjLADNi-8ObA@mail.gmail.com>
References: <20160823220404.9887-1-zajec5@gmail.com> <fbec6ad5-d000-c370-73ed-1c6f57386732@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <fbec6ad5-d000-c370-73ed-1c6f57386732@suse.com>
Sender: linux-doc-owner@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 24 August 2016 at 12:49, Matthias Brugger <mbrugger@suse.com> wrote:
> On 24/08/16 00:03, Rafa=C5=82 Mi=C5=82ecki wrote:
>>
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
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
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>> V2: Trying to add DT support, idea postponed as it will take more time
>>     to discuss the bindings.
>> V3: Fix typos in commit and Documentation (thanks Jacek!)
>>     Use "ports" sysfs file for adding and removing USB ports (thx Jacek)
>>     Check if there is USB device connected after adding new USB port
>>     Fix memory leak or two
>>
>> Felipe: I'd like to ask for your Ack before having this patch pushed.
>> ---
>>  Documentation/leds/ledtrig-usbport.txt |  49 +++++++
>>  drivers/leds/trigger/Kconfig           |   8 ++
>>  drivers/leds/trigger/Makefile          |   1 +
>>  drivers/leds/trigger/ledtrig-usbport.c | 253
>> +++++++++++++++++++++++++++++++++
>>  4 files changed, 311 insertions(+)
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
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +This LED trigger can be used for signalling to the user a presence of U=
SB
>> device
>> +in a given port. It simply turns on LED when device appears and turns i=
t
>> off
>> +when it disappears.
>> +
>> +It requires specifying a list of USB ports that should be observed. Use=
d
>> format
>> +matches Linux kernel format and consists of a root hub number and a hub
>> port
>> +separated by a dash (e.g. 3-1).
>> +
>> +It is also possible to handle devices with internal hubs (that are alwa=
ys
>> +connected to the root hub). User can simply specify internal hub ports
>> then
>> +(e.g. 1-1.1, 1-1.2, etc.).
>> +
>> +Please note that this trigger allows assigning multiple USB ports to a
>> single
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
>> +only one LED user will most likely want to assign ports from all 3 hubs=
.
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
>> +  ports - Reading it lists all USB ports assigned to the trigger. Writi=
ng
>> USB
>> +         port number to it will make this driver start observing it. It=
's
>> also
>> +         possible to remove USB port from observable list by writing it
>> with a
>> +         "-" prefix.
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
>>           a different trigger.
>>           If unsure, say Y.
>>
>> +config LEDS_TRIGGER_USBPORT
>> +       tristate "USB port LED trigger"
>> +       depends on LEDS_TRIGGERS && USB
>> +       help
>> +         This allows LEDs to be controlled by USB events. Enabling this
>> option
>> +         allows specifying list of USB ports that should turn on LED wh=
en
>> some
>> +         USB device gets connected.
>> +
>>  endif # LEDS_TRIGGERS
>> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefi=
le
>> index a72c43c..56e1741 100644
>> --- a/drivers/leds/trigger/Makefile
>> +++ b/drivers/leds/trigger/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON) +=3D
>> ledtrig-default-on.o
>>  obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)   +=3D ledtrig-transient.o
>>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)      +=3D ledtrig-camera.o
>>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)       +=3D ledtrig-panic.o
>> +obj-$(CONFIG_LEDS_TRIGGER_USBPORT)     +=3D ledtrig-usbport.o
>> diff --git a/drivers/leds/trigger/ledtrig-usbport.c
>> b/drivers/leds/trigger/ledtrig-usbport.c
>> new file mode 100644
>> index 0000000..7f5237c
>> --- /dev/null
>> +++ b/drivers/leds/trigger/ledtrig-usbport.c
>> @@ -0,0 +1,253 @@
>> +/*
>> + * USB port LED trigger
>> + *
>> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki@pl>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or (a=
t
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
>> +       char *name;
>> +       struct list_head list;
>> +};
>> +
>> +struct usbport_trig_data {
>> +       struct led_classdev *led_cdev;
>> +       struct list_head ports;
>> +       struct notifier_block nb;
>> +       int count; /* Amount of connected matching devices */
>> +};
>> +
>> +/* Helpers */
>> +
>> +/**
>> + * usbport_trig_usb_dev_observed - Check if dev is connected to observe=
rd
>> port
>> + */
>> +static bool usbport_trig_usb_dev_observed(struct usbport_trig_data
>> *usbport_data,
>> +                                         struct usb_device *usb_dev)
>> +{
>> +       struct usbport_trig_port *port;
>> +       const char *name =3D dev_name(&usb_dev->dev);
>> +
>> +       list_for_each_entry(port, &usbport_data->ports, list) {
>> +               if (!strcmp(port->name, name))
>> +                       return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>> +static int usbport_trig_usb_dev_check(struct usb_device *usb_dev, void
>> *data)
>> +{
>> +       struct usbport_trig_data *usbport_data =3D data;
>> +
>> +       if (usbport_trig_usb_dev_observed(usbport_data, usb_dev))
>> +               usbport_data->count++;
>> +
>> +       return 0;
>> +}
>> +
>> +/**
>> + * usbport_trig_update_count - Recalculate amount of connected matching
>> devices
>> + */
>> +static void usbport_trig_update_count(struct usbport_trig_data
>> *usbport_data)
>> +{
>> +       struct led_classdev *led_cdev =3D usbport_data->led_cdev;
>> +
>> +       usbport_data->count =3D 0;
>> +       usb_for_each_dev(usbport_data, usbport_trig_usb_dev_check);
>> +       led_set_brightness_nosleep(led_cdev,
>> +                                  usbport_data->count ? LED_FULL :
>> LED_OFF);
>> +}
>> +
>> +/* Device attr */
>> +
>> +static ssize_t ports_show(struct device *dev, struct device_attribute
>> *attr,
>> +                         char *buf)
>> +{
>> +       struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> +       struct usbport_trig_data *usbport_data =3D led_cdev->trigger_dat=
a;
>> +       struct usbport_trig_port *port;
>> +       ssize_t ret =3D 0;
>> +       int len;
>> +
>> +       list_for_each_entry(port, &usbport_data->ports, list) {
>> +               len =3D sprintf(buf + ret, "%s\n", port->name);
>> +               if (len >=3D 0)
>> +                       ret +=3D len;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +static ssize_t ports_store(struct device *dev, struct device_attribute
>> *attr,
>> +                          const char *buf, size_t size)
>> +{
>> +       struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>> +       struct usbport_trig_data *usbport_data =3D led_cdev->trigger_dat=
a;
>> +       struct usbport_trig_port *port;
>> +       bool add =3D true;
>> +       size_t len;
>> +
>> +       len =3D strlen(buf);
>> +       /* See if this is add or remove request */
>> +       if (len && buf[0] =3D=3D '-') {
>> +               add =3D false;
>> +               buf++;
>> +               len--;
>> +       }
>> +       /* For user convenience trim line break */
>> +       if (len && buf[len - 1] =3D=3D '\n')
>> +               len--;
>> +       if (!len)
>> +               return -EINVAL;
>> +
>> +       if (add) {
>> +               port =3D kzalloc(sizeof(*port), GFP_KERNEL);
>> +               if (!port)
>> +                       return -ENOMEM;
>> +               port->name =3D kzalloc(strlen(buf), GFP_KERNEL);
>> +               if (!port->name) {
>> +                       kfree(port);
>> +                       return -ENOMEM;
>> +               }
>> +               strncpy(port->name, buf, len);
>> +
>> +               list_add_tail(&port->list, &usbport_data->ports);
>> +
>> +               usbport_trig_update_count(usbport_data);
>> +       } else {
>> +               struct usbport_trig_port *tmp;
>> +               bool found =3D false;
>> +
>> +               list_for_each_entry_safe(port, tmp, &usbport_data->ports=
,
>> +                                        list) {
>> +                       if (strlen(port->name) =3D=3D len &&
>> +                           !strncmp(port->name, buf, len)) {
>> +                               list_del(&port->list);
>> +                               kfree(port->name);
>> +                               kfree(port);
>> +
>> +                               found =3D true;
>> +                               break;
>> +                       }
>> +               }
>> +
>> +               if (!found)
>> +                       return -ENOENT;
>> +       }
>> +
>> +       usbport_trig_update_count(usbport_data);
>> +
>> +       return size;
>> +}
>> +
>> +static DEVICE_ATTR(ports, S_IRUSR | S_IWUSR, ports_show, ports_store);
>> +
>> +/* Init, exit, etc. */
>> +
>> +static int usbport_trig_notify(struct notifier_block *nb, unsigned long
>> action,
>> +                              void *data)
>> +{
>> +       struct usbport_trig_data *usbport_data =3D
>> +               container_of(nb, struct usbport_trig_data, nb);
>> +       struct led_classdev *led_cdev =3D usbport_data->led_cdev;
>> +
>> +       switch (action) {
>> +       case USB_DEVICE_ADD:
>> +               if (usbport_trig_usb_dev_observed(usbport_data, data)) {
>
>
> Maybe we should switch this and fist see if the usbport is observed befor=
e
> evaluating the action. Also cast data to "struct usb_device *" to make th=
at
> clear.

I'm aware there is one duplicated line of code, I did to first
evaluate very quick test (checking unsigned long value), then iterate
over ports & keep only 1 switch block. I could move
usbport_trig_usb_dev_observed call up, but it would be executed for
other actions as well (currently just USB_BUS_ADD and USB_BUS_REMOVE).


>> +                       if (usbport_data->count++ =3D=3D 0)
>
>
> I'm a bit puzzled. I think:
> if (++usbport_data->count > 0)
> makes this more consistent with the remove case.

Your condition would be always true (as we don't use negative
numbers). The point is to enable LED only if it was disabled before.
So I need to increase counter unconditionally but enable LED only if
initial value (before increasing it) was 0.


>> +module_init(usbport_trig_init);
>> +module_exit(usbport_trig_exit);
>> +
>> +MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki <rafal@milecki@pl>");
>
>
> Nit: rafal@milecki.pl

Oops, thanks!

--=20
Rafa=C5=82
