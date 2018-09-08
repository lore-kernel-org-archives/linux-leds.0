From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pwm: silently error out on EPROBE_DEFER
Date: Sat, 8 Sep 2018 22:49:06 +0200
Message-ID: <b9d1e9bf-956a-9560-d223-2b4c5a76b14f@gmail.com>
References: <20180906135904.13803-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906135904.13803-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Jerome,

Thank you for the patch.

On 09/06/2018 03:59 PM, Jerome Brunet wrote:
> When probing, if we fail to get the pwm due to probe deferal, we shouldn't
> print an error message. Just be silent in this case.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/leds/leds-pwm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index df80c89ebe7f..5d3faae51d59 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -100,8 +100,9 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  		led_data->pwm = devm_pwm_get(dev, led->name);
>  	if (IS_ERR(led_data->pwm)) {
>  		ret = PTR_ERR(led_data->pwm);
> -		dev_err(dev, "unable to request PWM for %s: %d\n",
> -			led->name, ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "unable to request PWM for %s: %d\n",
> +				led->name, ret);
>  		return ret;
>  	}
>  
>

Applied.

-- 
Best regards,
Jacek Anaszewski
