From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] leds: pm8058: Silence pointer to integer size warning
Date: Fri, 1 Dec 2017 08:56:51 +0000
Message-ID: <20171201085651.3yn3d3pslmr6rmkj@dell>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171201051656.31694-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171201051656.31694-1-bjorn.andersson@linaro.org>
Sender: linux-next-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, 30 Nov 2017, Bjorn Andersson wrote:

> The pointer returned by of_device_get_match_data() doesn't have the same
> size as u32 on 64-bit architectures, causing a compile warning when
> compile-testing the driver on such platform.
> 
> Cast the return value of of_device_get_match_data() to unsigned long and
> then to u32 to silence this warning.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/leds/leds-pm8058.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied with Pavel's Ack thanks.

Will send out a pull-request shortly.

> diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
> index a52674327857..8988ba3b2d65 100644
> --- a/drivers/leds/leds-pm8058.c
> +++ b/drivers/leds/leds-pm8058.c
> @@ -106,7 +106,7 @@ static int pm8058_led_probe(struct platform_device *pdev)
>  	if (!led)
>  		return -ENOMEM;
>  
> -	led->ledtype = (u32)of_device_get_match_data(&pdev->dev);
> +	led->ledtype = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);
>  
>  	map = dev_get_regmap(pdev->dev.parent, NULL);
>  	if (!map) {

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
