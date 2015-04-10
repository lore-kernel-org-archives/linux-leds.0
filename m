From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Fri, 10 Apr 2015 16:18:34 +0200
Message-ID: <5527DBBA.9060109@samsung.com>
References: <20150410083040.GA2189@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19618 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932827AbbDJOSj (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Apr 2015 10:18:39 -0400
In-reply-to: <20150410083040.GA2189@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bryan Wu <cooloney@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 04/10/2015 10:30 AM, Dan Carpenter wrote:
> Static checkers complain that "timers[i].delay_on" is an unsigned long
> but we're writing to only 32 bits of it.  The code works on 32 bit
> systems and little endian 64 bit systems so it doesn't cause a problem
> in practise but it's still better to silence the warning.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: use a temporary variable
>
> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> index 028686f2..6cb4537 100644
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@ -444,12 +444,17 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
>   		if (!timers)
>   			return -ENOMEM;
>   		for (i = 0; i < num_timers; i++) {
> +			u32 delay_on = 0;
> +			u32 delay_off = 0;

These variables don't need initialization, as they are assigned
a new value in of_property_read_u32_index anyway.

>   			of_property_read_u32_index(np, "timers", 3 * i,
>   						&timers[i].mode);
>   			of_property_read_u32_index(np, "timers", 3 * i + 1,
> -						(u32 *) &timers[i].delay_on);
> +						   &delay_on);
>   			of_property_read_u32_index(np, "timers", 3 * i + 2,
> -						(u32 *) &timers[i].delay_off);
> +						   &delay_off);
> +			timers[i].delay_on = delay_on;
> +			timers[i].delay_off = delay_off;
>   		}
>   		pdata->timer = timers;
>   		pdata->num_timer = num_timers;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Best Regards,
Jacek Anaszewski
