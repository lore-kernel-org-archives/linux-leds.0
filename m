From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v3] leds: pca963x: enable low-power state
Date: Thu, 27 Oct 2016 11:13:22 +0200
Message-ID: <38f53dfa-9097-390e-3d0b-29f29e6cd174@samsung.com>
References: <CGME20161027040451epcas4p2fb5c7c652494310445b94fe8b7ffa8a8@epcas4p2.samsung.com>
 <1477541084-4979-1-git-send-email-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59985 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752302AbcJ0JN3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Oct 2016 05:13:29 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFP0073Y8AD1X00@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 27 Oct 2016 10:13:25 +0100 (BST)
In-reply-to: <1477541084-4979-1-git-send-email-matt@ranostay.consulting>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>, linux-leds@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Peter Meerwald <p.meerwald@bct-electronic.com>, Ricardo Ribalda <ricardo.ribalda@gmail.com>, Tony Lindgren <tony@atomide.com>

On 10/27/2016 06:04 AM, Matt Ranostay wrote:
> Allow chip to enter low power state when no LEDs are being lit or in
> blink mode.
>
> Cc: Peter Meerwald <p.meerwald@bct-electronic.com>,
> Cc: Ricardo Ribalda <ricardo.ribalda@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
> ---
>  drivers/leds/leds-pca963x.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index b6ce1f2ec33e..e1767369776f 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -103,6 +103,7 @@ struct pca963x {
>  	struct mutex mutex;
>  	struct i2c_client *client;
>  	struct pca963x_led *leds;
> +	int leds_on;
>  };
>
>  struct pca963x_led {
> @@ -180,14 +181,40 @@ static void pca963x_blink(struct pca963x_led *pca963x)
>  	mutex_unlock(&pca963x->chip->mutex);
>  }
>
> +static int pca963x_power_state(struct pca963x_led *pca963x)
> +{
> +	int i, ret = 0, leds_on = 0;
> +	int prev_leds = pca963x->chip->leds_on;
> +
> +	for (i = 0; i < pca963x->chip->chipdef->n_leds; i++) {
> +		if (pca963x->chip->leds[i].led_cdev.brightness > 0)
> +			leds_on++;
> +	}

You're still executing this loop on every brightness setting.
It could be avoided if you cached current LED states in struct pca963x
using bit flags and set_bit()/clear_bit().

In pca963x_led_set() you would have to set bit related to
pca963x->led_num if brightness > 0 and clear it otherwise.

Then, you would have to check if any bit is on with a single
readout, and update the power mode basing on that if needed.

> +
> +	if (leds_on != prev_leds && !(leds_on && prev_leds)) {
> +		ret = i2c_smbus_write_byte_data(pca963x->chip->client,
> +						PCA963X_MODE1,
> +						leds_on ? 0 : BIT(4));
> +	}
> +
> +	pca963x->chip->leds_on = leds_on;
> +
> +	return ret;
> +}
> +
>  static int pca963x_led_set(struct led_classdev *led_cdev,
>  	enum led_brightness value)
>  {
>  	struct pca963x_led *pca963x;
> +	int ret;
>
>  	pca963x = container_of(led_cdev, struct pca963x_led, led_cdev);
>
> -	return pca963x_brightness(pca963x, value);
> +	ret = pca963x_brightness(pca963x, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	return pca963x_power_state(pca963x);
>  }
>
>  static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
> @@ -403,8 +430,8 @@ static int pca963x_probe(struct i2c_client *client,
>  			goto exit;
>  	}
>
> -	/* Disable LED all-call address and set normal mode */
> -	i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
> +	/* Disable LED all-call address, and power down initially */
> +	i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
>
>  	if (pdata) {
>  		/* Configure output: open-drain or totem pole (push-pull) */
>


-- 
Best regards,
Jacek Anaszewski
