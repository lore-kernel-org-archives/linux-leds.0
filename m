From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH][resend] leds-gpio: of: led should not be created if its
 status is disabled
Date: Wed, 2 Oct 2013 14:14:22 -0700
Message-ID: <CAK5ve-K6wcVPxND8LGHki3ybLYVWEapmkRUfR=N6YH=i4Bssfw@mail.gmail.com>
References: <1380194876-25821-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380194876-25821-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Thu, Sep 26, 2013 at 4:27 AM, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> now the leds-gpio driver will create every child led node without
> checking the status is disabled or not.
>
> for example, if we have a led node like d3, and its status is disabled:
>         leds {
>                 d3 {
>                         label = "d3";
>                         gpios = <&pioE 24 0>;
>                         status = "disabled";
>                 };
>         };
>
> we except the d3 should not be created. And the gpios should not be
> request as well.
>
> But current driver will create d3 and request its gpio.
>
> This patch fix this by using for_each_available_child_of_node() and
> of_get_available_child_count() to enumerate all child nodes. So the
> disabled node will be inavailable.
>
Applied to -devel branch of my tree,
Thanks,
-Bryan


> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
> resend this patch based on the patch:
>  - http://www.spinics.net/lists/devicetree/msg05903.html
>
>  drivers/leds/leds-gpio.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index e8b01e5..62bfc3a 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -170,11 +170,11 @@ static struct gpio_leds_priv *gpio_leds_create_of(struct platform_device *pdev)
>         int count, ret;
>
>         /* count LEDs in this device, so we know how much to allocate */
> -       count = of_get_child_count(np);
> +       count = of_get_available_child_count(np);
>         if (!count)
>                 return ERR_PTR(-ENODEV);
>
> -       for_each_child_of_node(np, child)
> +       for_each_available_child_of_node(np, child)
>                 if (of_get_gpio(child, 0) == -EPROBE_DEFER)
>                         return ERR_PTR(-EPROBE_DEFER);
>
> @@ -183,7 +183,7 @@ static struct gpio_leds_priv *gpio_leds_create_of(struct platform_device *pdev)
>         if (!priv)
>                 return ERR_PTR(-ENOMEM);
>
> -       for_each_child_of_node(np, child) {
> +       for_each_available_child_of_node(np, child) {
>                 struct gpio_led led = {};
>                 enum of_gpio_flags flags;
>                 const char *state;
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
