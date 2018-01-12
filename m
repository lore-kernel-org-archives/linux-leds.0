From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] backlight: pwm_bl: compute brightness of LED linearly
 to human eye.
Date: Fri, 12 Jan 2018 11:14:54 +0100
Message-ID: <CAFqH_50zs+TMZaRNegxYPQOcysvwm9EY5iB8DqNeGYN+QaJP6Q@mail.gmail.com>
References: <20180110223046.17696-1-enric.balletbo@collabora.com> <20180110223046.17696-4-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110223046.17696-4-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

2018-01-10 23:30 GMT+01:00 Enric Balletbo i Serra
<enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>:
> When you want to change the brightness using a PWM signal, one thing you
> need to consider is how human perceive the brightness. Human perceive
> the brightness change non-linearly, we have better sensitivity at low
> luminance than high luminance, so to achieve perceived linear dimming,
> the brightness must be matches to the way our eyes behave. The CIE 1931
> lightness formula is what actually describes how we perceive light.
>
> This patch computes a default table with the brightness levels filled
> with the numbers provided by the CIE 1931 algorithm, the number of the
> brightness levels is calculated based on the PWM resolution.
>
> The calculation of the table using the CIE 1931 algorithm is enabled by
> default when you do not define the 'brightness-levels' propriety in your
> device tree.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
> Changes since RFCv2:
> - Pre-compute the table at boot using the cie 1931 algorithm, this
>   introduced again the fixed point calculations that needs to be
>   reviewed.
> - Calculate the number of needed steps based on the number of bits of
>   the PWM.
> - Improve some code documentation.
>
> Changes since RFCv1:
> - Get rid of fixed point calculations and use a table instead.
>
>  drivers/video/backlight/pwm_bl.c | 149 +++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 136 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/p=
wm_bl.c
> index eabe0a4462af..9398516db0ce 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -143,6 +143,107 @@ static const struct backlight_ops pwm_backlight_ops=
 =3D {
>  };
>
>  #ifdef CONFIG_OF
> +#define PWM_LUMINANCE_SCALE    10000 /* luminance scale */
> +
> +/* An integer based power function */
> +static u64 int_pow(u64 base, int exp)
> +{
> +       u64 result =3D 1;
> +
> +       while (exp) {
> +               if (exp & 1)
> +                       result *=3D base;
> +               exp >>=3D 1;
> +               base *=3D base;
> +       }
> +
> +       return result;
> +}
> +
> +/*
> + * CIE lightness to PWM conversion.
> + *
> + * The CIE 1931 lightness formula is what actually describes how we perc=
eive
> + * light:
> + *          Y =3D (L* / 902.3)           if L* =E2=89=A4 0.08856
> + *          Y =3D ((L* + 16) / 116)^3    if L* > 0.08856
> + *
> + * Where Y is the luminance, the amount of light coming out of the scree=
n, and
> + * is a number between 0.0 and 1.0; and L* is the lightness, how bright =
a human
> + * perceives the screen to be, and is a number between 0 and 100.
> + *
> + * The following function does the fixed point maths needed to implement=
 the
> + * above formula.
> + */
> +static u64 cie1931(unsigned int lightness, unsigned int scale)
> +{
> +       u64 retval;
> +
> +       lightness *=3D 100;
> +       if (lightness <=3D (8 * scale)) {
> +               retval =3D DIV_ROUND_CLOSEST_ULL(lightness * 10, 9023);
> +       } else {
> +               retval =3D int_pow((lightness + (16 * scale)) / 116, 3);
> +               retval =3D DIV_ROUND_CLOSEST_ULL(retval, (scale * scale))=
;
> +       }
> +
> +       return retval;
> +}
> +
> +/*
> + * Create a default correction table for PWM values to create linear bri=
ghtness
> + * for LED based backlights using the CIE1931 algorithm.
> + */
> +static
> +int pwm_backlight_brightness_default(struct device *dev,
> +                                    struct platform_pwm_backlight_data *=
data,
> +                                    unsigned int period)
> +{
> +       unsigned int counter =3D 0;
> +       unsigned int i, n;
> +       u64 retval;
> +
> +       /*
> +        * Count the number of bits needed to represent the period number=
. The
> +        * number of bits is used to calculate the number of levels used =
for the
> +        * brightness-levels table, the purpose of this calculation is ha=
ve a
> +        * pre-computed table with enough levels to get linear brightness
> +        * perception. The period is divided by the number of bits so for=
 a
> +        * 8-bit PWM we have 255 / 8 =3D 32 brightness levels or for a 16=
-bit PWM
> +        * we have 65535 / 16 =3D 4096 brightness levels.
> +        *
> +        * Note that this method is based on empirical testing on differe=
nt
> +        * devices with PWM of 8 and 16 bits of resolution.
> +        */
> +       n =3D period;
> +       while (n) {
> +               counter +=3D n % 2;
> +               n >>=3D 1;
> +       }
> +
> +       data->max_brightness =3D DIV_ROUND_UP(period, counter);
> +       data->levels =3D devm_kcalloc(dev, data->max_brightness,
> +                                   sizeof(*data->levels), GFP_KERNEL);
> +       if (!data->levels)
> +               return -ENOMEM;
> +
> +       /* Fill the table using the cie1931 algorithm */
> +       for (i =3D 0; i < data->max_brightness; i++) {
> +               retval =3D cie1931((i * PWM_LUMINANCE_SCALE) /
> +                                data->max_brightness, PWM_LUMINANCE_SCAL=
E) *
> +                                period;
> +               retval =3D DIV_ROUND_CLOSEST_ULL(retval, PWM_LUMINANCE_SC=
ALE);
> +               if (retval > UINT_MAX)
> +                       return -EINVAL;
> +               data->levels[i] =3D (unsigned int)retval;
> +       }
> +
> +       data->dft_brightness =3D data->max_brightness / 2;
> +       data->max_brightness--;
> +
> +       return 0;
> +}
> +
>  static int pwm_backlight_parse_dt(struct device *dev,
>                                   struct platform_pwm_backlight_data *dat=
a)
>  {
> @@ -161,10 +262,13 @@ static int pwm_backlight_parse_dt(struct device *de=
v,
>
>         memset(data, 0, sizeof(*data));
>
> -       /* determine the number of brightness levels */
> +       /*
> +        * Determine the number of brightness levels, if this property is=
 not
> +        * set a default table of brightness levels will be used.
> +        */
>         prop =3D of_find_property(node, "brightness-levels", &length);
>         if (!prop)
> -               return -EINVAL;
> +               return 0;
>
>         data->max_brightness =3D length / sizeof(u32);
>
> @@ -299,6 +403,14 @@ static int pwm_backlight_parse_dt(struct device *dev=
,
>  {
>         return -ENODEV;
>  }
> +
> +static
> +int pwm_backlight_brightness_default(struct device *dev,
> +                                    struct platform_pwm_backlight_data *=
data,
> +                                    unsigned int period)
> +{
> +       return -ENODEV;
> +}
>  #endif
>
>  static int pwm_backlight_initial_power_state(const struct pwm_bl_data *p=
b)
> @@ -339,7 +451,9 @@ static int pwm_backlight_probe(struct platform_device=
 *pdev)
>         struct backlight_device *bl;
>         struct device_node *node =3D pdev->dev.of_node;
>         struct pwm_bl_data *pb;
> +       struct pwm_state state;
>         struct pwm_args pargs;
> +       unsigned int i;
>         int ret;
>
>         if (!data) {
> @@ -364,17 +478,6 @@ static int pwm_backlight_probe(struct platform_devic=
e *pdev)
>                 goto err_alloc;
>         }
>
> -       if (data->levels) {
> -               unsigned int i;
> -
> -               for (i =3D 0; i <=3D data->max_brightness; i++)
> -                       if (data->levels[i] > pb->scale)
> -                               pb->scale =3D data->levels[i];
> -
> -               pb->levels =3D data->levels;
> -       } else
> -               pb->scale =3D data->max_brightness;
> -
>         pb->notify =3D data->notify;
>         pb->notify_after =3D data->notify_after;
>         pb->check_fb =3D data->check_fb;
> @@ -441,6 +544,26 @@ static int pwm_backlight_probe(struct platform_devic=
e *pdev)
>
>         dev_dbg(&pdev->dev, "got pwm for backlight\n");
>
> +       if (!data->levels) {
> +               /* Get the PWM period (in nanoseconds) */
> +               pwm_get_state(pb->pwm, &state);
> +
> +               ret =3D pwm_backlight_brightness_default(&pdev->dev, data=
,
> +                                                      state.period);
> +               if (ret < 0) {
> +                       dev_err(&pdev->dev,
> +                               "failed to setup default brightness table=
\n");
> +                       goto err_alloc;
> +               }
> +       }
> +
> +       for (i =3D 0; i <=3D data->max_brightness; i++)

Oops, horrible and unjustifiable mistake, missing { here :/

> +               if (data->levels[i] > pb->scale)
> +                       pb->scale =3D data->levels[i];
> +
> +               pb->levels =3D data->levels;
> +       }
> +
>         /*
>          * FIXME: pwm_apply_args() should be removed when switching to
>          * the atomic PWM API.
> --
> 2.15.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
