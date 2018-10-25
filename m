From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: gpio: Fix gpiod for DT based devices
Date: Thu, 25 Oct 2018 21:22:34 +0200
Message-ID: <05996b8d-f35c-d2d6-3043-75456fbfe0fa@gmail.com>
References: <CACceFXdF9XQS6WeSWvO=EKUEGnKwG_VkqUOECA3kJY-Hy72fjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACceFXdF9XQS6WeSWvO=EKUEGnKwG_VkqUOECA3kJY-Hy72fjQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Sneddon <dan.sneddon@gmail.com>, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch. Nonetheless, I've just applied similar Liviu's
patch [0], since it arrived one week ago already.

I'll send it upstream with LED fixes for 4-20-rc2.

[0] https://lkml.org/lkml/2018/10/18/154

Best regards,
Jacek Anaszewski

On 10/25/2018 05:06 PM, Dan Sneddon wrote:
> commit 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> failes to set the gpio descriptor for DT based machines.  Since the
> value being passed in is always 0 the descriptor fails the validation
> check but does so silently.  This means the driver probes successfully
> even though it can't actually control the gpio line.  This patch sets
> the gpio descriptor in the path taken by DT based devices.
> 
> Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> Signed-off-by: Dan Sneddon <dan.sneddon@gmail.com>
> ---
>  drivers/leds/leds-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 32fa752..e0e57c2 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -162,6 +162,7 @@ static struct gpio_leds_priv
> *gpio_leds_create(struct platform_device *pdev)
>             fwnode_handle_put(child);
>             return ERR_CAST(led.gpiod);
>         }
> +       led_dat->gpiod = led.gpiod;
> 
>         fwnode_property_read_string(child, "linux,default-trigger",
>                         &led.default_trigger);
> 
