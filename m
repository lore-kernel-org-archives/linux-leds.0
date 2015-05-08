From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: Add missing dummies for the unified device
 properties interface
Date: Fri, 8 May 2015 10:43:39 -0700
Message-ID: <CAK5ve-KX_LXxd07ifcTMhm3Qn=QkNK4pwq=hd6HV_wTQgF6X_A@mail.gmail.com>
References: <1430986090-7243-1-git-send-email-geert@linux-m68k.org> <1430986090-7243-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1430986090-7243-2-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Arnd Bergmann <arnd@arndb.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, May 7, 2015 at 1:08 AM, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> If GPIOLIB=3Dn:
>
>     drivers/leds/leds-gpio.c: In function =E2=80=98gpio_leds_create=E2=
=80=99:
>     drivers/leds/leds-gpio.c:187: error: implicit declaration of func=
tion =E2=80=98devm_get_gpiod_from_child=E2=80=99
>     drivers/leds/leds-gpio.c:187: warning: assignment makes pointer f=
rom integer without a cast
>
> Add dummies for fwnode_get_named_gpiod() and devm_get_gpiod_from_chil=
d()
> for the !GPIOLIB case to fix this.
>

Geert,

This patch looks good to me. Do you mind merging it through LED tree
with other 2 more LED patches?

Thanks,
-Bryan


> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 40b7318319281b1b ("gpio: Support for unified device properties=
 interface")
> ---
>  include/linux/gpio/consumer.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consu=
mer.h
> index 3a7c9ffd5ab930b4..da042657dc31d7f5 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -406,6 +406,21 @@ static inline int desc_to_gpio(const struct gpio=
_desc *desc)
>         return -EINVAL;
>  }
>
> +/* Child properties interface */
> +struct fwnode_handle;
> +
> +static inline struct gpio_desc *fwnode_get_named_gpiod(
> +       struct fwnode_handle *fwnode, const char *propname)
> +{
> +       return ERR_PTR(-ENOSYS);
> +}
> +
> +static inline struct gpio_desc *devm_get_gpiod_from_child(
> +       struct device *dev, const char *con_id, struct fwnode_handle =
*child)
> +{
> +       return ERR_PTR(-ENOSYS);
> +}
> +
>  #endif /* CONFIG_GPIOLIB */
>
>  /*
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
