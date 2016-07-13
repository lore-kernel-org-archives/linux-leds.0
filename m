From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: trigger: Introduce an USB port trigger
Date: Wed, 13 Jul 2016 16:48:04 +0200
Message-ID: <578654A4.9030009@samsung.com>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21278 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753026AbcGMOsP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Jul 2016 10:48:15 -0400
In-reply-to: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, Matthias Brugger <mbrugger@suse.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, balbi@kernel.org

Hi Rafa=C5=82,

Thanks for the patch.

On 07/11/2016 02:24 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> This commit adds a new trigger that can turn on LED when USB device g=
ets
> connected to the USB port. This can can useful for various home route=
rs

s/can can/can be/

> that have USB port and a proper LED telling user a device is connecte=
d.
>
> The trigger gets its documentation file but basically it just require=
s
> specifying USB port in a Linux format (e.g. echo 1-1 > new_port).
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>   Documentation/leds/ledtrig-usbport.txt |  47 ++++++++
>   drivers/leds/trigger/Kconfig           |   8 ++
>   drivers/leds/trigger/Makefile          |   1 +
>   drivers/leds/trigger/ledtrig-usbport.c | 196 ++++++++++++++++++++++=
+++++++++++
>   4 files changed, 252 insertions(+)
>   create mode 100644 Documentation/leds/ledtrig-usbport.txt
>   create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
>
> diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentation/l=
eds/ledtrig-usbport.txt
> new file mode 100644
> index 0000000..d31dba2
> --- /dev/null
> +++ b/Documentation/leds/ledtrig-usbport.txt
> @@ -0,0 +1,47 @@
> +USB port LED trigger
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This LED trigger can be used for signaling user a presence of USB de=
vice in a

s/signaling/signalling
s/user/to the user/

> +given port. It simply turns on LED when device appears and turns it =
off when it
> +disappears.
> +
> +It requires specifying a list of USB ports that should be observed. =
Used format
> +matches Linux kernel format and consists of a root hub number and a =
hub port
> +separated by a dash (e.g. 3-1).
> +
> +This also allows handling devices with internal hubs (when root hub'=
s port has
> +always a device (hub) connected). User can simply specify specify in=
ternal hub

Maybe it would be possible to rearrange this so that there was no need
for nesting expression in brackets?

> +ports then (e.g. 1-1.1, 1-1.2, etc.).
> +
> +Please note that this trigger allows assigning multiple USB ports to=
 a single
> +LED. This can be useful in two cases:
> +
> +1) Device with single USB LED and few physical ports
> +
> +In such case LED will be turned on as long as there is at least one =
connected

s/such/such a/

> +USB device.
> +
> +2) Device with a physical port handled by few controllers
> +
> +Some devices have e.g. one controller per PHY standard. E.g. USB 2.0=
 physical
> +port may be handled by ohci-platform, ehci-platform and xhci-hcd. If=
 there is
> +only one LED user will most likely want to assign ports from all 3 h=
ubs.
> +
> +
> +This trigger can be activated from user space on led class devices a=
s shown
> +below:
> +
> +  echo usbport > trigger
> +
> +This adds the following sysfs attributes to the LED:
> +
> +  ports - allows listing all USB ports assigned to the trigger.
> +
> +  new_port - allows adding a new USB port by simply writing to it.
> +
> +Example use-case:
> +
> +  echo usbport > trigger
> +  echo 4-1 > new_port
> +  echo 2-1 > new_port
> +  cat ports

I will need USB maintainer's ack for this patch.
Adding Felipe.

> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kcon=
fig
> index 3f9ddb9..bdd6fd2 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -126,4 +126,12 @@ config LEDS_TRIGGER_PANIC
>   	  a different trigger.
>   	  If unsure, say Y.
>
> +config LEDS_TRIGGER_USBPORT
> +	tristate "USB port LED trigger"
> +	depends on LEDS_TRIGGERS && USB
> +	help
> +	  This allows LEDs to be controlled by USB events. Enabling this op=
tion
> +	  allows specifying list of USB ports that should turn on LED when =
some
> +	  USB device gets connected.
> +
>   endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Mak=
efile
> index a72c43c..56e1741 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+=3D ledtrig-=
default-on.o
>   obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+=3D ledtrig-transient.o
>   obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+=3D ledtrig-camera.o
>   obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+=3D ledtrig-panic.o
> +obj-$(CONFIG_LEDS_TRIGGER_USBPORT)	+=3D ledtrig-usbport.o
> diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/leds/tr=
igger/ledtrig-usbport.c
> new file mode 100644
> index 0000000..eb20a8f
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-usbport.c
> @@ -0,0 +1,196 @@
> +/*
> + * USB port LED trigger
> + *
> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.c=
om>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or=
 (at
> + * your option) any later version.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +#include "../leds.h"
> +
> +struct usbport_trig_port {
> +	char *name;
> +	struct list_head list;
> +};
> +
> +struct usbport_trig_data {
> +	struct led_classdev *led_cdev;
> +	struct list_head ports;
> +	struct notifier_block nb;
> +	int count; /* Amount of connected matching devices */
> +};
> +
> +static ssize_t ports_show(struct device *dev, struct device_attribut=
e *attr,
> +			  char *buf)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct usbport_trig_data *usbport_data =3D led_cdev->trigger_data;
> +	struct usbport_trig_port *port;
> +	ssize_t ret =3D 0;
> +	int len;
> +
> +	list_for_each_entry(port, &usbport_data->ports, list) {
> +		len =3D sprintf(buf + ret, "%s\n", port->name);
> +		if (len >=3D 0)
> +			ret +=3D len;
> +	}
> +
> +	return ret;
> +}
> +
> +static DEVICE_ATTR(ports, S_IRUSR, ports_show, NULL);
> +
> +static ssize_t new_port_store(struct device *dev, struct device_attr=
ibute *attr,
> +			      const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct usbport_trig_data *usbport_data =3D led_cdev->trigger_data;
> +	struct usbport_trig_port *port;
> +	size_t len;
> +
> +	port =3D kzalloc(sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	len =3D strlen(buf);
> +	if (len && buf[len - 1] =3D=3D '\n')
> +		len--;
> +	if (!len)
> +		return -EINVAL;
> +
> +	port->name =3D kzalloc(strlen(buf), GFP_KERNEL);
> +	if (!port->name) {
> +		kfree(port);
> +		return -ENOMEM;
> +	}
> +	strncpy(port->name, buf, len);
> +
> +	list_add_tail(&port->list, &usbport_data->ports);
> +
> +	return size;
> +}
> +
> +static DEVICE_ATTR(new_port, S_IWUSR, NULL, new_port_store);
> +
> +static bool usbport_trig_match(struct usbport_trig_data *usbport_dat=
a,
> +			       struct usb_device *usb_dev)
> +{
> +	struct usbport_trig_port *port;
> +	const char *name =3D dev_name(&usb_dev->dev);
> +
> +	list_for_each_entry(port, &usbport_data->ports, list) {
> +		if (!strcmp(port->name, name))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int usbport_trig_notify(struct notifier_block *nb, unsigned l=
ong action,
> +			       void *data)
> +{
> +	struct usbport_trig_data *usbport_data =3D
> +		container_of(nb, struct usbport_trig_data, nb);
> +	struct led_classdev *led_cdev =3D usbport_data->led_cdev;
> +
> +	switch (action) {
> +	case USB_DEVICE_ADD:
> +		if (usbport_trig_match(usbport_data, data)) {
> +			if (usbport_data->count++ =3D=3D 0)
> +				led_set_brightness_nosleep(led_cdev, LED_FULL);
> +		}
> +		break;
> +	case USB_DEVICE_REMOVE:
> +		if (usbport_trig_match(usbport_data, data)) {
> +			if (--usbport_data->count =3D=3D 0)
> +				led_set_brightness_nosleep(led_cdev, LED_OFF);
> +		}
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void usbport_trig_activate(struct led_classdev *led_cdev)
> +{
> +	struct usbport_trig_data *usbport_data;
> +	int err;
> +
> +	usbport_data =3D kzalloc(sizeof(*usbport_data), GFP_KERNEL);
> +	if (!usbport_data)
> +		return;
> +	usbport_data->led_cdev =3D led_cdev;
> +	INIT_LIST_HEAD(&usbport_data->ports);
> +	usbport_data->nb.notifier_call =3D usbport_trig_notify,
> +	led_cdev->trigger_data =3D usbport_data;
> +
> +	err =3D device_create_file(led_cdev->dev, &dev_attr_ports);
> +	if (err)
> +		goto err_free;
> +	err =3D device_create_file(led_cdev->dev, &dev_attr_new_port);
> +	if (err)
> +		goto err_remove_ports;

Couldn't we live without new_port attr? Writing the ports attribute
would add the port. We should have a means for removing the port too,
possibly prepended with some character, like '-'.

> +
> +	usb_register_notify(&usbport_data->nb);
> +
> +	led_cdev->activated =3D true;
> +	return;
> +
> +err_free:
> +	kfree(usbport_data);
> +err_remove_ports:
> +	device_remove_file(led_cdev->dev, &dev_attr_ports);
> +}
> +
> +static void usbport_trig_deactivate(struct led_classdev *led_cdev)
> +{
> +	struct usbport_trig_data *usbport_data =3D led_cdev->trigger_data;
> +	struct usbport_trig_port *port, *tmp;
> +
> +	if (!led_cdev->activated)
> +		return;
> +
> +	usb_unregister_notify(&usbport_data->nb);
> +
> +	list_for_each_entry_safe(port, tmp, &usbport_data->ports, list) {
> +		kfree(port->name);
> +		list_del(&port->list);
> +	}
> +
> +	device_remove_file(led_cdev->dev, &dev_attr_new_port);
> +	device_remove_file(led_cdev->dev, &dev_attr_ports);
> +	kfree(usbport_data);
> +
> +	led_cdev->activated =3D false;
> +}
> +
> +static struct led_trigger usbport_led_trigger =3D {
> +	.name     =3D "usbport",
> +	.activate =3D usbport_trig_activate,
> +	.deactivate =3D usbport_trig_deactivate,
> +};
> +
> +static int __init usbport_trig_init(void)
> +{
> +	return led_trigger_register(&usbport_led_trigger);
> +}
> +
> +static void __exit usbport_trig_exit(void)
> +{
> +	led_trigger_unregister(&usbport_led_trigger);
> +}
> +
> +module_init(usbport_trig_init);
> +module_exit(usbport_trig_exit);
> +
> +MODULE_AUTHOR("Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.com>");
> +MODULE_DESCRIPTION("USB port trigger");
> +MODULE_LICENSE("GPL");
>


--=20
Best regards,
Jacek Anaszewski
