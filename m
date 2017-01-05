From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: add LED_ON brightness as boolean value
Date: Thu, 5 Jan 2017 23:17:28 +0100
Message-ID: <fc2714c2-b4ad-7dd2-ef2b-0245176c89c9@gmail.com>
References: <CGME20170105023420epcas1p28624575ab6619e1930ebc05795725d90@epcas1p2.samsung.com>
 <20170105023412.26472-1-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170105023412.26472-1-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: Jaechul Lee <jcsing.lee@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-leds@vger.kernel.org

Hi Andi,

Thanks for the update.

Applied.

On 01/05/2017 03:34 AM, Andi Shyti wrote:
> Some devices do not handle the led brightness or simply don't
> care about it. Conceptually said devices want to just switch on
> or off the led. It is useless in this case to have a 255 range
> of brightness, while just having an LED_ON and LED_OFF improves
> the boolean meaning of the led status.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
> Hi,
> 
> Thanks Pavel and Jacek for your review.
> 
> Differences from V1
> - used explicit assignement of LED_ON in the enum
> - added Pavel's ack
> 
> Andi
> 
>  include/linux/leds.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 569cb531094c..bb50d0151e75 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -27,6 +27,7 @@ struct device;
>  
>  enum led_brightness {
>  	LED_OFF		= 0,
> +	LED_ON		= 1,
>  	LED_HALF	= 127,
>  	LED_FULL	= 255,
>  };
> 

-- 
Best regards,
Jacek Anaszewski
