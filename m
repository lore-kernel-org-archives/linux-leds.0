From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Introduce userspace leds driver
Date: Thu, 08 Sep 2016 11:58:55 +0200
Message-ID: <04c5ee0d-9bfb-6e0a-2616-6cf720fc8763@samsung.com>
References: <1473128158-26915-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:59025 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932342AbcIHJ7B (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Sep 2016 05:59:01 -0400
In-reply-to: <1473128158-26915-1-git-send-email-david@lechnology.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

Hi David,

Thanks for the patch. It is very nice. I have only one minor remark
in the code.

I think that it would be good to add a documentation for this
driver to Documentation/leds, with exemplary C program instead
of python one. The program could poll the dev node in a loop,
which allows to conveniently check the impact of setting particular
triggers and all other brightness change events.

On 09/06/2016 04:15 AM, David Lechner wrote:
> This driver creates a userspace leds driver similar to uinput.
>
> New leds are created by opening /dev/uleds and writing a uleds_user_dev
> struct. A new leds class device is registered with the name given in the
> struct. Reading will return a single byte that is the current brightness.
> The poll() syscall is also supported. It will be triggered whenever the
> brightness changes.
>
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>
> Here is a sample python program that I used to test that it works as expected.
>
> #!/usr/bin/env python3
>
> import select
> from threading import Timer
>
> ULEDS_MAX_NAME_SIZE = 80
>
> name = 'test'
>
>
> def change_brightness(b):
>     with open('/sys/class/leds/{}/brightness'.format(name) , 'w') as f:
>        f.write(str(b))
>
>
> with open('/dev/uleds', 'rb+', 0) as uleds:
>     bname = name.encode("ascii")
>     # create the leds class device
>     uleds.write(bname + b'\0' * (ULEDS_MAX_NAME_SIZE - len(bname)))
>
>     # test that it works
>     print(uleds.read(1))
>
>     # schedule some brighness changes at 1 second intervals
>     Timer(1, change_brightness, (1,)).start()
>     # this won't trigger poll since brighness does not change
>     Timer(2, change_brightness, (1,)).start()
>     Timer(3, change_brightness, (2,)).start()
>
>     # wait for the scheduled changes
>     p = select.poll()
>     p.register(uleds.fileno(), select.POLLIN)
>     p.poll()
>     print(uleds.read(1))
>     p.poll()
>     print(uleds.read(1))
>
>
>
>  drivers/leds/Kconfig       |   8 ++
>  drivers/leds/Makefile      |   3 +
>  drivers/leds/uleds.c       | 224 +++++++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/Kbuild  |   1 +
>  include/uapi/linux/uleds.h |  23 +++++
>  5 files changed, 259 insertions(+)
>  create mode 100644 drivers/leds/uleds.c
>  create mode 100644 include/uapi/linux/uleds.h
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 9dcc9b1..25c6168 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -631,6 +631,14 @@ config LEDS_VERSATILE
>  	  This option enabled support for the LEDs on the ARM Versatile
>  	  and RealView boards. Say Y to enabled these.
>
> +config LEDS_USER
> +	tristate "Userspace LED support"
> +	depends on LEDS_CLASS
> +	help
> +	  This option enables support for userspace LEDs. Say 'y' to enable this
> +	  support in kernel. To compile this driver as a module, choose 'm' here:
> +	  the module will be called leds-user.
> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 0684c86..d723eeb 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -72,5 +72,8 @@ obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>  # LED SPI Drivers
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
>
> +# LED Userspace Drivers
> +obj-$(CONFIG_LEDS_USER)			+= uleds.o
> +
>  # LED Triggers
>  obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
> diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
> new file mode 100644
> index 0000000..992bca4
> --- /dev/null
> +++ b/drivers/leds/uleds.c
> @@ -0,0 +1,224 @@
> +/*
> + * Userspace driver for leds subsystem
> + *
> + * Copyright (C) 2016 David Lechner <david@lechnology.com>
> + *
> + * Based on uinput.c: Aristeu Sergio Rozanski Filho <aris@cathedrallabs.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/fs.h>
> +#include <linux/leds.h>
> +#include <linux/miscdevice.h>

Please arrange include directives in alphabetical order.

> +#include <uapi/linux/uleds.h>
> +
> +#define ULEDS_NAME		"uleds"
> +
> +enum uleds_state {
> +	ULEDS_STATE_UNKNOWN,
> +	ULEDS_STATE_REGISTERED,
> +};
> +
> +struct uleds_device {
> +	struct uleds_user_dev	user_dev;
> +	struct led_classdev	led_cdev;
> +	struct mutex		mutex;
> +	enum uleds_state	state;
> +	wait_queue_head_t	waitq;
> +	unsigned char		brightness;
> +	unsigned char		new_data;
> +};
> +
> +static void uleds_brightness_set(struct led_classdev *led_cdev,
> +				 enum led_brightness brightness)
> +{
> +	struct uleds_device *udev = container_of(led_cdev, struct uleds_device,
> +						 led_cdev);
> +
> +	if (udev->brightness != brightness) {
> +		udev->brightness = brightness;
> +		udev->new_data = 1;
> +		wake_up_interruptible(&udev->waitq);
> +	}
> +}
> +
> +static int uleds_open(struct inode *inode, struct file *file)
> +{
> +	struct uleds_device *udev;
> +
> +	udev = kzalloc(sizeof(*udev), GFP_KERNEL);
> +	if (!udev)
> +		return -ENOMEM;
> +
> +	udev->led_cdev.name = udev->user_dev.name;
> +	udev->led_cdev.max_brightness = LED_FULL;
> +	udev->led_cdev.brightness_set = uleds_brightness_set;
> +
> +	mutex_init(&udev->mutex);
> +	init_waitqueue_head(&udev->waitq);
> +	udev->state = ULEDS_STATE_UNKNOWN;
> +
> +	file->private_data = udev;
> +	nonseekable_open(inode, file);
> +
> +	return 0;
> +}
> +
> +static ssize_t uleds_write(struct file *file, const char __user *buffer,
> +			   size_t count, loff_t *ppos)
> +{
> +	struct uleds_device *udev = file->private_data;
> +	int ret;
> +
> +	if (count == 0)
> +		return 0;
> +
> +	ret = mutex_lock_interruptible(&udev->mutex);
> +	if (ret)
> +		return ret;
> +
> +	if (udev->state == ULEDS_STATE_REGISTERED) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	if (count != sizeof(struct uleds_user_dev)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (copy_from_user(&udev->user_dev, buffer,
> +			   sizeof(struct uleds_user_dev))) {
> +		ret = -EFAULT;
> +		goto out;
> +	}
> +
> +	if (!udev->user_dev.name[0]) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ret = led_classdev_register(NULL, &udev->led_cdev);
> +	if (ret < 0)
> +		goto out;
> +
> +	udev->state = ULEDS_STATE_REGISTERED;
> +	ret = count;
> +
> +out:
> +	mutex_unlock(&udev->mutex);
> +
> +	return ret;
> +}
> +
> +static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
> +			  loff_t *ppos)
> +{
> +	struct uleds_device *udev = file->private_data;
> +	ssize_t retval;
> +
> +	if (count == 0)
> +		return 0;
> +
> +	if (count != 1)
> +		return -EINVAL;
> +
> +	do {
> +		retval = mutex_lock_interruptible(&udev->mutex);
> +		if (retval)
> +			return retval;
> +
> +		if (udev->state != ULEDS_STATE_REGISTERED) {
> +			retval = -ENODEV;
> +		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
> +			retval = -EAGAIN;
> +		} else {
> +			retval = copy_to_user(buffer, &udev->brightness, 1);
> +			udev->new_data = 0;
> +			retval = 1;
> +		}
> +
> +		mutex_unlock(&udev->mutex);
> +
> +		if (retval || count == 0)
> +			break;
> +
> +		if (!(file->f_flags & O_NONBLOCK))
> +			retval = wait_event_interruptible(udev->waitq,
> +					udev->new_data ||
> +					udev->state != ULEDS_STATE_REGISTERED);
> +	} while (retval == 0);
> +
> +	return retval;
> +}
> +
> +static unsigned int uleds_poll(struct file *file, poll_table *wait)
> +{
> +	struct uleds_device *udev = file->private_data;
> +
> +	poll_wait(file, &udev->waitq, wait);
> +
> +	if (udev->new_data)
> +		return POLLIN | POLLRDNORM;
> +
> +	return 0;
> +}
> +
> +static int uleds_release(struct inode *inode, struct file *file)
> +{
> +	struct uleds_device *udev = file->private_data;
> +
> +	if (udev->state == ULEDS_STATE_REGISTERED) {
> +		udev->state = ULEDS_STATE_UNKNOWN;
> +		led_classdev_unregister(&udev->led_cdev);
> +	}
> +	kfree(udev);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations uleds_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= uleds_open,
> +	.release	= uleds_release,
> +	.read		= uleds_read,
> +	.write		= uleds_write,
> +	.poll		= uleds_poll,
> +	.llseek		= no_llseek,
> +};
> +
> +static struct miscdevice uleds_misc = {
> +	.fops		= &uleds_fops,
> +	.minor		= MISC_DYNAMIC_MINOR,
> +	.name		= ULEDS_NAME,
> +};
> +
> +static int __init uleds_init(void)
> +{
> +	return misc_register(&uleds_misc);
> +}
> +module_init(uleds_init);
> +
> +static void __exit uleds_exit(void)
> +{
> +	misc_deregister(&uleds_misc);
> +}
> +module_exit(uleds_exit);
> +
> +MODULE_AUTHOR("David Lechner <david@lechnology.com>");
> +MODULE_DESCRIPTION("Userspace driver for leds subsystem");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
> index 185f8ea..416f5e6 100644
> --- a/include/uapi/linux/Kbuild
> +++ b/include/uapi/linux/Kbuild
> @@ -421,6 +421,7 @@ header-y += udp.h
>  header-y += uhid.h
>  header-y += uinput.h
>  header-y += uio.h
> +header-y += uleds.h
>  header-y += ultrasound.h
>  header-y += un.h
>  header-y += unistd.h
> diff --git a/include/uapi/linux/uleds.h b/include/uapi/linux/uleds.h
> new file mode 100644
> index 0000000..e78ed46
> --- /dev/null
> +++ b/include/uapi/linux/uleds.h
> @@ -0,0 +1,23 @@
> +/*
> + * Userspace driver support for leds subsystem
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#ifndef _UAPI__ULEDS_H_
> +#define _UAPI__ULEDS_H_
> +
> +#define ULEDS_MAX_NAME_SIZE	80
> +
> +struct uleds_user_dev {
> +	char name[ULEDS_MAX_NAME_SIZE];
> +};
> +
> +#endif /* _UAPI__ULEDS_H_ */
>

-- 
Best regards,
Jacek Anaszewski
