From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V4] leds: trigger: Introduce an USB port trigger
Date: Thu, 25 Aug 2016 08:49:48 -0400
Message-ID: <20160825124948.GA15567@kroah.com>
References: <20160825080546.27182-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49199 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932252AbcHYM45 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Aug 2016 08:56:57 -0400
Content-Disposition: inline
In-Reply-To: <20160825080546.27182-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, linux-usb@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephan Linz <linz@li-pro.net>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On Thu, Aug 25, 2016 at 10:03:52AM +0200, Rafał Miłecki wrote:
> +static void usbport_trig_activate(struct led_classdev *led_cdev)
> +{
> +	struct usbport_trig_data *usbport_data;
> +	int err;
> +
> +	usbport_data = kzalloc(sizeof(*usbport_data), GFP_KERNEL);
> +	if (!usbport_data)
> +		return;
> +	usbport_data->led_cdev = led_cdev;
> +
> +	/* Storing ports */
> +	INIT_LIST_HEAD(&usbport_data->ports);
> +	usbport_data->ports_dir = kobject_create_and_add("ports",
> +							 &led_cdev->dev->kobj);

If you _ever_ find yourself in a driver having to use kobject calls,
it's a HUGE hint that you are doing something wrong.

Hint, you are doing this wrong :)

Use an attribute group if you need a subdirectory in sysfs, using a
"raw" kobject like this hides it from all userspace tools and so no
userspace program can see it (hint, try using libudev to access these
files attached to the device...)

> +	if (!usbport_data->ports_dir)
> +		goto err_free;
> +
> +	/* API for ports management */
> +	err = device_create_file(led_cdev->dev, &dev_attr_new_port);
> +	if (err)
> +		goto err_put_ports;
> +	err = device_create_file(led_cdev->dev, &dev_attr_remove_port);
> +	if (err)
> +		goto err_remove_new_port;

Doesn't this race with userspace and fail?  Shouldn't the led core be
creating your leds for you?

> +
> +	/* Notifications */
> +	usbport_data->nb.notifier_call = usbport_trig_notify,
> +	led_cdev->trigger_data = usbport_data;
> +	usb_register_notify(&usbport_data->nb);

Don't abuse the USB notifier chain with stuff like this please, is that
really necessary?  Why can't your hardware just tell you what USB ports
are in use "out of band"?


> +
> +	led_cdev->activated = true;
> +	return;
> +
> +err_remove_new_port:
> +	device_remove_file(led_cdev->dev, &dev_attr_new_port);
> +err_put_ports:
> +	kobject_put(usbport_data->ports_dir);
> +err_free:
> +	kfree(usbport_data);
> +}

And again, why is this USB specific?  Why can't you use this same
userspace api and codebase for PCI ports?  For a sdcard port?  For a
thunderbolt port?

thanks,

greg k-h
