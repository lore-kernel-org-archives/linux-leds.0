From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: tca6507: Remove unnecessary reg check
Date: Mon, 9 Oct 2017 20:43:04 +0200
Message-ID: <73348511-cf3f-466c-6257-dff8747820fc@gmail.com>
References: <1507488905-23169-1-git-send-email-chris.gekas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33533 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755129AbdJISn6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Oct 2017 14:43:58 -0400
In-Reply-To: <1507488905-23169-1-git-send-email-chris.gekas@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Christos Gkekas <chris.gekas@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Christos,

Thanks for the patch.

On 10/08/2017 08:55 PM, Christos Gkekas wrote:
> Variable reg is unsigned so checking whether it is less than zero is not
> necessary.
> 
> Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>
> ---
>  drivers/leds/leds-tca6507.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index 45222a7..c12c16f 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -715,7 +715,7 @@ tca6507_led_dt_init(struct i2c_client *client)
>  		if (of_property_match_string(child, "compatible", "gpio") >= 0)
>  			led.flags |= TCA6507_MAKE_GPIO;
>  		ret = of_property_read_u32(child, "reg", &reg);
> -		if (ret != 0 || reg < 0 || reg >= NUM_LEDS)
> +		if (ret != 0 || reg >= NUM_LEDS)
>  			continue;
>  
>  		tca_leds[reg] = led;
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
