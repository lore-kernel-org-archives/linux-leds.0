From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/2] leds: lp8860: Add regulator enable during init
Date: Thu, 16 Nov 2017 21:53:49 +0100
Message-ID: <43567c55-e86a-9d76-be42-50e39ee827e8@gmail.com>
References: <20171115195213.8404-1-dmurphy@ti.com>
 <20171115195213.8404-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:43402 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933004AbdKPUys (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Nov 2017 15:54:48 -0500
In-Reply-To: <20171115195213.8404-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dan,

Thanks for the patch set.

Both patches applied to the for-4.16 branch of linux-leds.git.

Best regards,
Jacek Anaszewski

On 11/15/2017 08:52 PM, Dan Murphy wrote:
> Add the regulator enable call during initialization.
> If init fails then disable the regulator.
> 
> Also during init the gpio gets set low even
> on a passing case so add if everything passes
> then return.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lp8860.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
> index 91b6c5fbd361..f91a4fe25168 100644
> --- a/drivers/leds/leds-lp8860.c
> +++ b/drivers/leds/leds-lp8860.c
> @@ -247,6 +247,15 @@ static int lp8860_init(struct lp8860_led *led)
>  	unsigned int read_buf;
>  	int ret, i, reg_count;
>  
> +	if (led->regulator) {
> +		ret = regulator_enable(led->regulator);
> +		if (ret) {
> +			dev_err(&led->client->dev,
> +				"Failed to enable regulator\n");
> +			return ret;
> +		}
> +	}
> +
>  	if (led->enable_gpio)
>  		gpiod_direction_output(led->enable_gpio, 1);
>  
> @@ -282,12 +291,25 @@ static int lp8860_init(struct lp8860_led *led)
>  	ret = regmap_write(led->regmap,
>  			LP8860_EEPROM_CNTRL,
>  			LP8860_PROGRAM_EEPROM);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&led->client->dev, "Failed programming EEPROM\n");
> +		goto out;
> +	}
> +
> +	return ret;
> +
>  out:
>  	if (ret)
>  		if (led->enable_gpio)
>  			gpiod_direction_output(led->enable_gpio, 0);
> +
> +	if (led->regulator) {
> +		ret = regulator_disable(led->regulator);
> +		if (ret)
> +			dev_err(&led->client->dev,
> +				"Failed to disable regulator\n");
> +	}
> +
>  	return ret;
>  }
>  
> 
