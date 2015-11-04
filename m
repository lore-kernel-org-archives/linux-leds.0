From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds-bcm6328: Reuse bcm6328_led_set() instead of copying
 its functionality
Date: Wed, 04 Nov 2015 16:41:37 +0100
Message-ID: <563A2731.40204@samsung.com>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5630A9C1.5060907@samsung.com> <56327821.8020508@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23566 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932323AbbKDPll (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 4 Nov 2015 10:41:41 -0500
In-reply-to: <56327821.8020508@simon.arlott.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IA==?= =?UTF-8?B?Um9qYXM=?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Simon,

Thanks for the patch. Generally this patch touches two
areas - replacement of redundant code with bcm6328_led_set,
and locking reorganization. These should be split into
two separate patches. Nonetheless, I've noticed some
issues in the code, please refer below.

On 10/29/2015 08:48 PM, Simon Arlott wrote:
> When ensuring a consistent initial LED state in bcm6328_led (as they may
> be blinking instead of on/off), the LED register is set using a copy of
> bcm6328_led_set(). To avoid further errors relating to active low handling,
> call this function directly instead.
>
> As bcm6328_led_set() expects to acquire the spinlock, narrow the locking
> to only cover reading of the current state. There is no need to hold the
> spinlock between reading the current value and setting it again because
> the LED device has not yet been registered.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
>   drivers/leds/leds-bcm6328.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
> index c7ea5c6..db327bd 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -264,7 +264,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>   		       unsigned long *blink_leds, unsigned long *blink_delay)
>   {
>   	struct bcm6328_led *led;
> -	unsigned long flags;
>   	const char *state;
>   	int rc;
>
> @@ -286,13 +285,12 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>   						    "linux,default-trigger",
>   						    NULL);
>
> -	spin_lock_irqsave(lock, flags);
>   	if (!of_property_read_string(nc, "default-state", &state)) {
>   		if (!strcmp(state, "on")) {
>   			led->cdev.brightness = LED_FULL;
>   		} else if (!strcmp(state, "keep")) {
>   			void __iomem *mode;
> -			unsigned long val, shift;
> +			unsigned long val, shift, flags;
>
>   			shift = bcm6328_pin2shift(led->pin);
>   			if (shift / 16)
> @@ -300,9 +298,12 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>   			else
>   				mode = mem + BCM6328_REG_MODE_LO;
>
> +			spin_lock_irqsave(lock, flags);
>   			val = bcm6328_led_read(mode) >>
>   			      BCM6328_LED_SHIFT(shift % 16);
>   			val &= BCM6328_LED_MODE_MASK;
> +			spin_unlock_irqrestore(lock, flags);
> +
>   			if ((led->active_low && val == BCM6328_LED_MODE_ON) ||
>   			    (!led->active_low && val == BCM6328_LED_MODE_OFF))
>   				led->cdev.brightness = LED_FULL;
> @@ -315,12 +316,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>   		led->cdev.brightness = LED_OFF;
>   	}
>
> -	if ((led->active_low && led->cdev.brightness == LED_FULL) ||
> -	    (!led->active_low && led->cdev.brightness == LED_OFF))
> -		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
> -	else
> -		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);

There are some problems with active_low mode here, I didn't recognize
earlier.

I'd expect that active_low implies reverse logic, i.e.:

LED_FULL -> bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
LED_OFF -> bcm6328_led_mode(led, BCM6328_LED_MODE_ON);

Let's take a look at bcm6328_led_set:

         if ((led->active_low && value == LED_OFF) ||
             (!led->active_low && value != LED_OFF))
                 bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
         else
                 bcm6328_led_mode(led, BCM6328_LED_MODE_ON);

which, for active_low case, boils down to:

LED_FULL -> bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
LED_OFF -> bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);

and for !active_low case to:

LED_FULL -> bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
LED_OFF -> bcm6328_led_mode(led, BCM6328_LED_MODE_ON);

so, this is the other way round.

In bcm6328_led we have:

	if ((led->active_low && val == BCM6328_LED_MODE_ON) ||
		(!led->active_low && val == BCM6328_LED_MODE_OFF))
		  led->cdev.brightness = LED_FULL;
	else
		led->cdev.brightness = LED_OFF;

which, for active_low case, boils down to:

BCM6328_LED_MODE_ON -> led->cdev.brightness = LED_FULL
BCM6328_LED_MODE_OFF -> led->cdev.brightness = LED_OFF

and for !active_low case to:

BCM6328_LED_MODE_ON -> led->cdev.brightness = LED_OFF
BCM6328_LED_MODE_OFF -> led->cdev.brightness = LED_FULL

again, the other way round.

All this looks like active_low really means active high.
Correct me if I'm wrong.

Alvaro, Jonas, could you also help to clarify this discrepancy?


> -	spin_unlock_irqrestore(lock, flags);
> +	bcm6328_led_set(&led->cdev, led->cdev.brightness);
>
>   	led->cdev.brightness_set = bcm6328_led_set;
>   	led->cdev.blink_set = bcm6328_blink_set;
>


-- 
Best Regards,
Jacek Anaszewski
