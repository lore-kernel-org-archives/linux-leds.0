From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4] leds: trigger: Introduce a NETDEV trigger
Date: Sun, 10 Dec 2017 19:31:18 +0100
Message-ID: <b1d0acb1-501a-7722-3a70-908f7c23c404@gmail.com>
References: <1512923050-7297-1-git-send-email-ben.whitten@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:43637 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752498AbdLJScT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 10 Dec 2017 13:32:19 -0500
In-Reply-To: <1512923050-7297-1-git-send-email-ben.whitten@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hi Ben,

Thanks for the update. I have one doubt about comment style
at the top of the file. Please refer below.

On 12/10/2017 05:24 PM, Ben Whitten wrote:
> This commit introduces a NETDEV trigger for named device
> activity. Available triggers are link, rx, and tx.
> 
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> 
> ---
> Changes in v4:
> Adopt SPDX licence header
> Changes in v3:
> Cancel the software blink prior to a oneshot re-queue
> Changes in v2:
> Sort includes and redate documentation
> Correct licence
> Remove macro and replace with generic function using enums
> Convert blink logic in stats work to use led_blink_oneshot
> Uses configured brightness instead of FULL
> ---
>  .../ABI/testing/sysfs-class-led-trigger-netdev     |  45 ++
>  drivers/leds/trigger/Kconfig                       |   7 +
>  drivers/leds/trigger/Makefile                      |   1 +
>  drivers/leds/trigger/ledtrig-netdev.c              | 498 +++++++++++++++++++++
>  4 files changed, 551 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-netdev
>  create mode 100644 drivers/leds/trigger/ledtrig-netdev.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> new file mode 100644
> index 0000000..451af6d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> @@ -0,0 +1,45 @@
> +What:		/sys/class/leds/<led>/device_name
> +Date:		Dec 2017
> +KernelVersion:	4.16
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Specifies the network device name to monitor.
> +
> +What:		/sys/class/leds/<led>/interval
> +Date:		Dec 2017
> +KernelVersion:	4.16
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Specifies the duration of the LED blink in milliseconds.
> +		Defaults to 50 ms.
> +
> +What:		/sys/class/leds/<led>/link
> +Date:		Dec 2017
> +KernelVersion:	4.16
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Signal the link state of the named network device.
> +		If set to 0 (default), the LED's normal state is off.
> +		If set to 1, the LED's normal state reflects the link state
> +		of the named network device.
> +		Setting this value also immediately changes the LED state.
> +
> +What:		/sys/class/leds/<led>/tx
> +Date:		Dec 2017
> +KernelVersion:	4.16
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Signal transmission of data on the named network device.
> +		If set to 0 (default), the LED will not blink on transmission.
> +		If set to 1, the LED will blink for the milliseconds specified
> +		in interval to signal transmission.
> +
> +What:		/sys/class/leds/<led>/rx
> +Date:		Dec 2017
> +KernelVersion:	4.16
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Signal reception of data on the named network device.
> +		If set to 0 (default), the LED will not blink on reception.
> +		If set to 1, the LED will blink for the milliseconds specified
> +		in interval to signal reception.
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index 3f9ddb9..4ec1853 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -126,4 +126,11 @@ config LEDS_TRIGGER_PANIC
>  	  a different trigger.
>  	  If unsure, say Y.
>  
> +config LEDS_TRIGGER_NETDEV
> +	tristate "LED Netdev Trigger"
> +	depends on NET && LEDS_TRIGGERS
> +	help
> +	  This allows LEDs to be controlled by network device activity.
> +	  If unsure, say Y.
> +
>  endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index 9f2e868..59e163d 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON)	+= ledtrig-default-on.o
>  obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT)	+= ledtrig-transient.o
>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)	+= ledtrig-camera.o
>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)	+= ledtrig-panic.o
> +obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> new file mode 100644
> index 0000000..3d24573
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -0,0 +1,498 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright 2017 Ben Whitten <ben.whitten@gmail.com>
> +// Copyright 2007 Oliver Jowett <oliver@opencloud.com>
> +/*
> + * LED Kernel Netdev Trigger
> + *
> + * Toggles the LED to reflect the link and traffic state of a named net device
> + *
> + * Derived from ledtrig-timer.c which is:
> + *  Copyright 2005-2006 Openedhand Ltd.
> + *  Author: Richard Purdie <rpurdie@openedhand.com>
> + *
> + */

This mixed comment style looks odd to me. I'd go for // style
on the whole span of this block of commented text.
Especially taking into account following Linus' statement
from [0]:

"And yes, feel free to replace block comments with // while at it."

Otherwise the driver looks good to me.

[0] https://lkml.org/lkml/2017/11/2/715

-- 
Best regards,
Jacek Anaszewski
