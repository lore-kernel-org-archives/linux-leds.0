From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH v2] leds: lp55xx: avoid dereferencing a stale
 platform_data pointer
Date: Thu, 6 Aug 2015 14:44:17 +0900
Message-ID: <55C2F431.3030107@ti.com>
References: <1438679930-26080-1-git-send-email-toshik@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:50657 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754317AbbHFFoV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 6 Aug 2015 01:44:21 -0400
In-Reply-To: <1438679930-26080-1-git-send-email-toshik@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Toshi Kikuchi <toshik@chromium.org>, linux-leds@vger.kernel.org

Hi Toshi,

On 8/4/2015 6:18 PM, Toshi Kikuchi wrote:
> lp55xx_of_populate_pdata() allocates platform_data dynamically if DT
> is used. The memory area is allocated with devm_kzalloc() so it is
> automatically freed if the driver is unloaded. The driver should clear
> the pointer to platform_data before it is unloaded, otherwise it will
> use the stale pointer accidentally if the driver is reloaded.
>
> Change-Id: Ia097ed83b92cec5a52534a71dcb5322869c2a7b1
> Signed-off-by: Toshi Kikuchi <toshik@chromium.org>

Acked-by: Milo Kim <milo.kim@ti.com>

> ---
>   drivers/leds/leds-lp5521.c        | 1 +
>   drivers/leds/leds-lp5523.c        | 1 +
>   drivers/leds/leds-lp5562.c        | 1 +
>   drivers/leds/leds-lp55xx-common.c | 7 +++++++
>   drivers/leds/leds-lp55xx-common.h | 2 ++
>   drivers/leds/leds-lp8501.c        | 1 +
>   6 files changed, 13 insertions(+)
>
> diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
> index 8ca197a..faba1f9 100644
> --- a/drivers/leds/leds-lp5521.c
> +++ b/drivers/leds/leds-lp5521.c
> @@ -581,6 +581,7 @@ static int lp5521_remove(struct i2c_client *client)
>   	lp55xx_unregister_sysfs(chip);
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
> +	lp55xx_of_reset_pdata(&client->dev, client->dev.of_node);
>
>   	return 0;
>   }
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index 584dbbc..4fc2850 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -947,6 +947,7 @@ static int lp5523_remove(struct i2c_client *client)
>   	lp55xx_unregister_sysfs(chip);
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
> +	lp55xx_of_reset_pdata(&client->dev, client->dev.of_node);
>
>   	return 0;
>   }
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index ca85724..9d8c250 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -581,6 +581,7 @@ static int lp5562_remove(struct i2c_client *client)
>   	lp55xx_unregister_sysfs(chip);
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
> +	lp55xx_of_reset_pdata(&client->dev, client->dev.of_node);
>
>   	return 0;
>   }
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 96d51e9..ec29163 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -594,6 +594,13 @@ int lp55xx_of_populate_pdata(struct device *dev, struct device_node *np)
>   }
>   EXPORT_SYMBOL_GPL(lp55xx_of_populate_pdata);
>
> +void lp55xx_of_reset_pdata(struct device *dev, struct device_node *np)
> +{
> +	if (np)
> +		dev->platform_data = NULL;
> +}
> +EXPORT_SYMBOL_GPL(lp55xx_of_reset_pdata);
> +
>   MODULE_AUTHOR("Milo Kim <milo.kim@ti.com>");
>   MODULE_DESCRIPTION("LP55xx Common Driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
> index cceab48..2a6a8fc 100644
> --- a/drivers/leds/leds-lp55xx-common.h
> +++ b/drivers/leds/leds-lp55xx-common.h
> @@ -204,5 +204,7 @@ extern void lp55xx_unregister_sysfs(struct lp55xx_chip *chip);
>   /* common device tree population function */
>   extern int lp55xx_of_populate_pdata(struct device *dev,
>   				    struct device_node *np);
> +extern void lp55xx_of_reset_pdata(struct device *dev,
> +				  struct device_node *np);
>
>   #endif /* _LEDS_LP55XX_COMMON_H */
> diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
> index d3098e3..d75a6f3 100644
> --- a/drivers/leds/leds-lp8501.c
> +++ b/drivers/leds/leds-lp8501.c
> @@ -375,6 +375,7 @@ static int lp8501_remove(struct i2c_client *client)
>   	lp55xx_unregister_sysfs(chip);
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
> +	lp55xx_of_reset_pdata(&client->dev, client->dev.of_node);
>
>   	return 0;
>   }
>
