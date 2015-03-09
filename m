From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v12 05/19] mfd: max77693: Modify flash cell name
 identifiers
Date: Mon, 9 Mar 2015 09:36:33 +0000
Message-ID: <20150309093633.GI3427@x1>
References: <1425485680-8417-1-git-send-email-j.anaszewski@samsung.com>
 <1425485680-8417-6-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425485680-8417-6-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com
List-Id: linux-leds@vger.kernel.org

On Wed, 04 Mar 2015, Jacek Anaszewski wrote:

> Change flash cell identifiers from max77693-flash to max77693-led
> to avoid confusion with NOR/NAND Flash.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/max77693.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

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
