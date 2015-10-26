From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/3] mfd: rt5033: Add RT5033 Flash led sub device
Date: Mon, 26 Oct 2015 08:18:40 +0000
Message-ID: <20151026081840.GD597@x1>
References: <1445579285-6866-1-git-send-email-ingi2.kim@samsung.com>
 <1445579285-6866-3-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:34648 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753316AbbJZISo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 26 Oct 2015 04:18:44 -0400
Received: by wikq8 with SMTP id q8so152595173wik.1
        for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2015 01:18:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1445579285-6866-3-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Fri, 23 Oct 2015, Ingi Kim wrote:

> This patch adds rt5033-led sub device to support it.
>=20
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/rt5033.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

> diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
> index d60f916..035421c 100644
> --- a/drivers/mfd/rt5033.c
> +++ b/drivers/mfd/rt5033.c
> @@ -47,6 +47,9 @@ static const struct mfd_cell rt5033_devs[] =3D {
>  	}, {
>  		.name =3D "rt5033-battery",
>  		.of_compatible =3D "richtek,rt5033-battery",
> +	}, {
> +		.name =3D "rt5033-led",
> +		.of_compatible =3D "richtek,rt5033-led",
>  	},
>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
