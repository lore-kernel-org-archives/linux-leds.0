From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/8] leds: as3645a: Fix misuse of strlcpy
Date: Fri, 5 Jul 2019 10:33:22 +0300
Message-ID: <20190705073322.wee52ttghxm2vczn@valkosipuli.retiisi.org.uk>
References: <cover.1562283944.git.joe@perches.com>
 <79fe35321ff794dccf1d08b415cee40636fa5fce.1562283944.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <79fe35321ff794dccf1d08b415cee40636fa5fce.1562283944.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Jul 04, 2019 at 04:57:42PM -0700, Joe Perches wrote:
> Probable cut&paste typo - use the correct field size.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Thanks, Joe!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> ---
>  drivers/leds/leds-as3645a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
> index 14ab6b0e4de9..050088dff8dd 100644
> --- a/drivers/leds/leds-as3645a.c
> +++ b/drivers/leds/leds-as3645a.c
> @@ -668,7 +668,7 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
>  	};
>  
>  	strlcpy(cfg.dev_name, led->name, sizeof(cfg.dev_name));
> -	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfg.dev_name));
> +	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfgind.dev_name));
>  
>  	flash->vf = v4l2_flash_init(
>  		&flash->client->dev, flash->flash_node, &flash->fled, NULL,

-- 
Kind regards,

Sakari Ailus
