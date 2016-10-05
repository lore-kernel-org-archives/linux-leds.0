From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-pca963x: add nxp,leds-suspend property
Date: Wed, 05 Oct 2016 10:09:23 +0200
Message-ID: <0ba8033f-d0b3-8b2f-8ff4-fa47dcf50ba1@samsung.com>
References: <CGME20161005022942eucas1p2b092723a0c38c116cc971971e43b169e@eucas1p2.samsung.com>
 <1475634572-18274-1-git-send-email-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50803 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754611AbcJEIJa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Oct 2016 04:09:30 -0400
In-reply-to: <1475634572-18274-1-git-send-email-matt@ranostay.consulting>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>

Hi Matt,

On 10/05/2016 04:29 AM, Matt Ranostay wrote:
> Allow the LED subsystem to blank the LEDS on suspend.
>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
> ---
>  Documentation/devicetree/bindings/leds/pca963x.txt | 1 +
>  drivers/leds/leds-pca963x.c                        | 9 +++++++++
>  include/linux/platform_data/leds-pca963x.h         | 6 ++++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
> index dafbe9931c2b..61b1f037ebd0 100644
> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
> @@ -7,6 +7,7 @@ Optional properties:
>  - nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
>    to open-drain, newer chips to totem pole)
>  - nxp,hw-blink : use hardware blinking instead of software blinking
> +- nxp,leds-suspend : turn off LEDS on system suspend

How about making this property generic and adding it to the common LED
bindings?

Cc Rob.

>
>  Each led is represented as a sub-node of the nxp,pca963x device.
>
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index 407eba11e187..9a347b94f1db 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -294,6 +294,12 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
>  	else
>  		pdata->blink_type = PCA963X_SW_BLINK;
>
> +	/* default to turning off LEDs on suspend */
> +	if (of_property_read_bool(np, "nxp,leds-suspend"))
> +		pdata->suspend = PCA963X_LED_SUSPEND;
> +	else
> +		pdata->suspend = PCA963X_LED_RETAIN;
> +
>  	return pdata;
>  }
>
> @@ -386,6 +392,9 @@ static int pca963x_probe(struct i2c_client *client,
>  		if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
>  			pca963x[i].led_cdev.blink_set = pca963x_blink_set;
>
> +		if (pdata && pdata->suspend == PCA963X_LED_SUSPEND)
> +			pca963x[i].led_cdev.flags = LED_CORE_SUSPENDRESUME;
> +

In the previous patch you had this:

static int pca963x_set_power(struct i2c_client *client, bool state)
{
	return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
					 state ? 0 : BIT(4));
}

The LED core doesn't know how to turn a device in a power down mode.
It will only set the brightness of all LEDs exposed by the driver
to LED_OFF on suspend. It is driver's responsibility to tell the device
that it should enter power down mode if all LEDs are off.


>  		err = led_classdev_register(&client->dev, &pca963x[i].led_cdev);
>  		if (err < 0)
>  			goto exit;
> diff --git a/include/linux/platform_data/leds-pca963x.h b/include/linux/platform_data/leds-pca963x.h
> index e731f0036329..e5bad91e2fab 100644
> --- a/include/linux/platform_data/leds-pca963x.h
> +++ b/include/linux/platform_data/leds-pca963x.h
> @@ -33,10 +33,16 @@ enum pca963x_blink_type {
>  	PCA963X_HW_BLINK,
>  };
>
> +enum pca963x_suspend {
> +	PCA963X_LED_RETAIN,
> +	PCA963X_LED_SUSPEND,
> +};
> +

If we made the DT property generic, then we could skip PCA963X prefix
and move this enum to the linux/leds.h.

>  struct pca963x_platform_data {
>  	struct led_platform_data leds;
>  	enum pca963x_outdrv outdrv;
>  	enum pca963x_blink_type blink_type;
> +	enum pca963x_suspend suspend;
>  };
>
>  #endif /* __LINUX_PCA963X_H*/
>


-- 
Best regards,
Jacek Anaszewski
