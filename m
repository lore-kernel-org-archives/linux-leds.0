From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds-pca963x: add bindings to invert polarity
Date: Thu, 27 Apr 2017 21:01:35 +0200
Message-ID: <074311fd-8c3b-d0d3-2a7a-c18262cca16d@gmail.com>
References: <20170427063733.32323-1-anders@chargestorm.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:34994 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937311AbdD0TCV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Apr 2017 15:02:21 -0400
In-Reply-To: <20170427063733.32323-1-anders@chargestorm.se>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Anders Darander <anders@chargestorm.se>, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rpurdie@rpsys.net

Hi Anders,

On 04/27/2017 08:37 AM, Anders Darander wrote:
> Add a new DT property, nxp,inverted-out, to invert the polarity of the output.
> 
> Tested on PCA9634.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  Documentation/devicetree/bindings/leds/pca963x.txt |  1 +
>  drivers/leds/leds-pca963x.c                        | 17 +++++++++++++++--
>  include/linux/platform_data/leds-pca963x.h         |  6 ++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
> index dfbdb123a9bf..4eee41482041 100644
> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
> @@ -10,6 +10,7 @@ Optional properties:
>  - nxp,period-scale : In some configurations, the chip blinks faster than expected.
>  		     This parameter provides a scaling ratio (fixed point, decimal divided
>  		     by 1000) to compensate, e.g. 1300=1.3x and 750=0.75x.
> +- nxp,inverted-out: invert the polarity of the generated PWM
>  
>  Each led is represented as a sub-node of the nxp,pca963x device.
>  
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index ded1e4dac36a..3bf9a1271819 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -342,6 +342,12 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
>  	if (of_property_read_u32(np, "nxp,period-scale", &chip->scaling))
>  		chip->scaling = 1000;
>  
> +	/* default to non-inverted output, unless inverted is specified */
> +	if (of_property_read_bool(np, "nxp,inverted-out"))
> +		pdata->dir = PCA963X_INVERTED;
> +	else
> +		pdata->dir = PCA963X_NORMAL;
> +
>  	return pdata;
>  }
>  
> @@ -452,11 +458,18 @@ static int pca963x_probe(struct i2c_client *client,
>  	i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
>  
>  	if (pdata) {
> +		u8 mode2 = i2c_smbus_read_byte_data(pca963x->chip->client,
> +						    PCA963X_MODE2);
>  		/* Configure output: open-drain or totem pole (push-pull) */
>  		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
> -			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x01);
> +			mode2 |= 0x01;
>  		else
> -			i2c_smbus_write_byte_data(client, PCA963X_MODE2, 0x05);
> +			mode2 |= 0x05;
> +		/* Configure direction: normal or inverted */
> +		if (pdata->dir == PCA963X_INVERTED)
> +			mode2 |= 0x10;
> +		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
> +					  mode2);
>  	}
>  
>  	return 0;
> diff --git a/include/linux/platform_data/leds-pca963x.h b/include/linux/platform_data/leds-pca963x.h
> index e731f0036329..54e845ffb5ed 100644
> --- a/include/linux/platform_data/leds-pca963x.h
> +++ b/include/linux/platform_data/leds-pca963x.h
> @@ -33,10 +33,16 @@ enum pca963x_blink_type {
>  	PCA963X_HW_BLINK,
>  };
>  
> +enum pca963x_direction {
> +	PCA963X_NORMAL,
> +	PCA963X_INVERTED,
> +};
> +
>  struct pca963x_platform_data {
>  	struct led_platform_data leds;
>  	enum pca963x_outdrv outdrv;
>  	enum pca963x_blink_type blink_type;
> +	enum pca963x_direction dir;
>  };
>  
>  #endif /* __LINUX_PCA963X_H*/
> 

Thanks for the patch.

Applied to the for-4.13 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
