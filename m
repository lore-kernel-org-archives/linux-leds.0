From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v12 06/19] mfd: max77693: Remove struct
 max77693_led_platform_data
Date: Mon, 9 Mar 2015 09:35:48 +0000
Message-ID: <20150309093548.GG3427@x1>
References: <1425485680-8417-1-git-send-email-j.anaszewski@samsung.com>
 <1425485680-8417-7-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:46593 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752208AbbCIJfx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2015 05:35:53 -0400
Received: by wggx12 with SMTP id x12so15915358wgg.13
        for <linux-leds@vger.kernel.org>; Mon, 09 Mar 2015 02:35:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1425485680-8417-7-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, 04 Mar 2015, Jacek Anaszewski wrote:

> The flash part of the max77693 device will depend only on OF, and thu=
s
> will not use board files. Since there are no other users of the
> struct max77693_led_platform_data its existence is unjustified.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/mfd/max77693.h |   13 -------------
>  1 file changed, 13 deletions(-)

Applied, thanks.

> diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max7769=
3.h
> index f0b6585..ce894b6 100644
> --- a/include/linux/mfd/max77693.h
> +++ b/include/linux/mfd/max77693.h
> @@ -87,19 +87,6 @@ enum max77693_led_boost_mode {
>  	MAX77693_LED_BOOST_FIXED,
>  };
> =20
> -struct max77693_led_platform_data {
> -	u32 fleds[2];
> -	u32 iout_torch[2];
> -	u32 iout_flash[2];
> -	u32 trigger[2];
> -	u32 trigger_type[2];
> -	u32 num_leds;
> -	u32 boost_mode;
> -	u32 flash_timeout;
> -	u32 boost_vout;
> -	u32 low_vsys;
> -};
> -
>  /* MAX77693 */
> =20
>  struct max77693_platform_data {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
