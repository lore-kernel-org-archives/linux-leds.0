From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 1/3] platform/chrome: wilco_ec: Split core and mailbox
 into separate modules
Date: Mon, 25 Mar 2019 18:18:23 +0100
Message-ID: <33e0da93-18aa-5ddc-5bdb-a73336392e2a@collabora.com>
References: <20190321221334.240059-1-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321221334.240059-1-ncrews@chromium.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org

Hi Nick,

Thanks for the patch, some comments below.

On 21/3/19 23:13, Nick Crews wrote:
> It was bad design to lump the mailbox interface to the Wilco EC into the
> same module as the code module, which loads all the subdrivers:

Typo: s/code/core/?

> - This required the sub-drivers to depend on the core, which doesn't
> really make sense, they should just depend on the mailbox interface.
> - It caused problems with circular dependencies: An upcoming keyboard
> backlight driver depends on the mailbox interface, which in the old
> architecture makes it also depend on the core driver. However, the core
> driver should be able to detect whether or not the keyboard
> backlight is available, so the core module depends on the backlight
> driver. This created a circular dependency.
> 
> By splitting up the mailbox interface and core driver into separate
> modules, it fixes both of these problems.
> 
> Signed-off-by: Nick Crews <ncrews@chromium.org>
> ---
>  drivers/platform/chrome/wilco_ec/Makefile  | 6 ++++--
>  drivers/platform/chrome/wilco_ec/core.c    | 2 +-
>  drivers/platform/chrome/wilco_ec/mailbox.c | 6 ++++++
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/chrome/wilco_ec/Makefile b/drivers/platform/chrome/wilco_ec/Makefile
> index 063e7fb4ea17..9706aeb20ccb 100644
> --- a/drivers/platform/chrome/wilco_ec/Makefile
> +++ b/drivers/platform/chrome/wilco_ec/Makefile
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -wilco_ec-objs				:= core.o mailbox.o
> -obj-$(CONFIG_WILCO_EC)			+= wilco_ec.o
> +wilco_ec_mailbox-objs			:= mailbox.o
> +obj-$(CONFIG_WILCO_EC)			+= wilco_ec_mailbox.o
> +wilco_ec_core-objs			:= core.o
> +obj-$(CONFIG_WILCO_EC)			+= wilco_ec_core.o

Odd, same config definition (CONFIG_WILCO_EC) for two different kernel modules?

>  wilco_ec_debugfs-objs			:= debugfs.o
>  obj-$(CONFIG_WILCO_EC_DEBUGFS)		+= wilco_ec_debugfs.o
> diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
> index 05e1e2be1c91..ece30874f35f 100644
> --- a/drivers/platform/chrome/wilco_ec/core.c
> +++ b/drivers/platform/chrome/wilco_ec/core.c
> @@ -20,7 +20,7 @@
>  
>  #include "../cros_ec_lpc_mec.h"
>  
> -#define DRV_NAME "wilco-ec"
> +#define DRV_NAME "wilco-ec-core"
>  
>  static struct resource *wilco_get_resource(struct platform_device *pdev,
>  					   int index)
> diff --git a/drivers/platform/chrome/wilco_ec/mailbox.c b/drivers/platform/chrome/wilco_ec/mailbox.c
> index 14355668ddfa..ca6b92ce7e6d 100644
> --- a/drivers/platform/chrome/wilco_ec/mailbox.c
> +++ b/drivers/platform/chrome/wilco_ec/mailbox.c
> @@ -18,6 +18,7 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/module.h>
>  #include <linux/platform_data/wilco-ec.h>
>  #include <linux/platform_device.h>
>  
> @@ -235,3 +236,8 @@ int wilco_ec_mailbox(struct wilco_ec_device *ec, struct wilco_ec_message *msg)
>  
>  }
>  EXPORT_SYMBOL_GPL(wilco_ec_mailbox);
> +
> +MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("ChromeOS Wilco Embedded Controller mailbox interface");
> +MODULE_ALIAS("platform:wilco-ec-mailbox");
> 

Thanks,
- Enric
