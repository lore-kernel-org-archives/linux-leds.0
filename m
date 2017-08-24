From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/4] leds: aat1290: make array max_mm_current_percent
 static const
Date: Thu, 24 Aug 2017 22:38:49 +0200
Message-ID: <c33bd764-6804-f811-559b-9ea0624b5501@gmail.com>
References: <20170824130055.23642-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170824130055.23642-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Colin,

Thanks for the path set, applied.

Best regards,
Jacek Anaszewski

On 08/24/2017 03:00 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array max_mm_current_percent on the stack, instead
> make it static const.  Makes the object code smaller by over 280 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    7225	   1936	     64	   9225	   2409	./drivers/leds/leds-aat1290.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    6847	   2032	     64	   8943	   22ef	./drivers/leds/leds-aat1290.o`
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/leds/leds-aat1290.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
> index a21e19297745..35fcb0ca9092 100644
> --- a/drivers/leds/leds-aat1290.c
> +++ b/drivers/leds/leds-aat1290.c
> @@ -314,8 +314,10 @@ static void aat1290_led_validate_mm_current(struct aat1290_led *led,
>  static int init_mm_current_scale(struct aat1290_led *led,
>  			struct aat1290_led_config_data *cfg)
>  {
> -	int max_mm_current_percent[] = { 20, 22, 25, 28, 32, 36, 40, 45, 50, 56,
> -						63, 71, 79, 89, 100 };
> +	static const int max_mm_current_percent[] = {
> +		20, 22, 25, 28, 32, 36, 40, 45, 50, 56,
> +		63, 71, 79, 89, 100
> +	};
>  	int i, max_mm_current =
>  			AAT1290_MAX_MM_CURRENT(cfg->max_flash_current);
>  
> 
