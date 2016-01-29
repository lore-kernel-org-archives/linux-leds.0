From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCHv2] leds: lp3944: improve wording and formatting in a comment
Date: Fri, 29 Jan 2016 09:34:39 +0100
Message-ID: <56AB241F.5070508@samsung.com>
References: <56A9C4D6.5000505@samsung.com>
 <1453996169-18124-1-git-send-email-ao2@ao2.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:39162 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753129AbcA2Ien (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 29 Jan 2016 03:34:43 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1P00DNNH5TM990@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 29 Jan 2016 08:34:41 +0000 (GMT)
In-reply-to: <1453996169-18124-1-git-send-email-ao2@ao2.it>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Antonio Ospite <ao2@ao2.it>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

On 01/28/2016 04:49 PM, Antonio Ospite wrote:
> Improve the wording for the comment about the led status, and while at
> it also use the standard formatting for multi-line comments.
>
> Signed-off-by: Antonio Ospite <ao2@ao2.it>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> ---
>
> Changes since v1:
>    - make the comment more explicit as suggested by Jacek
>
>   drivers/leds/leds-lp3944.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
> index 6c758ae..be60c18 100644
> --- a/drivers/leds/leds-lp3944.c
> +++ b/drivers/leds/leds-lp3944.c
> @@ -199,8 +199,11 @@ static int lp3944_led_set(struct lp3944_led_data *led, u8 status)
>   	if (status > LP3944_LED_STATUS_DIM1)
>   		return -EINVAL;
>
> -	/* invert only 0 and 1, leave unchanged the other values,
> -	 * remember we are abusing status to set blink patterns
> +	/*
> +	 * Invert status only when it's < 2 (i.e. 0 or 1) which means it's
> +	 * controlling the on/off state directly.
> +	 * When, instead, status is >= 2 don't invert it because it would mean
> +	 * to mess with the hardware blinking mode.
>   	 */
>   	if (led->type == LP3944_LED_TYPE_LED_INVERTED && status < 2)
>   		status = 1 - status;
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski
