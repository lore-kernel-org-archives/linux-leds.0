From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: gpio: Drop unneeded manual of_node assignment
Date: Sat, 8 Dec 2018 19:02:42 +0100
Message-ID: <0e918f62-a210-bcba-416a-db2178eade08@gmail.com>
References: <1544177406-24752-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544177406-24752-1-git-send-email-krzk@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Krzysztof,

Thank you for the patch.

On 12/7/18 11:10 AM, Krzysztof Kozlowski wrote:
> This reverts the main change of commit bff23714bc36 ("leds: leds-gpio:
> Set of_node for created LED devices") because of_node assignment is
> handled by core since commit 7ea79ae86c28 ("leds: gpio: use OF variant
> of LED registering function").  Basically the code was overwriting the
> of_node with same value.
> 
> No functional change expected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/leds/leds-gpio.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 45e012093865..998f2ff6914d 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -190,7 +190,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>   			fwnode_handle_put(child);
>   			return ERR_PTR(ret);
>   		}
> -		led_dat->cdev.dev->of_node = np;
>   		priv->num_leds++;
>   	}
>   
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
