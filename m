From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Only remove trigger if one is actually configured.
Date: Thu, 15 Sep 2016 13:48:16 +0200
Message-ID: <75e5d60e-39e4-574f-5417-7532f1f19f1f@samsung.com>
References: <CGME20160914092340eucas1p27f875a415de6684be5b09872ab1b9ab6@eucas1p2.samsung.com>
 <1473844987-21112-1-git-send-email-daro@hms.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65242 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756385AbcIOLsW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2016 07:48:22 -0400
In-reply-to: <1473844987-21112-1-git-send-email-daro@hms.se>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Daniel Romell <danielromell@gmail.com>, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Romell <daro@hms.se>

Hi Daniel,

On 09/14/2016 11:23 AM, Daniel Romell wrote:
> In led_trigger_remove(), check if there is a trigger
> configured before calling led_trigger_set(). This will
> prevent some unnecessary work, and more importantly stop
> sending uevent change events when no change has in fact
> occurred.
>
> Signed-off-by: Daniel Romell <daro@hms.se>
> ---
>  drivers/leds/led-triggers.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 59d6a3e..28c7a66 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -147,7 +147,8 @@ EXPORT_SYMBOL_GPL(led_trigger_set);
>  void led_trigger_remove(struct led_classdev *led_cdev)
>  {
>  	down_write(&led_cdev->trigger_lock);
> -	led_trigger_set(led_cdev, NULL);
> +	if (led_cdev->trigger)
> +		led_trigger_set(led_cdev, NULL);
>  	up_write(&led_cdev->trigger_lock);
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_remove);
>

Thanks for the patch. Applied.

-- 
Best regards,
Jacek Anaszewski
