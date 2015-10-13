From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] mfd: rt5033: Add RT5033 Flash led sub device
Date: Tue, 13 Oct 2015 08:06:10 +0100
Message-ID: <20151013070610.GO17172@x1>
References: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
 <1444655578-19806-3-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444655578-19806-3-git-send-email-ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Mon, 12 Oct 2015, Ingi Kim wrote:

> This patch adds rt5033-led sub device to support it.
>=20
> Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/mfd/rt5033.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
> index d60f916..b7f374b 100644
> --- a/drivers/mfd/rt5033.c
> +++ b/drivers/mfd/rt5033.c
> @@ -40,13 +40,17 @@ static const struct regmap_irq_chip rt5033_irq_ch=
ip =3D {
>  };
> =20
>  static const struct mfd_cell rt5033_devs[] =3D {
> -	{ .name =3D "rt5033-regulator", },
>  	{
> +		.name =3D "rt5033-regulator",
> +	}, {

There's no need for this change.  Please remove it.

>  		.name =3D "rt5033-charger",
>  		.of_compatible =3D "richtek,rt5033-charger",
>  	}, {
>  		.name =3D "rt5033-battery",
>  		.of_compatible =3D "richtek,rt5033-battery",
> +	}, {
> +		.name =3D "rt5033-led",
> +		.of_compatible =3D "richtek,rt5033-led",

=46or when you resubmit with the hunk above removed:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>  	},
>  };
> =20

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
