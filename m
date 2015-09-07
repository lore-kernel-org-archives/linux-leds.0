From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds: leds-ipaq-micro: Fix coding style issues
Date: Mon, 07 Sep 2015 16:54:36 +0200
Message-ID: <55EDA52C.8020807@samsung.com>
References: <1441635204-3634-1-git-send-email-falakreyaz@gmail.com>
 <1441635204-3634-3-git-send-email-falakreyaz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30912 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750874AbbIGOyk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 10:54:40 -0400
In-reply-to: <1441635204-3634-3-git-send-email-falakreyaz@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Muhammad Falak R Wani <falakreyaz@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Muhammad,

On 09/07/2015 04:13 PM, Muhammad Falak R Wani wrote:
> Spaces at the starting of a line are removed, indentation
> using tab, instead of space. Also, warnings related to
> line width of more than 80 characters is also taken care of.
> Two warnings have been left alone to aid better readability.
>
> Signed-off-by: Muhammad Falak R Wani <falakreyaz@gmail.com>
> ---
>   drivers/leds/leds-ipaq-micro.c | 38 +++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
> index 1206215..86716ea 100644
> --- a/drivers/leds/leds-ipaq-micro.c
> +++ b/drivers/leds/leds-ipaq-micro.c
> @@ -16,9 +16,9 @@
>   #define LED_YELLOW	0x00
>   #define LED_GREEN	0x01
>
> -#define LED_EN          (1 << 4)        /* LED ON/OFF 0:off, 1:on                       */
> -#define LED_AUTOSTOP    (1 << 5)        /* LED ON/OFF auto stop set 0:disable, 1:enable */
> -#define LED_ALWAYS      (1 << 6)        /* LED Interrupt Mask 0:No mask, 1:mask         */
> +#define LED_EN	      (1 << 4) /* LED ON/OFF 0:off, 1:on	      */
> +#define LED_AUTOSTOP  (1 << 5) /* LED ON/OFF auto stop set 0:disable,1:enable*/
> +#define LED_ALWAYS    (1 << 6) /* LED Interrupt Mask 0:No mask, 1:mask	 */

Please keep comments ending in the same column.

>
>   static void micro_leds_brightness_set(struct led_classdev *led_cdev,
>   				      enum led_brightness value)
> @@ -27,14 +27,14 @@ static void micro_leds_brightness_set(struct led_classdev *led_cdev,
>   	/*
>   	 * In this message:
>   	 * Byte 0 = LED color: 0 = yellow, 1 = green
> -	 *          yellow LED is always ~30 blinks per minute
> +	 *	  yellow LED is always ~30 blinks per minute
>   	 * Byte 1 = duration (flags?) appears to be ignored
>   	 * Byte 2 = green ontime in 1/10 sec (deciseconds)
> -	 *          1 = 1/10 second
> -	 *          0 = 256/10 second
> +	 *	  1 = 1/10 second
> +	 *	  0 = 256/10 second
>   	 * Byte 3 = green offtime in 1/10 sec (deciseconds)
> -	 *          1 = 1/10 second
> -	 *          0 = 256/10 seconds
> +	 *	  1 = 1/10 second
> +	 *	  0 = 256/10 seconds
>   	 */
>   	struct ipaq_micro_msg msg = {
>   		.id = MSG_NOTIFY_LED,
> @@ -64,14 +64,14 @@ static int micro_leds_blink_set(struct led_classdev *led_cdev,
>   	/*
>   	 * In this message:
>   	 * Byte 0 = LED color: 0 = yellow, 1 = green
> -	 *          yellow LED is always ~30 blinks per minute
> +	 *	  yellow LED is always ~30 blinks per minute
>   	 * Byte 1 = duration (flags?) appears to be ignored
>   	 * Byte 2 = green ontime in 1/10 sec (deciseconds)
> -	 *          1 = 1/10 second
> -	 *          0 = 256/10 second
> +	 *	  1 = 1/10 second
> +	 *	  0 = 256/10 second
>   	 * Byte 3 = green offtime in 1/10 sec (deciseconds)
> -	 *          1 = 1/10 second
> -	 *          0 = 256/10 seconds
> +	 *	  1 = 1/10 second
> +	 *	  0 = 256/10 seconds
>   	 */

This looks worse after applying the patch. Why actually did you change
it? AFAICS checkpatch.pl doesn't complain here.

>   	struct ipaq_micro_msg msg = {
>   		.id = MSG_NOTIFY_LED,
> @@ -79,14 +79,14 @@ static int micro_leds_blink_set(struct led_classdev *led_cdev,
>   	};
>
>   	msg.tx_data[0] = LED_GREEN;
> -        if (*delay_on > IPAQ_LED_MAX_DUTY ||
> +	if (*delay_on > IPAQ_LED_MAX_DUTY ||
>   	    *delay_off > IPAQ_LED_MAX_DUTY)
> -                return -EINVAL;
> +		return -EINVAL;
>
> -        if (*delay_on == 0 && *delay_off == 0) {
> -                *delay_on = 100;
> -                *delay_off = 100;
> -        }
> +	if (*delay_on == 0 && *delay_off == 0) {
> +		*delay_on = 100;
> +		*delay_off = 100;
> +	}
>
>   	msg.tx_data[1] = 0;
>   	if (*delay_on >= IPAQ_LED_MAX_DUTY)
>


-- 
Best Regards,
Jacek Anaszewski
