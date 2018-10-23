From: Liviu Dudau <liviu@dudau.co.uk>
Subject: Re: [PATCH] leds: gpio: set led_dat->gpiod pointer for OF defined
 GPIO leds
Date: Tue, 23 Oct 2018 12:18:44 +0100
Message-ID: <20181023111842.GA29083@bart.dudau.co.uk>
References: <20181018001432.710-1-liviu@dudau.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181018001432.710-1-liviu@dudau.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Oct 18, 2018 at 01:14:32AM +0100, Liviu Dudau wrote:
> Commit 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> removed the common code path that set the led_dat->gpiod pointer in
> create_gpio_led(), but only added it back for the devices that have
> a valid gpio_led_platform_data structure. Calling gpio_leds_create()
> in gpio_led_probe() is not enough to get a valid gpiod pointer.
> 
> Fortunately enough, gpio_leds_create() already gets the needed pointer,
> we just need to assign it to the relevant gpio_led_data structure.
> 
> Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
> ---

Gentle ping! I haven't seen any reply to this, even if the commit it fixes is
still in for-next branch.

Best regards,
Liviu

> 
> Hi,
> 
> I found this issue while testing linux-next-20181017, I don't know how
> stable the leds for-next tree is in terms of commit IDs, if that gets
> rebased then the Fixes commit ID needs updating.
> 
> Best regards,
> Liviu
> 
>  drivers/leds/leds-gpio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 32fa752565bc..45e012093865 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -163,6 +163,8 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>  			return ERR_CAST(led.gpiod);
>  		}
>  
> +		led_dat->gpiod = led.gpiod;
> +
>  		fwnode_property_read_string(child, "linux,default-trigger",
>  					    &led.default_trigger);
>  
> -- 
> 2.19.0
> 

-- 
             /`\
            / : |
   _.._     | '/
 /`    \    | /
|  .-._ '-"` (
|_/   /   o  o\
      |  == () ==
       \   -- /                       ______________________________________
       / ---<_              ________|                                      |_______
      |      \\             \       |  I would like to fix the world but   |      /
      | |     \\__           \      |   no one gives me the source code.   |     /
      / ;     |.__)          /      |______________________________________|     \
     (_/.-.   ;             /__________)                                (_________\
    { `|   \_/
     '-\   / |
        | /  |
       /  \  '-.
       \__|-----'
