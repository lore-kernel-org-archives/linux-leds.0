From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 3/3] leds: avoid using DEVICE_ATTR macro for
 max_brightness attribute
Date: Thu, 7 Aug 2014 17:21:46 -0700
Message-ID: <CAK5ve-JGyH++vzfcJZBHpW1Z3mSCaZtNWPOzC0D4JjQqdD_0bg@mail.gmail.com>
References: <1407413424-30087-1-git-send-email-j.anaszewski@samsung.com> <1407413424-30087-4-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:36549 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601AbaHHAWI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Aug 2014 20:22:08 -0400
Received: by mail-la0-f50.google.com with SMTP id gf5so4060553lab.37
        for <linux-leds@vger.kernel.org>; Thu, 07 Aug 2014 17:22:06 -0700 (PDT)
In-Reply-To: <1407413424-30087-4-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>

On Thu, Aug 7, 2014 at 5:10 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Make definition of the brightness related sysfs attributes
> consistent. The modification entails change of the function
> name: led_max_brightness_show -> max_brightness_show
>

Applied.

Thanks,
-Bryan

> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> ---
>  drivers/leds/led-class.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 3df5632..f4e5bb4 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -59,14 +59,14 @@ static ssize_t brightness_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(brightness);
>
> -static ssize_t led_max_brightness_show(struct device *dev,
> +static ssize_t max_brightness_show(struct device *dev,
>                 struct device_attribute *attr, char *buf)
>  {
>         struct led_classdev *led_cdev = dev_get_drvdata(dev);
>
>         return sprintf(buf, "%u\n", led_cdev->max_brightness);
>  }
> -static DEVICE_ATTR(max_brightness, 0444, led_max_brightness_show, NULL);
> +static DEVICE_ATTR_RO(max_brightness);
>
>  #ifdef CONFIG_LEDS_TRIGGERS
>  static DEVICE_ATTR(trigger, 0644, led_trigger_show, led_trigger_store);
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
