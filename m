From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Drop owner assignment from i2c_driver
Date: Mon, 13 Jul 2015 14:31:27 +0200
Message-ID: <55A3AF9F.6050508@samsung.com>
References: <1436508053-14251-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46059 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019AbbGMMba (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2015 08:31:30 -0400
In-reply-to: <1436508053-14251-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Hi Krzysztof,

Thanks for the patch.

On 07/10/2015 08:00 AM, Krzysztof Kozlowski wrote:
> i2c_driver does not need to set an owner because i2c_register_driver()
> will set it.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> ---
>
> The coccinelle script which generated the patch was sent here:
> http://www.spinics.net/lists/kernel/msg2029903.html
> ---
>   drivers/leds/leds-lm3530.c  | 1 -
>   drivers/leds/leds-lm355x.c  | 1 -
>   drivers/leds/leds-lm3642.c  | 1 -
>   drivers/leds/leds-pca955x.c | 1 -
>   drivers/leds/leds-pca963x.c | 1 -
>   drivers/leds/leds-tca6507.c | 1 -
>   6 files changed, 6 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
> index 91325de3cd33..b38430cb10ad 100644
> --- a/drivers/leds/leds-lm3530.c
> +++ b/drivers/leds/leds-lm3530.c
> @@ -492,7 +492,6 @@ static struct i2c_driver lm3530_i2c_driver = {
>   	.id_table = lm3530_id,
>   	.driver = {
>   		.name = LM3530_NAME,
> -		.owner = THIS_MODULE,
>   	},
>   };
>
> diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
> index f5112cb2d991..48872997d6b4 100644
> --- a/drivers/leds/leds-lm355x.c
> +++ b/drivers/leds/leds-lm355x.c
> @@ -555,7 +555,6 @@ MODULE_DEVICE_TABLE(i2c, lm355x_id);
>   static struct i2c_driver lm355x_i2c_driver = {
>   	.driver = {
>   		   .name = LM355x_NAME,
> -		   .owner = THIS_MODULE,
>   		   .pm = NULL,
>   		   },
>   	.probe = lm355x_probe,
> diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
> index d3dec0132769..02ebe342f5af 100644
> --- a/drivers/leds/leds-lm3642.c
> +++ b/drivers/leds/leds-lm3642.c
> @@ -446,7 +446,6 @@ MODULE_DEVICE_TABLE(i2c, lm3642_id);
>   static struct i2c_driver lm3642_i2c_driver = {
>   	.driver = {
>   		   .name = LM3642_NAME,
> -		   .owner = THIS_MODULE,
>   		   .pm = NULL,
>   		   },
>   	.probe = lm3642_probe,
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index c3a08b60535b..b775e1efecd3 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -379,7 +379,6 @@ static int pca955x_remove(struct i2c_client *client)
>   static struct i2c_driver pca955x_driver = {
>   	.driver = {
>   		.name	= "leds-pca955x",
> -		.owner	= THIS_MODULE,
>   	},
>   	.probe	= pca955x_probe,
>   	.remove	= pca955x_remove,
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index bee3e1ab27fd..3f63a1bfdc4f 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -458,7 +458,6 @@ static int pca963x_remove(struct i2c_client *client)
>   static struct i2c_driver pca963x_driver = {
>   	.driver = {
>   		.name	= "leds-pca963x",
> -		.owner	= THIS_MODULE,
>   		.of_match_table = of_match_ptr(of_pca963x_match),
>   	},
>   	.probe	= pca963x_probe,
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index 20fa8e77f186..c1f910981781 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -830,7 +830,6 @@ static int tca6507_remove(struct i2c_client *client)
>   static struct i2c_driver tca6507_driver = {
>   	.driver   = {
>   		.name    = "leds-tca6507",
> -		.owner   = THIS_MODULE,
>   		.of_match_table = of_match_ptr(of_tca6507_leds_match),
>   	},
>   	.probe    = tca6507_probe,
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
