From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] led/led-class: Handle LEDs with the same name
Date: Thu, 12 Feb 2015 11:48:50 -0800
Message-ID: <CAK5ve-+98h+gzvcso_GmU+39mqhZgvaCnAgcBG0pzdZc1S406g@mail.gmail.com>
References: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:35072 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751483AbbBLTtL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 14:49:11 -0500
In-Reply-To: <1423657572-22299-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Wed, Feb 11, 2015 at 4:26 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> The current code expected that every LED had an unique name. This is a
> legit expectation when the device tree can no be modified or extended.
> But with device tree overlays this requirement can be easily broken.
>

Could you please give me some real error message or example about this
device tree overlays? Looks like it's not only for LED subsystem and
how is it handled in other subsystem?

> This patch finds out if the name is already in use and adds the suffix
> _1, _2... if not.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  drivers/leds/led-class.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index dbeebac..b60f942 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -208,6 +208,13 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
>         .resume         = led_resume,
>  };
>
> +static int match_child(struct device *dev, void *data)
> +{
> +       if (!dev_name(dev))
> +               return 0;
> +       return !strcmp(dev_name(dev), (char *)data);

strncmp instead of strcmp?

> +}
> +
>  /**
>   * led_classdev_register - register a new object of led_classdev class.
>   * @parent: The device to register.
> @@ -215,9 +222,28 @@ static const struct dev_pm_ops leds_class_dev_pm_ops = {
>   */
>  int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
>  {
> +       char *name;
> +       char *temp_name = NULL;
> +       int i = 0;
> +
> +       do {
> +               if (i == 0)
> +                       name = (char *)led_cdev->name;
> +               else {
> +                       kfree(temp_name);
> +                       temp_name = kasprintf(GFP_KERNEL, "%s_%d",
> +                                             led_cdev->name, i);
> +                       if (!temp_name)
> +                               return -ENOMEM;
> +                       name = temp_name;
> +               }
> +
> +               i++;
> +       } while (device_find_child(parent, name, match_child));
> +

I still think we need solve this issue in device tree core code not in
the user of DT.

>         led_cdev->dev = device_create_with_groups(leds_class, parent, 0,
> -                                       led_cdev, led_cdev->groups,
> -                                       "%s", led_cdev->name);
> +                                       led_cdev, led_cdev->groups, name);
> +       kfree(temp_name);
>         if (IS_ERR(led_cdev->dev))
>                 return PTR_ERR(led_cdev->dev);
>
> --
> 2.1.4
>
