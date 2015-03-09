From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v12 08/19] mfd: max77693: Adjust FLASH_EN_SHIFT and
 TORCH_EN_SHIFT macros
Date: Mon, 9 Mar 2015 09:35:16 +0000
Message-ID: <20150309093516.GF3427@x1>
References: <1425485680-8417-1-git-send-email-j.anaszewski@samsung.com>
 <1425485680-8417-9-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:42738 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753789AbbCIJfV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2015 05:35:21 -0400
Received: by wesq59 with SMTP id q59so16117346wes.9
        for <linux-leds@vger.kernel.org>; Mon, 09 Mar 2015 02:35:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1425485680-8417-9-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, 04 Mar 2015, Jacek Anaszewski wrote:

> Modify FLASH_EN_SHIFT and TORCH_EN_SHIFT macros to work properly
> when passed enum max77693_fled values (0 for FLED1 and 1 for FLED2)
> from leds-max77693 driver. Previous definitions were compatible with
> one of the previous RFC versions of leds-max77693.c driver, which was
> not merged.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/mfd/max77693-private.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/include/linux/mfd/max77693-private.h b/include/linux/mfd=
/max77693-private.h
> index 8770ce1..51633ea 100644
> --- a/include/linux/mfd/max77693-private.h
> +++ b/include/linux/mfd/max77693-private.h
> @@ -114,8 +114,8 @@ enum max77693_pmic_reg {
>  #define FLASH_EN_FLASH		0x1
>  #define FLASH_EN_TORCH		0x2
>  #define FLASH_EN_ON		0x3
> -#define FLASH_EN_SHIFT(x)	(6 - ((x) - 1) * 2)
> -#define TORCH_EN_SHIFT(x)	(2 - ((x) - 1) * 2)
> +#define FLASH_EN_SHIFT(x)	(6 - (x) * 2)
> +#define TORCH_EN_SHIFT(x)	(2 - (x) * 2)
> =20
>  /* MAX77693 MAX_FLASH1 register */
>  #define MAX_FLASH1_MAX_FL_EN	0x80

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
