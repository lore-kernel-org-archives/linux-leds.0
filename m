From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-cobalt-raq: use builtin_platform_driver
Date: Wed, 23 Nov 2016 16:49:09 +0100
Message-ID: <e19a6fb2-e3ad-f3a8-1db8-62604be2407f@samsung.com>
References: <CGME20161123145015epcas3p37a73b865e661ada76216d3ce9cd894da@epcas3p3.samsung.com>
 <f3870e62588f79405ee12777a1daf570bc96f476.1479912572.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <f3870e62588f79405ee12777a1daf570bc96f476.1479912572.git.geliangtang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geliang Tang <geliangtang@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Geliang,

Thanks for the patch.

Applied to the for-next branch of liunx-leds.git.

Best regards,
Jacek Anaszewski

On 11/23/2016 03:50 PM, Geliang Tang wrote:
> Use builtin_platform_driver() helper to simplify the code.
>
> Signed-off-by: Geliang Tang <geliangtang@gmail.com>
> ---
>  drivers/leds/leds-cobalt-raq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
> index b316df4..8d066fa 100644
> --- a/drivers/leds/leds-cobalt-raq.c
> +++ b/drivers/leds/leds-cobalt-raq.c
> @@ -115,8 +115,4 @@ static struct platform_driver cobalt_raq_led_driver = {
>  	},
>  };
>
> -static int __init cobalt_raq_led_init(void)
> -{
> -	return platform_driver_register(&cobalt_raq_led_driver);
> -}
> -device_initcall(cobalt_raq_led_init);
> +builtin_platform_driver(cobalt_raq_led_driver);
>
