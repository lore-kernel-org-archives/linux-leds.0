From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: add LED_ON brightness as boolean value
Date: Wed, 4 Jan 2017 20:59:00 +0100
Message-ID: <b3ac3619-3b80-a9ab-fa0c-b56685291fd6@gmail.com>
References: <CGME20170104134122epcas1p48ee63a75c2e159b06d792ec8bc7d4e6d@epcas1p4.samsung.com>
 <20170104134107.24902-1-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170104134107.24902-1-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-leds@vger.kernel.org

Hi Andi,

Thanks for the patch.

On 01/04/2017 02:41 PM, Andi Shyti wrote:
> Some devices do not handle the led brightness or simply don't
> care about it. Conceptually said devices want to just switch on
> or off the led. It is useless in this case to have a 255 range
> of brightness, while just having an LED_ON and LED_OFF improves
> the boolean meaning of the led status.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  include/linux/leds.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 569cb531094c..0258f9c49034 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -27,6 +27,7 @@ struct device;
>  
>  enum led_brightness {
>  	LED_OFF		= 0,
> +	LED_ON,

Now lack of explicit value assignment to LED_ON looks weird
since it is surrounded by other initializer values.
I'd prefer to have "LED_ON = 1," in this line.

>  	LED_HALF	= 127,
>  	LED_FULL	= 255,
>  };
> 

-- 
Best regards,
Jacek Anaszewski
