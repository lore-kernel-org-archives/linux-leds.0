From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: ktd2692: avoid harmless maybe-uninitialized warning
Date: Thu, 26 Jan 2017 21:20:13 +0100
Message-ID: <e8e07af6-788b-751c-c200-54bba4934611@gmail.com>
References: <20170125222247.1210546-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35086 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752256AbdAZUVD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Jan 2017 15:21:03 -0500
In-Reply-To: <20170125222247.1210546-1-arnd@arndb.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Arnd,

Thanks for the patch, applied.

Best regards,
Jacek Anaszewski

On 01/25/2017 11:22 PM, Arnd Bergmann wrote:
> gcc gets confused about the control flow in ktd2692_parse_dt(), causing
> it to warn about what seems like a potential bug:
> 
> drivers/leds/leds-ktd2692.c: In function 'ktd2692_probe':
> drivers/leds/leds-ktd2692.c:244:15: error: '*((void *)&led_cfg+8)' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> drivers/leds/leds-ktd2692.c:225:7: error: 'led_cfg.flash_max_microamp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> drivers/leds/leds-ktd2692.c:232:3: error: 'led_cfg.movie_max_microamp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> The code is fine, and slightly reworking it in an equivalent way lets
> gcc figure that out too, which gets rid of the warning.
> 
> Fixes: 77e7915b15bb ("leds: ktd2692: Add missing of_node_put")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/leds-ktd2692.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
> index bf23ba191ad0..45296aaca9da 100644
> --- a/drivers/leds/leds-ktd2692.c
> +++ b/drivers/leds/leds-ktd2692.c
> @@ -270,15 +270,15 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
>  		return -ENXIO;
>  
>  	led->ctrl_gpio = devm_gpiod_get(dev, "ctrl", GPIOD_ASIS);
> -	if (IS_ERR(led->ctrl_gpio)) {
> -		ret = PTR_ERR(led->ctrl_gpio);
> +	ret = PTR_ERR_OR_ZERO(led->ctrl_gpio);
> +	if (ret) {
>  		dev_err(dev, "cannot get ctrl-gpios %d\n", ret);
>  		return ret;
>  	}
>  
>  	led->aux_gpio = devm_gpiod_get(dev, "aux", GPIOD_ASIS);
> -	if (IS_ERR(led->aux_gpio)) {
> -		ret = PTR_ERR(led->aux_gpio);
> +	ret = PTR_ERR_OR_ZERO(led->aux_gpio);
> +	if (ret) {
>  		dev_err(dev, "cannot get aux-gpios %d\n", ret);
>  		return ret;
>  	}
> 
