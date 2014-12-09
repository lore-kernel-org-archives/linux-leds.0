From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v9 04/19] mfd: max77693: adjust
 max77693_led_platform_data
Date: Tue, 9 Dec 2014 08:50:47 +0000
Message-ID: <20141209085047.GR3951@x1>
References: <1417622814-10845-1-git-send-email-j.anaszewski@samsung.com>
 <1417622814-10845-5-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417622814-10845-5-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-leds@vger.kernel.org

On Wed, 03 Dec 2014, Jacek Anaszewski wrote:

> Add "label" array for Device Tree strings with the name of a LED devi=
ce
> and make flash_timeout a two element array, for caching the sub-led
> related flash timeout. Added is also an array for caching pointers to=
 the
> sub-nodes representing sub-leds.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/mfd/max77693.h |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max7769=
3.h
> index f0b6585..c80ee99 100644
> --- a/include/linux/mfd/max77693.h
> +++ b/include/linux/mfd/max77693.h
> @@ -88,16 +88,18 @@ enum max77693_led_boost_mode {
>  };
> =20
>  struct max77693_led_platform_data {
> +	const char *label[2];
>  	u32 fleds[2];
>  	u32 iout_torch[2];
>  	u32 iout_flash[2];
>  	u32 trigger[2];
>  	u32 trigger_type[2];
> +	u32 flash_timeout[2];
>  	u32 num_leds;
>  	u32 boost_mode;
> -	u32 flash_timeout;
>  	u32 boost_vout;
>  	u32 low_vsys;
> +	struct device_node *sub_nodes[2];

I haven't seen anyone do this before.  Why can't you use the provided
OF functions to traverse through your tree?

>  };
> =20
>  /* MAX77693 */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
