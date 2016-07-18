From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: lp3952: Store leds[LP3952_LED_ALL] in struct
 lp3952_led_array
Date: Mon, 18 Jul 2016 08:48:48 +0200
Message-ID: <578C7BD0.80606@samsung.com>
References: <1468721898.9106.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39965 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750857AbcGRGsx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jul 2016 02:48:53 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAI003K009EOA00@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 18 Jul 2016 07:48:50 +0100 (BST)
In-reply-to: <1468721898.9106.1.camel@ingics.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Tony Makkiel <tony.makkiel@daqri.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Axel,

Thanks for catching this. I missed also redundant devm_kfree here.
Would it be OK for you if I merged your cleanup with the original
patch and added your Reviewed-by to the commit message instead?
This driver hasn't been pushed to the mainline yet, so it would be
nice not to introduce its original version with some shortcomings
that need to be immediately fixed.

Best regards,
Jacek Anaszewski

On 07/17/2016 04:18 AM, Axel Lin wrote:
> The LP3952_LED_ALL is known at compile time, so we can just store
> leds[LP3952_LED_ALL] in struct lp3952_led_array rather than calling
> devm_kcalloc() to allocate the memory.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>   drivers/leds/leds-lp3952.c  | 9 ---------
>   include/linux/leds-lp3952.h | 2 +-
>   2 files changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
> index f6157c0..a73c8ff 100644
> --- a/drivers/leds/leds-lp3952.c
> +++ b/drivers/leds/leds-lp3952.c
> @@ -215,21 +215,12 @@ static int lp3952_probe(struct i2c_client *client,
>   			const struct i2c_device_id *id)
>   {
>   	int status;
> -	struct lp3952_ctrl_hdl *leds;
>   	struct lp3952_led_array *priv;
>
>   	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>
> -	leds = devm_kcalloc(&client->dev, LP3952_LED_ALL, sizeof(*leds),
> -			    GFP_KERNEL);
> -	if (!leds) {
> -		devm_kfree(&client->dev, priv);
> -		return -ENOMEM;
> -	}
> -
> -	priv->leds = leds;
>   	priv->client = client;
>
>   	priv->enable_gpio = devm_gpiod_get(&client->dev, "nrst",
> diff --git a/include/linux/leds-lp3952.h b/include/linux/leds-lp3952.h
> index edd5ed6..49b37ed 100644
> --- a/include/linux/leds-lp3952.h
> +++ b/include/linux/leds-lp3952.h
> @@ -119,7 +119,7 @@ struct lp3952_led_array {
>   	struct regmap *regmap;
>   	struct i2c_client *client;
>   	struct gpio_desc *enable_gpio;
> -	struct lp3952_ctrl_hdl *leds;
> +	struct lp3952_ctrl_hdl leds[LP3952_LED_ALL];
>   };
>
>   #endif /* LEDS_LP3952_H_ */
>
