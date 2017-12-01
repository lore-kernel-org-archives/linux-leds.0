From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 6/6] leds: as3645a: Update the LED label generation
Date: Fri, 1 Dec 2017 10:58:19 -0600
Message-ID: <b11338fc-153b-e740-990f-509f82ee2100@ti.com>
References: <20171201165613.10358-1-dmurphy@ti.com>
 <20171201165613.10358-6-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:22896 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbdLAQ6f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Dec 2017 11:58:35 -0500
In-Reply-To: <20171201165613.10358-6-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/01/2017 10:56 AM, Dan Murphy wrote:
> Update the LED label creationg to call the

s/creationg/creation

> of_led_compose_name api to generate a label.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v6 - New patch to use the new LED class API
> 
>  drivers/leds/leds-as3645a.c | 24 +++++++++---------------
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index 9a257f969300..5a29db115277 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -27,6 +27,7 @@
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>
> +#include <uapi/linux/uleds.h>
>  
>  #include <media/v4l2-flash-led-class.h>
>  
> @@ -133,8 +134,8 @@ struct as3645a_config {
>  };
>  
>  struct as3645a_names {
> -	char flash[32];
> -	char indicator[32];
> +	char flash[LED_MAX_NAME_SIZE];
> +	char indicator[LED_MAX_NAME_SIZE];
>  };
>  
>  struct as3645a {
> @@ -496,7 +497,6 @@ static int as3645a_parse_node(struct as3645a *flash,
>  {
>  	struct as3645a_config *cfg = &flash->cfg;
>  	struct device_node *child;
> -	const char *name;
>  	int rval;
>  
>  	for_each_child_of_node(node, child) {
> @@ -523,12 +523,9 @@ static int as3645a_parse_node(struct as3645a *flash,
>  		return -ENODEV;
>  	}
>  
> -	rval = of_property_read_string(flash->flash_node, "label", &name);
> -	if (!rval)
> -		strlcpy(names->flash, name, sizeof(names->flash));
> -	else
> -		snprintf(names->flash, sizeof(names->flash),
> -			 "%s:flash", node->name);
> +	of_led_compose_name(node, flash->flash_node, "flash",
> +				sizeof("flash"),
> +				names->flash);
>  
>  	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
>  				    &cfg->flash_timeout_us);
> @@ -567,12 +564,9 @@ static int as3645a_parse_node(struct as3645a *flash,
>  		goto out_err;
>  	}
>  
> -	rval = of_property_read_string(flash->indicator_node, "label", &name);
> -	if (!rval)
> -		strlcpy(names->indicator, name, sizeof(names->indicator));
> -	else
> -		snprintf(names->indicator, sizeof(names->indicator),
> -			 "%s:indicator", node->name);
> +	of_led_compose_name(node, flash->indicator_node, "indicator",
> +				sizeof("indicator"),
> +				names->indicator);
>  
>  	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
>  				    &cfg->indicator_max_ua);
> 


-- 
------------------
Dan Murphy
