From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] leds: as3645a: Fix checkpatch warnings
Date: Wed, 13 Dec 2017 01:35:05 +0200
Message-ID: <7040653.C0Zv065OYX@avalon>
References: <20171212215011.30066-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171212215011.30066-1-dmurphy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Tuesday, 12 December 2017 23:50:11 EET Dan Murphy wrote:
> Fix two checkpatch warnings for 80 char
> length and for a quoted string across multiple
> line warnings.
> 
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  drivers/leds/leds-as3645a.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index 9a257f969300..f883616d9e60 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -360,7 +360,8 @@ static int as3645a_set_flash_brightness(struct
> led_classdev_flash *fled, {
>  	struct as3645a *flash = fled_to_as3645a(fled);
> 
> -	flash->flash_current = as3645a_current_to_reg(flash, true, brightness_ua);
> +	flash->flash_current = as3645a_current_to_reg(flash, true,
> +						      brightness_ua);
> 
>  	return as3645a_set_current(flash);
>  }
> @@ -455,8 +456,8 @@ static int as3645a_detect(struct as3645a *flash)
> 
>  	/* Verify the chip model and version. */
>  	if (model != 0x01 || rfu != 0x00) {
> -		dev_err(dev, "AS3645A not detected "
> -			"(model %d rfu %d)\n", model, rfu);
> +		dev_err(dev, "AS3645A not detected (model %d rfu %d)\n",
> +			model, rfu);
>  		return -ENODEV;
>  	}


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
