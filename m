From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC PATCH 2/2] leds: as3645a: Update LED label generation
Date: Thu, 14 Dec 2017 20:03:36 +0200
Message-ID: <20171214180335.j6qk2rrge77gpbba@valkosipuli.retiisi.org.uk>
References: <20171212215024.30116-1-dmurphy@ti.com>
 <20171212215024.30116-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:39876 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753684AbdLNSDk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 14 Dec 2017 13:03:40 -0500
Content-Disposition: inline
In-Reply-To: <20171212215024.30116-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Dan,

Thanks for the patchset.

On Tue, Dec 12, 2017 at 03:50:24PM -0600, Dan Murphy wrote:
> Generate the LED label based off either the
> DT label node or off the I2C ID in the
> i2c device id struct.
> 
> If the label is used then this should denote
> the LED function.  As an example it would
> be as3645a:<function>
> 
>  Otherwise if the label is not
> used the LED label will be as3645a:flash and
> as3645a:indicator.

Which tree the patch is for? I see "id" is a u32 in what I have, and
also not defined in this scope.

> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-as3645a.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index f883616d9e60..197acd69ddcc 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -526,10 +526,11 @@ static int as3645a_parse_node(struct as3645a *flash,
>  
>  	rval = of_property_read_string(flash->flash_node, "label", &name);
>  	if (!rval)
> -		strlcpy(names->flash, name, sizeof(names->flash));
> +		snprintf(names->flash, sizeof(names->flash), "%s:%s",
> +			 id->name, name);
>  	else
>  		snprintf(names->flash, sizeof(names->flash),
> -			 "%s:flash", node->name);
> +			 "%s:flash", id->name);
>  
>  	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
>  				    &cfg->flash_timeout_us);
> @@ -570,10 +571,11 @@ static int as3645a_parse_node(struct as3645a *flash,
>  
>  	rval = of_property_read_string(flash->indicator_node, "label", &name);
>  	if (!rval)
> -		strlcpy(names->indicator, name, sizeof(names->indicator));
> +		snprintf(names->indicator, sizeof(names->indicator), "%s:%s",
> +			 id->name, name);
>  	else
>  		snprintf(names->indicator, sizeof(names->indicator),
> -			 "%s:indicator", node->name);
> +			 "%s:indicator", id->name);
>  
>  	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
>  				    &cfg->indicator_max_ua);



-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
