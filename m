From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFC v10 06/19] mfd: max77693: modifications around
 max77693_led_platform_data
Date: Tue, 20 Jan 2015 11:15:55 +0000
Message-ID: <20150120111555.GE13701@x1>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
 <1420816989-1808-7-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420816989-1808-7-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Fri, 09 Jan 2015, Jacek Anaszewski wrote:

> 1. Rename max77693_led_platform_data to max77693_led_config_data to
>    avoid making impression that the led driver expects a board file -
>    it relies on Device Tree data.
> 2. Remove fleds array, as the DT binding design has changed
> 3. Add "label" array for Device Tree strings with the name of a LED d=
evice
> 4. Make flash_timeout a two element array, for caching the sub-led
>    related flash timeout.
> 5. Remove trigger array as the related data will not be provided
>    in the DT binding

Code looks fine, and I'm sure you've tested this thoroughly.

I'm slightly concerned about current users though.  Are there any?  Is
this patch-set fully bisectable?

> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/mfd/max77693.h |    9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max7769=
3.h
> index f0b6585..c1ccb13 100644
> --- a/include/linux/mfd/max77693.h
> +++ b/include/linux/mfd/max77693.h
> @@ -87,17 +87,16 @@ enum max77693_led_boost_mode {
>  	MAX77693_LED_BOOST_FIXED,
>  };
> =20
> -struct max77693_led_platform_data {
> -	u32 fleds[2];
> +struct max77693_led_config_data {
> +	const char *label[2];
>  	u32 iout_torch[2];
>  	u32 iout_flash[2];
> -	u32 trigger[2];
> -	u32 trigger_type[2];
> +	u32 flash_timeout[2];
>  	u32 num_leds;
>  	u32 boost_mode;
> -	u32 flash_timeout;
>  	u32 boost_vout;
>  	u32 low_vsys;
> +	u32 trigger_type;
>  };
> =20
>  /* MAX77693 */

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
