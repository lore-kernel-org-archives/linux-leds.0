From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH Resend 1/2] leds: Include linux/of.h header
Date: Wed, 2 Oct 2013 14:12:43 -0700
Message-ID: <CAK5ve-+RZpYyFjQws42=7pQ7vAh3K6py6NDaktkwwGy66Ezk-g@mail.gmail.com>
References: <1380368311-27529-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:45358 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753385Ab3JBVNF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2013 17:13:05 -0400
Received: by mail-lb0-f181.google.com with SMTP id u14so1252447lbd.40
        for <linux-leds@vger.kernel.org>; Wed, 02 Oct 2013 14:13:03 -0700 (PDT)
In-Reply-To: <1380368311-27529-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On Sat, Sep 28, 2013 at 4:38 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> 'of_match_ptr' is defined in linux/of.h. Include it explicitly.
>

Applied into my tree,
Thanks,

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/leds/leds-gpio.c   |    1 +
>  drivers/leds/leds-lp5523.c |    1 +
>  drivers/leds/leds-lp5562.c |    1 +
>  drivers/leds/leds-lp8501.c |    1 +
>  drivers/leds/leds-ns2.c    |    1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index e8b01e5..7ccafde 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/gpio.h>
>  #include <linux/leds.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_gpio.h>
>  #include <linux/slab.h>
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index fe3bcbb..6b553d9 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -29,6 +29,7 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/leds-lp55xx.h>
>  #include <linux/slab.h>
>
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index 2585cfd..bf006f4 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -17,6 +17,7 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/leds-lp55xx.h>
>  #include <linux/slab.h>
>
> diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
> index 8d55a780..f1c704f 100644
> --- a/drivers/leds/leds-lp8501.c
> +++ b/drivers/leds/leds-lp8501.c
> @@ -18,6 +18,7 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/leds-lp55xx.h>
>  #include <linux/slab.h>
>
> diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
> index 141f134..c7a4230 100644
> --- a/drivers/leds/leds-ns2.c
> +++ b/drivers/leds/leds-ns2.c
> @@ -30,6 +30,7 @@
>  #include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/leds-kirkwood-ns2.h>
> +#include <linux/of.h>
>  #include <linux/of_gpio.h>
>
>  /*
> --
> 1.7.9.5
>
