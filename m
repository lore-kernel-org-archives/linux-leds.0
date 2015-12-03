From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: sunfire: Use platform_register/unregister_drivers()
Date: Thu, 03 Dec 2015 11:43:41 +0100
Message-ID: <56601CDD.70806@samsung.com>
References: <1449073621-12049-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1449073621-12049-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 12/02/2015 05:27 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> These new helpers simplify implementing multi-driver modules and
> properly handle failure to register one driver by unregistering all
> previously registered drivers.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/leds/leds-sunfire.c | 23 +++++++----------------
>   1 file changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
> index c2553c54f2cf..7c09db8bd4e8 100644
> --- a/drivers/leds/leds-sunfire.c
> +++ b/drivers/leds/leds-sunfire.c
> @@ -234,28 +234,19 @@ static struct platform_driver sunfire_fhc_led_driver = {
>   	},
>   };
>
> +static struct platform_driver * const drivers[] = {
> +	&sunfire_clockboard_led_driver,
> +	&sunfire_fhc_led_driver,
> +};
> +
>   static int __init sunfire_leds_init(void)
>   {
> -	int err = platform_driver_register(&sunfire_clockboard_led_driver);
> -
> -	if (err) {
> -		pr_err("Could not register clock board LED driver\n");
> -		return err;
> -	}
> -
> -	err = platform_driver_register(&sunfire_fhc_led_driver);
> -	if (err) {
> -		pr_err("Could not register FHC LED driver\n");
> -		platform_driver_unregister(&sunfire_clockboard_led_driver);
> -	}
> -
> -	return err;
> +	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
>   }
>
>   static void __exit sunfire_leds_exit(void)
>   {
> -	platform_driver_unregister(&sunfire_clockboard_led_driver);
> -	platform_driver_unregister(&sunfire_fhc_led_driver);
> +	platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
>   }
>
>   module_init(sunfire_leds_init);
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski
