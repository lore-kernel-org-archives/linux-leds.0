From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: oneshot - Allow default delay to be passed as an
 argument
Date: Sat, 3 Sep 2016 15:44:42 +0200
Message-ID: <590baa53-8426-d2dc-803d-752bf6082c20@gmail.com>
References: <20160903090331.GA15375@ami-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34530 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752998AbcICOD0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2016 10:03:26 -0400
Received: by mail-wm0-f68.google.com with SMTP id v143so6540116wmv.1
        for <linux-leds@vger.kernel.org>; Sat, 03 Sep 2016 07:01:56 -0700 (PDT)
In-Reply-To: <20160903090331.GA15375@ami-desktop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Amitesh Singh <singh.amitesh@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Hi Amitesh,

On 09/03/2016 11:03 AM, Amitesh Singh wrote:
> This patch facilates the blink delay to be passed as
> an argument at the time of module loading.
> e.g.
> insmod ledtrigg-oneshot.ko default_delay=100
> ---
>  drivers/leds/trigger/ledtrig-oneshot.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
> index b8ea9f0..95933a1 100644
> --- a/drivers/leds/trigger/ledtrig-oneshot.c
> +++ b/drivers/leds/trigger/ledtrig-oneshot.c
> @@ -22,6 +22,9 @@
>
>  #define DEFAULT_DELAY 100
>
> +static unsigned long default_delay = DEFAULT_DELAY;
> +module_param(default_delay, ulong, S_IRUGO|S_IWUSR);
> +
>  struct oneshot_trig_data {
>  	unsigned int invert;
>  };
> @@ -146,8 +149,8 @@ static void oneshot_trig_activate(struct led_classdev *led_cdev)
>  	if (rc)
>  		goto err_out_invert;
>
> -	led_cdev->blink_delay_on = DEFAULT_DELAY;
> -	led_cdev->blink_delay_off = DEFAULT_DELAY;
> +	led_cdev->blink_delay_on = default_delay;
> +	led_cdev->blink_delay_off = default_delay;
>
>  	led_cdev->activated = true;
>
>

Why do you need this module parameter? You can change
delay_on and delay_off values from sysfs.

-- 
Best regards,
Jacek Anaszewski
