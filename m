From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: max77693: improve support for the flash cell
Date: Fri, 22 Aug 2014 10:30:17 +0100
Message-ID: <20140822093017.GU4266@lee--X1>
References: <1408698378-25181-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qa0-f41.google.com ([209.85.216.41]:58808 "EHLO
	mail-qa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751207AbaHVJaX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Aug 2014 05:30:23 -0400
Received: by mail-qa0-f41.google.com with SMTP id j7so9539591qaq.28
        for <linux-leds@vger.kernel.org>; Fri, 22 Aug 2014 02:30:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1408698378-25181-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, SangYoung Son <hello.son@smasung.com>, Samuel Ortiz <sameo@linux.intel.com>

On Fri, 22 Aug 2014, Jacek Anaszewski wrote:

> This patch improves support for the flash cell of
> max77693 mfd by adding relevant of_compatible field
> and a structure for caching related platform data.
> Added are also FLASH registers related macro definitions.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: SangYoung Son <hello.son@smasung.com>
> Cc: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  drivers/mfd/max77693.c               |    5 ++-
>  include/linux/mfd/max77693-private.h |   59 ++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/max77693.h         |   40 +++++++++++++++++++++++
>  3 files changed, 103 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index 249c139..cf008f4 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -44,9 +44,12 @@
>  static const struct mfd_cell max77693_devs[] =3D {
>  	{ .name =3D "max77693-pmic", },
>  	{ .name =3D "max77693-charger", },
> -	{ .name =3D "max77693-flash", },
>  	{ .name =3D "max77693-muic", },
>  	{ .name =3D "max77693-haptic", },
> +	{
> +		.name =3D "max77693-flash",
> +		.of_compatible =3D "maxim,max77693-flash",
> +	},
>  };
> =20
>  static const struct regmap_config max77693_regmap_config =3D {
> diff --git a/include/linux/mfd/max77693-private.h b/include/linux/mfd=
/max77693-private.h
> index 615f121..de06377 100644
> --- a/include/linux/mfd/max77693-private.h
> +++ b/include/linux/mfd/max77693-private.h
> @@ -85,6 +85,65 @@ enum max77693_pmic_reg {
>  	MAX77693_PMIC_REG_END,
>  };
> =20
> +/* MAX77693 ITORCH register */
> +#define TORCH_IOUT1_SHIFT	0
> +#define TORCH_IOUT2_SHIFT	4
> +#define TORCH_IOUT_MIN		15625
> +#define TORCH_IOUT_MAX		250000
> +#define TORCH_IOUT_STEP		15625
> +
> +/* MAX77693 IFLASH1 and IFLASH2 registers */
> +#define FLASH_IOUT_MIN		15625
> +#define FLASH_IOUT_MAX_1LED	1000000
> +#define FLASH_IOUT_MAX_2LEDS	625000
> +#define FLASH_IOUT_STEP		15625
> +
> +/* MAX77693 TORCH_TIMER register */
> +#define TORCH_TMR_NO_TIMER	0x40
> +#define TORCH_TIMEOUT_MIN	262000
> +#define TORCH_TIMEOUT_MAX	15728000
> +
> +/* MAX77693 FLASH_TIMER register */
> +#define FLASH_TMR_LEVEL		0x80
> +#define FLASH_TIMEOUT_MIN	62500
> +#define FLASH_TIMEOUT_MAX	1000000
> +#define FLASH_TIMEOUT_STEP	62500
> +
> +/* MAX77693 FLASH_EN register */
> +#define FLASH_EN_OFF		0x0
> +#define FLASH_EN_FLASH		0x1
> +#define FLASH_EN_TORCH		0x2
> +#define FLASH_EN_ON		0x3
> +#define FLASH_EN_SHIFT(x)	(6 - ((x) - 1) * 2)
> +#define TORCH_EN_SHIFT(x)	(2 - ((x) - 1) * 2)
> +
> +/* MAX77693 MAX_FLASH1 register */
> +#define MAX_FLASH1_MAX_FL_EN	0x80
> +#define MAX_FLASH1_VSYS_MIN	2400
> +#define MAX_FLASH1_VSYS_MAX	3400
> +#define MAX_FLASH1_VSYS_STEP	33
> +
> +/* MAX77693 VOUT_CNTL register */
> +#define FLASH_BOOST_FIXED	0x04
> +#define FLASH_BOOST_LEDNUM_2	0x80
> +
> +/* MAX77693 VOUT_FLASH1 register */
> +#define FLASH_VOUT_MIN		3300
> +#define FLASH_VOUT_MAX		5500
> +#define FLASH_VOUT_STEP		25
> +#define FLASH_VOUT_RMIN		0x0c
> +
> +/* MAX77693 FLASH_STATUS register */
> +#define FLASH_STATUS_FLASH_ON	BIT(3)
> +#define FLASH_STATUS_TORCH_ON	BIT(2)
> +
> +/* MAX77693 FLASH_INT register */
> +#define FLASH_INT_FLED2_OPEN	BIT(0)
> +#define FLASH_INT_FLED2_SHORT	BIT(1)
> +#define FLASH_INT_FLED1_OPEN	BIT(2)
> +#define FLASH_INT_FLED1_SHORT	BIT(3)
> +#define FLASH_INT_OVER_CURRENT	BIT(4)
> +
>  /* MAX77693 CHG_CNFG_00 register */
>  #define CHG_CNFG_00_CHG_MASK		0x1
>  #define CHG_CNFG_00_BUCK_MASK		0x4
> diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max7769=
3.h
> index 3f3dc45..f0b6585 100644
> --- a/include/linux/mfd/max77693.h
> +++ b/include/linux/mfd/max77693.h
> @@ -63,6 +63,45 @@ struct max77693_muic_platform_data {
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
> +	u32 fleds[2];
> +	u32 iout_torch[2];
> +	u32 iout_flash[2];
> +	u32 trigger[2];
> +	u32 trigger_type[2];
> +	u32 num_leds;
> +	u32 boost_mode;
> +	u32 flash_timeout;
> +	u32 boost_vout;
> +	u32 low_vsys;
> +};
> +
> +/* MAX77693 */
> +
>  struct max77693_platform_data {
>  	/* regulator data */
>  	struct max77693_regulator_data *regulators;
> @@ -70,5 +109,6 @@ struct max77693_platform_data {
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
