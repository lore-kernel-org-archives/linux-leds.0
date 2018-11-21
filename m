From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: powernv: add of_node_put()
Date: Wed, 21 Nov 2018 21:44:57 +0100
Message-ID: <82ef58c4-1d18-9dd6-71ec-42f799370f33@gmail.com>
References: <20181121123138.21870-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121123138.21870-1-tiny.windzz@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, pavel@ucw.cz, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Yangtao,

Thank you for the patch.

On 11/21/2018 01:31 PM, Yangtao Li wrote:
> of_find_node_by_path() acquires a reference to the node returned by
> it and that reference needs to be dropped by its caller.bl_idle_init()
> doesn't do that, so fix it.

s/bl_idle_init/powernv_led_probe/

I suppose that you adopted the commit message from a fix
for drivers/cpuidle/cpuidle-big_little.c.

> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/leds/leds-powernv.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
> index b1adbd70ce2e..0b1540029034 100644
> --- a/drivers/leds/leds-powernv.c
> +++ b/drivers/leds/leds-powernv.c
> @@ -285,6 +285,7 @@ static int powernv_led_probe(struct platform_device *pdev)
>  	struct device_node *led_node;
>  	struct powernv_led_common *powernv_led_common;
>  	struct device *dev = &pdev->dev;
> +	int rc;
>  
>  	led_node = of_find_node_by_path("/ibm,opal/leds");
>  	if (!led_node) {
> @@ -295,15 +296,20 @@ static int powernv_led_probe(struct platform_device *pdev)
>  
>  	powernv_led_common = devm_kzalloc(dev, sizeof(*powernv_led_common),
>  					  GFP_KERNEL);
> -	if (!powernv_led_common)
> -		return -ENOMEM;
> +	if (!powernv_led_common){

missing space:

s/){/) {/

> +		rc = -ENOMEM;
> +		goto out;
> +	}
>  
>  	mutex_init(&powernv_led_common->lock);
>  	powernv_led_common->max_led_type = cpu_to_be64(OPAL_SLOT_LED_TYPE_MAX);
>  
>  	platform_set_drvdata(pdev, powernv_led_common);
>  
> -	return powernv_led_classdev(pdev, led_node, powernv_led_common);
> +	rc = powernv_led_classdev(pdev, led_node, powernv_led_common);
> +out:
> +	of_node_put(led_node);
> +	return rc;
>  }
>  
>  /* Platform driver remove */
> 

I've fixed those trivial problems and applied the patch
to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
