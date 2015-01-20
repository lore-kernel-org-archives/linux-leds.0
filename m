From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFC v10 05/19] mfd: max77693: Modify flash cell name
 identifiers
Date: Tue, 20 Jan 2015 11:13:46 +0000
Message-ID: <20150120111346.GD13701@x1>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
 <1420816989-1808-6-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420816989-1808-6-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, 09 Jan 2015, Jacek Anaszewski wrote:

> Change flash cell identifiers from max77693-flash to max77693-led
> to avoid confusion with NOR/NAND Flash.

This is okay by me, but aren't these ABI yet?

> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/max77693.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index a159593..cb14afa 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -53,8 +53,8 @@ static const struct mfd_cell max77693_devs[] =3D {
>  		.of_compatible =3D "maxim,max77693-haptic",
>  	},
>  	{
> -		.name =3D "max77693-flash",
> -		.of_compatible =3D "maxim,max77693-flash",
> +		.name =3D "max77693-led",
> +		.of_compatible =3D "maxim,max77693-led",
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
