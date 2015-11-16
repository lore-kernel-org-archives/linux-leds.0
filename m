From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: ledtrig-transient: fix duration to be msec instead
 of jiffies
Date: Mon, 16 Nov 2015 14:20:22 +0100
Message-ID: <5649D816.9080109@samsung.com>
References: <1447197017-4783-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59702 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261AbbKPNU1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 08:20:27 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXW00FQ2T1Z6K60@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 16 Nov 2015 13:20:24 +0000 (GMT)
In-reply-to: <1447197017-4783-1-git-send-email-robh@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Shuah Khan <shuahkhan@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Rob,

On 11/11/2015 12:10 AM, Rob Herring wrote:
> The transient trigger duration is documented to be in msec units, but is
> actually in jiffies units. Other time based triggers are in msec units
> as well. Fix the timer setup to convert from msec.
>
> This could break an existing userspace that worked around this problem,
> but exposing jiffies to userspace is just wrong and would break anyway
> if HZ is changed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Shuah Khan <shuahkhan@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> ---
>   drivers/leds/trigger/ledtrig-transient.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
> index 3c34de4..60034bf 100644
> --- a/drivers/leds/trigger/ledtrig-transient.c
> +++ b/drivers/leds/trigger/ledtrig-transient.c
> @@ -85,7 +85,7 @@ static ssize_t transient_activate_store(struct device *dev,
>   		transient_data->restore_state =
>   		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
>   		mod_timer(&transient_data->timer,
> -			  jiffies + transient_data->duration);
> +			  jiffies + msecs_to_jiffies(transient_data->duration));
>   	}
>
>   	/* state == 0 && transient_data->activate == 0
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski
