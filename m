From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: pca963x: enable low-power state
Date: Thu, 20 Oct 2016 08:08:52 +0200
Message-ID: <b0662ce1-d6ba-19d3-2f8b-49b4dacc3d9b@samsung.com>
References: <CGME20161020000405eucas1p1db947d4d5abdb1d0cd8fe65b1bfb69af@eucas1p1.samsung.com>
 <1476921828-4184-1-git-send-email-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20167 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751297AbcJTGJC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Oct 2016 02:09:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFC00E3Z12YUF50@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 20 Oct 2016 07:08:58 +0100 (BST)
In-reply-to: <1476921828-4184-1-git-send-email-matt@ranostay.consulting>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>, linux-leds@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Tony Lindgren <tony@atomide.com>, Peter Meerwald <p.meerwald@bct-electronic.com>, Ricardo Ribalda <ricardo.ribalda@gmail.com>

Hi Matt,

Thanks for the update.
Let me cc also authors of the driver.

On 10/20/2016 02:03 AM, Matt Ranostay wrote:
> Allow chip to enter low power state when no LEDs are being lit or in
> blink mode.
>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
> ---
> Changes from v1:
> * remove runtime pm
> * count leds that are off, if all then enter low-power state
>
>  drivers/leds/leds-pca963x.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index 407eba11e187..797dffc42c59 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -179,14 +179,32 @@ static void pca963x_blink(struct pca963x_led *pca963x)
>  	mutex_unlock(&pca963x->chip->mutex);
>  }
>
> +static int pca963x_power_state(struct pca963x_led *pca963x)
> +{
> +	int i, leds_on = 0;
> +
> +	for (i = 0; i < pca963x->chip->chipdef->n_leds; i++) {
> +		if (pca963x->chip->leds[i].led_cdev.brightness > 0)
> +			leds_on++;
> +	}

You could avoid executing this loop on every brightness setting,
if you added a counter and incremented/decremented it when turning
a LED on/off respectively. Then you could write PCA963X_MODE1 on
counter transitions from 0 to 1 and from 1 to 0.

> +
> +	return i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE1,
> +					 leds_on ? 0 : BIT(4));
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
>  static int pca963x_blink_set(struct led_classdev *led_cdev,
> @@ -391,8 +409,8 @@ static int pca963x_probe(struct i2c_client *client,
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
