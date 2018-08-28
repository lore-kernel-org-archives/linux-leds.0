From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Convert to using %pOFn instead of device_node.name
Date: Tue, 28 Aug 2018 22:37:03 +0200
Message-ID: <5e5ea614-5242-eabc-2e4a-aa20432a4a12@gmail.com>
References: <20180828015252.28511-1-robh@kernel.org>
 <20180828015252.28511-25-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828015252.28511-25-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Rob,

Thank you for the patch.

On 08/28/2018 03:52 AM, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> 
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/leds/leds-as3645a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index f883616d9e60..98a69b1a43f9 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -529,7 +529,7 @@ static int as3645a_parse_node(struct as3645a *flash,
>  		strlcpy(names->flash, name, sizeof(names->flash));
>  	else
>  		snprintf(names->flash, sizeof(names->flash),
> -			 "%s:flash", node->name);
> +			 "%pOFn:flash", node);
>  
>  	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
>  				    &cfg->flash_timeout_us);
> @@ -573,7 +573,7 @@ static int as3645a_parse_node(struct as3645a *flash,
>  		strlcpy(names->indicator, name, sizeof(names->indicator));
>  	else
>  		snprintf(names->indicator, sizeof(names->indicator),
> -			 "%s:indicator", node->name);
> +			 "%pOFn:indicator", node);
>  
>  	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
>  				    &cfg->indicator_max_ua);
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
