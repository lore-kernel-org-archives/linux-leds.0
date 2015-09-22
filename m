From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 31/38] leds: tca6507: remove invalid check
Date: Tue, 22 Sep 2015 09:37:16 +0200
Message-ID: <5601052C.50809@samsung.com>
References: <1442842450-29769-1-git-send-email-a.hajda@samsung.com>
 <1442842450-29769-32-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64748 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932340AbbIVHhX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2015 03:37:23 -0400
In-reply-to: <1442842450-29769-32-git-send-email-a.hajda@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Andrzej,

On 09/21/2015 03:34 PM, Andrzej Hajda wrote:
> unsigned value cannot be lesser than zero.
>
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].
>
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2038576
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>   drivers/leds/leds-tca6507.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index edbecc4..93564f6 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -713,7 +713,7 @@ tca6507_led_dt_init(struct i2c_client *client)
>   		if (of_property_match_string(child, "compatible", "gpio") >= 0)
>   			led.flags |= TCA6507_MAKE_GPIO;
>   		ret = of_property_read_u32(child, "reg", &reg);
> -		if (ret != 0 || reg < 0 || reg >= NUM_LEDS)
> +		if (ret != 0 || reg >= NUM_LEDS)
>   			continue;
>
>   		tca_leds[reg] = led;
>

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
