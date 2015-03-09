From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2] leds: Introduce devres helper for led_classdev_register
Date: Mon, 9 Mar 2015 13:45:27 -0700
Message-ID: <CAK5ve-LR1Yt3JNuKV8Q_jd8Xeucz5MHx-qo-om1e-w20mJnSog@mail.gmail.com>
References: <1424736701-3496-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:41492 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932329AbbCIUpt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2015 16:45:49 -0400
In-Reply-To: <1424736701-3496-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Stephen Boyd <sboyd@codeaurora.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>

On Mon, Feb 23, 2015 at 4:11 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
> Changes since v1:
> - updating devres.txt
> - unregister function

I merged this patch into my tree and added _unregister function into document.

Thanks,
-Bryan

>
>  Documentation/driver-model/devres.txt |  3 ++
>  drivers/leds/led-class.c              | 57 +++++++++++++++++++++++++++++++++++
>  include/linux/leds.h                  |  4 +++
>  3 files changed, 64 insertions(+)
>
> diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
> index b5ab416..2ae041c 100644
> --- a/Documentation/driver-model/devres.txt
> +++ b/Documentation/driver-model/devres.txt
> @@ -287,6 +287,9 @@ IRQ
>    devm_request_irq()
>    devm_request_threaded_irq()
>
> +LED
> +  devm_led_classdev_register()
> +
>  MDIO
>    devm_mdiobus_alloc()
>    devm_mdiobus_alloc_size()
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index dbeebac..d467969 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -285,6 +285,63 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_unregister);
>
> +static void devm_led_classdev_release(struct device *dev, void *res)
> +{
> +       led_classdev_unregister(*(struct led_classdev **)res);
> +}
> +
> +/**
> + * devm_led_classdev_register - resource managed led_classdev_register()
> + * @parent: The device to register.
> + * @led_cdev: the led_classdev structure for this device.
> + */
> +int devm_led_classdev_register(struct device *parent,
> +                              struct led_classdev *led_cdev)
> +{
> +       struct led_classdev **dr;
> +       int rc;
> +
> +       dr = devres_alloc(devm_led_classdev_release, sizeof(*dr), GFP_KERNEL);
> +       if (!dr)
> +               return -ENOMEM;
> +
> +       rc = led_classdev_register(parent, led_cdev);
> +       if (rc) {
> +               devres_free(dr);
> +               return rc;
> +       }
> +
> +       *dr = led_cdev;
> +       devres_add(parent, dr);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_led_classdev_register);
> +
> +static int devm_led_classdev_match(struct device *dev, void *res, void *data)
> +{
> +       struct led_cdev **p = res;
> +
> +       if (WARN_ON(!p || !*p))
> +               return 0;
> +
> +       return *p == data;
> +}
> +
> +/**
> + * devm_led_classdev_unregister() - resource managed led_classdev_unregister()
> + * @parent: The device to unregister.
> + * @led_cdev: the led_classdev structure for this device.
> + */
> +void devm_led_classdev_unregister(struct device *dev,
> +                                 struct led_classdev *led_cdev)
> +{
> +       WARN_ON(devres_release(dev,
> +                              devm_led_classdev_release,
> +                              devm_led_classdev_match, led_cdev));
> +}
> +EXPORT_SYMBOL_GPL(devm_led_classdev_unregister);
> +
>  static int __init leds_init(void)
>  {
>         leds_class = class_create(THIS_MODULE, "leds");
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index cfceef3..6fae676 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -102,7 +102,11 @@ struct led_classdev {
>
>  extern int led_classdev_register(struct device *parent,
>                                  struct led_classdev *led_cdev);
> +extern int devm_led_classdev_register(struct device *parent,
> +                                     struct led_classdev *led_cdev);
>  extern void led_classdev_unregister(struct led_classdev *led_cdev);
> +extern void devm_led_classdev_unregister(struct device *parent,
> +                                        struct led_classdev *led_cdev);
>  extern void led_classdev_suspend(struct led_classdev *led_cdev);
>  extern void led_classdev_resume(struct led_classdev *led_cdev);
>
> --
> 1.9.1
>
