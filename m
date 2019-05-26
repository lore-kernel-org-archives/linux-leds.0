From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH -next] leds: max77650: Remove set but not used variable
 'parent'
Date: Sun, 26 May 2019 19:11:34 +0200
Message-ID: <06cdba20-4bce-6739-7db9-dcf3a3c7b6bf@gmail.com>
References: <20190525141941.16088-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190525141941.16088-1-yuehaibing@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, bgolaszewski@baylibre.com, pavel@ucw.cz, dmurphy@ti.com
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi YueHaibing,

Thank you for the patch.

On 5/25/19 4:19 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/leds/leds-max77650.c: In function max77650_led_probe:
> drivers/leds/leds-max77650.c:67:17: warning: variable parent set but not used [-Wunused-but-set-variable]
> 
> It is never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/leds/leds-max77650.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
> index 6b74ce9cac12..8a8e5c65b157 100644
> --- a/drivers/leds/leds-max77650.c
> +++ b/drivers/leds/leds-max77650.c
> @@ -64,7 +64,6 @@ static int max77650_led_probe(struct platform_device *pdev)
>   {
>   	struct device_node *of_node, *child;
>   	struct max77650_led *leds, *led;
> -	struct device *parent;
>   	struct device *dev;
>   	struct regmap *map;
>   	const char *label;
> @@ -72,7 +71,6 @@ static int max77650_led_probe(struct platform_device *pdev)
>   	u32 reg;
>   
>   	dev = &pdev->dev;
> -	parent = dev->parent;
>   	of_node = dev->of_node;
>   
>   	if (!of_node)
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
