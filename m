From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: gpio: Use GPIOF_OUT_INIT_LOW instead of hardcoded
 zero
Date: Fri, 19 Feb 2016 16:29:01 +0100
Message-ID: <56C734BD.8040209@samsung.com>
References: <1455875554-4268-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50590 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751342AbcBSP3F (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2016 10:29:05 -0500
In-reply-to: <1455875554-4268-1-git-send-email-geert+renesas@glider.be>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Geert,

On 02/19/2016 10:52 AM, Geert Uytterhoeven wrote:
> Use the GPIO flag definition instead of a numeric literal, so the casual
> reader grepping for GPIOF_ will find the GPIO flags used.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/leds/leds-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 7bc53280dbfdd91d..89955574430cec75 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -86,7 +86,7 @@ static int create_gpio_led(const struct gpio_led *template,
>   		 * still uses GPIO numbers. Ultimately we would like to get
>   		 * rid of this block completely.
>   		 */
> -		unsigned long flags = 0;
> +		unsigned long flags = GPIOF_OUT_INIT_LOW;
>
>   		/* skip leds that aren't available */
>   		if (!gpio_is_valid(template->gpio)) {
>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
