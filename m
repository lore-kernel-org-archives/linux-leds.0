From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] leds-pwm: the startup brightness can be specified
Date: Thu, 9 Feb 2017 22:31:10 +0100
Message-ID: <c4aebca4-d5a1-aaa7-d69b-8d0e4d4d8ba8@gmail.com>
References: <aed1129a-993a-91d9-7b14-13c3424ee0f4@solutionsradio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <aed1129a-993a-91d9-7b14-13c3424ee0f4-Cb7RZHV19h6nMLx/lKYAZdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jelle Martijn Kok <jmkok-i3KCcyIX/XtmR6Xm/wNWPw@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Jelle,

Thanks for the patch.

On 02/09/2017 03:00 PM, Jelle Martijn Kok wrote:
> Upto now the leds-pwm are either on or off at startup. This allows the
> dts to specify the startup brightness
> 
> Signed-off-by: Jelle Martijn Kok <jmkok-i3KCcyIX/XtmR6Xm/wNWPw@public.gmane.org>
> ---
>  drivers/leds/leds-pwm.c  | 5 ++++-
>  include/linux/leds_pwm.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index a9145aa..4799f36 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -97,7 +97,7 @@ static int led_pwm_add(struct device *dev, struct
> led_pwm_priv *priv,
>      led_data->active_low = led->active_low;
>      led_data->cdev.name = led->name;
>      led_data->cdev.default_trigger = led->default_trigger;
> -    led_data->cdev.brightness = LED_OFF;
> +    led_data->cdev.brightness = led->default_brightness;
>      led_data->cdev.max_brightness = led->max_brightness;
>      led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
>  @@ -159,6 +159,9 @@ static int led_pwm_create_of(struct device *dev,
> struct led_pwm_priv *priv)
>          led.active_low = of_property_read_bool(child, "active-low");
>          of_property_read_u32(child, "max-brightness",
>                       &led.max_brightness);
> +        led.default_brightness = LED_OFF;
> +        of_property_read_u32(child, "brightness",
> +                     &led.default_brightness);

At first you would have to submit a patch for
Documentation/devicetree/bindings/leds/common.txt that would add
brightness property. The question is whether it is really needed?
You can set brightness from userspace via sysfs API.

By the way, I have a question to DT maintainers: is DT a proper
place for defining this type of configuration that can be set via
userspace scripts? Shouldn't DT describe only hardware properties and
constraints resulting from board configuration?

>           ret = led_pwm_add(dev, priv, &led, child);
>          if (ret) {
> diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
> index a65e964..7e70438 100644
> --- a/include/linux/leds_pwm.h
> +++ b/include/linux/leds_pwm.h
> @@ -11,6 +11,7 @@ struct led_pwm {
>      u8         active_low;
>      unsigned     max_brightness;
>      unsigned    pwm_period_ns;
> +    unsigned     default_brightness;
>  };
>   struct led_pwm_platform_data {

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
