From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFC v3 3/5] leds: Add support for max77693 mfd flash cell
Date: Wed, 16 Apr 2014 11:35:40 +0100
Message-ID: <20140416103540.GM4754@lee--X1>
References: <1397228216-6657-1-git-send-email-j.anaszewski@samsung.com>
 <1397228216-6657-4-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397228216-6657-4-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, SangYoung Son <hello.son-T5JinQjy6aBBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

> This patch adds led-flash support to Maxim max77693 chipset.
> A device can be exposed to user space through LED subsystem
> sysfs interface or through V4L2 subdevice when the support
> for V4L2 Flash sub-devices is enabled. Device supports up to
> two leds which can work in flash and torch mode. Leds can
> be triggered externally or by software.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> Cc: SangYoung Son <hello.son-T5JinQjy6aBBDgjK7y7TUQ@public.gmane.org>
> Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/leds/Kconfig         |   10 +
>  drivers/leds/Makefile        |    1 +
>  drivers/leds/leds-max77693.c |  794 ++++++++++++++++++++++++++++++++=
++++++++++
>  drivers/mfd/max77693.c       |    2 +-
>  include/linux/mfd/max77693.h |   38 ++
>  5 files changed, 844 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/leds/leds-max77693.c

[...]

> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index c5535f0..f061aa8 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -44,7 +44,7 @@
>  static const struct mfd_cell max77693_devs[] =3D {
>  	{ .name =3D "max77693-pmic", },
>  	{ .name =3D "max77693-charger", },
> -	{ .name =3D "max77693-flash", },
> +	{ .name =3D "max77693-flash", .of_compatible =3D "maxim,max77693-fl=
ash", },

I would prefer for this to be opened up i.e. not on one line.

>  	{ .name =3D "max77693-muic", },
>  	{ .name =3D "max77693-haptic", },
>  };
> diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max7769=
3.h
> index 3f3dc45..f2285b7 100644
> --- a/include/linux/mfd/max77693.h
> +++ b/include/linux/mfd/max77693.h
> @@ -63,6 +63,43 @@ struct max77693_muic_platform_data {
>  	int path_uart;
>  };
> =20
> +/* MAX77693 led flash */
> +
> +/* triggers */
> +enum max77693_led_trigger {
> +	MAX77693_LED_TRIG_OFF,
> +	MAX77693_LED_TRIG_FLASH,
> +	MAX77693_LED_TRIG_TORCH,
> +	MAX77693_LED_TRIG_EXT,
> +	MAX77693_LED_TRIG_SOFT,
> +};
> +
> +

Extra '\n' here.

> +/* trigger types */
> +enum max77693_led_trigger_type {
> +	MAX77693_LED_TRIG_TYPE_EDGE,
> +	MAX77693_LED_TRIG_TYPE_LEVEL,
> +};
> +
> +/* boost modes */
> +enum max77693_led_boost_mode {
> +	MAX77693_LED_BOOST_NONE,
> +	MAX77693_LED_BOOST_ADAPTIVE,
> +	MAX77693_LED_BOOST_FIXED,
> +};
> +
> +struct max77693_led_platform_data {
> +	u32 iout[4];
> +	u32 trigger[4];
> +	u32 trigger_type[2];
> +	u32 timeout[2];
> +	u32 boost_mode[2];
> +	u32 boost_vout;
> +	u32 low_vsys;
> +};

Bryan will have to review this.

> +/* MAX77693 */
> +
>  struct max77693_platform_data {
>  	/* regulator data */
>  	struct max77693_regulator_data *regulators;
> @@ -70,5 +107,6 @@ struct max77693_platform_data {
> =20
>  	/* muic data */
>  	struct max77693_muic_platform_data *muic_data;
> +	struct max77693_led_platform_data *led_data;
>  };
>  #endif	/* __LINUX_MFD_MAX77693_H */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
