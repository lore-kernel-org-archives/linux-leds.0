From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] leds: tlc591xx: Remove redundant
 I2C_FUNC_SMBUS_BYTE_DATA functionality check
Date: Sun, 26 Jul 2015 19:31:45 +0200
Message-ID: <20150726173145.GI2385@lunn.ch>
References: <1437883516.7007.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:47754 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755191AbbGZRia (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 26 Jul 2015 13:38:30 -0400
Content-Disposition: inline
In-Reply-To: <1437883516.7007.1.camel@ingics.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Bryan Wu <cooloney@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

On Sun, Jul 26, 2015 at 12:05:16PM +0800, Axel Lin wrote:
> This checking is done by regmap_get_i2c_bus() which is called in
> devm_regmap_init_i2c().
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks
	Andrew

> ---
>  drivers/leds/leds-tlc591xx.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index de16c29..b806eca 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -231,10 +231,6 @@ tlc591xx_probe(struct i2c_client *client,
>  	if (!count || count > tlc591xx->max_leds)
>  		return -EINVAL;
>  
> -	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_BYTE_DATA))
> -		return -EIO;
> -
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> -- 
> 2.1.0
> 
> 
> 
