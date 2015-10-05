From: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Mon, 05 Oct 2015 19:36:52 +0900
Message-ID: <561252C4.7@samsung.com>
References: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com>
 <1443778875-18261-3-git-send-email-ingi2.kim@samsung.com>
 <20151005072129.GE3377@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20151005072129.GE3377@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hello Lee Jones,

Thanks for the review.
I'll try to divide this patch and change name and comment.
Then push ver2 patch soon.

On 2015=EB=85=84 10=EC=9B=94 05=EC=9D=BC 16:21, Lee Jones wrote:
> On Fri, 02 Oct 2015, Ingi Kim wrote:
>=20
>> This patch adds device driver of Richtek RT5033 PMIC.
>> The driver supports a current regulated output to drive
>> white LEDs for camera flash.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  drivers/leds/Kconfig               |   8 ++
>>  drivers/leds/Makefile              |   1 +
>>  drivers/leds/leds-rt5033.c         | 222 ++++++++++++++++++++++++++=
+++++++++++
>>  drivers/mfd/rt5033.c               |   3 +
>>  include/linux/mfd/rt5033-private.h |  67 +++++++++--
>>  include/linux/mfd/rt5033.h         |  27 ++++-
>=20
> Please pull the MFD changes out into to separate patch(es).
>=20
>>  6 files changed, 317 insertions(+), 11 deletions(-)
>>  create mode 100644 drivers/leds/leds-rt5033.c
>=20
> [...]
>=20
>> diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
>> index d60f916..035421c 100644
>> --- a/drivers/mfd/rt5033.c
>> +++ b/drivers/mfd/rt5033.c
>> @@ -47,6 +47,9 @@ static const struct mfd_cell rt5033_devs[] =3D {
>>  	}, {
>>  		.name =3D "rt5033-battery",
>>  		.of_compatible =3D "richtek,rt5033-battery",
>> +	}, {
>> +		.name =3D "rt5033-led",
>> +		.of_compatible =3D "richtek,rt5033-led",
>>  	},
>>  };
>=20
> Needs to be in a patch of its own.
>=20
>> diff --git a/include/linux/mfd/rt5033-private.h b/include/linux/mfd/=
rt5033-private.h
>> index 1b63fc2..21c3aff 100644
>> --- a/include/linux/mfd/rt5033-private.h
>> +++ b/include/linux/mfd/rt5033-private.h
>> @@ -25,15 +25,15 @@ enum rt5033_reg {
>>  	/* Reserved 0x09~0x18 */
>>  	RT5033_REG_RT_CTRL1		=3D 0x19,
>>  	/* Reserved 0x1A~0x20 */
>> -	RT5033_REG_FLED_FUNCTION1	=3D 0x21,
>> -	RT5033_REG_FLED_FUNCTION2	=3D 0x22,
>> -	RT5033_REG_FLED_STROBE_CTRL1	=3D 0x23,
>> -	RT5033_REG_FLED_STROBE_CTRL2	=3D 0x24,
>> -	RT5033_REG_FLED_CTRL1		=3D 0x25,
>> -	RT5033_REG_FLED_CTRL2		=3D 0x26,
>> -	RT5033_REG_FLED_CTRL3		=3D 0x27,
>> -	RT5033_REG_FLED_CTRL4		=3D 0x28,
>> -	RT5033_REG_FLED_CTRL5		=3D 0x29,
>> +	RT5033_REG_FL_FUNCTION1		=3D 0x21,
>> +	RT5033_REG_FL_FUNCTION2		=3D 0x22,
>> +	RT5033_REG_FL_STROBE_CTRL1	=3D 0x23,
>> +	RT5033_REG_FL_STROBE_CTRL2	=3D 0x24,
>> +	RT5033_REG_FL_CTRL1		=3D 0x25,
>> +	RT5033_REG_FL_CTRL2		=3D 0x26,
>> +	RT5033_REG_FL_CTRL3		=3D 0x27,
>> +	RT5033_REG_FL_CTRL4		=3D 0x28,
>> +	RT5033_REG_FL_CTRL5		=3D 0x29,
>=20
> Why this change?
>=20
> The previous naming convention was better.
>=20
>>  	/* Reserved 0x2A~0x40 */
>>  	RT5033_REG_CTRL			=3D 0x41,
>>  	RT5033_REG_BUCK_CTRL		=3D 0x42,
>> @@ -93,6 +93,55 @@ enum rt5033_reg {
>>  #define RT5033_RT_CTRL1_UUG_MASK	0x02
>>  #define RT5033_RT_HZ_MASK		0x01
>> =20
>> +/* RT5033 FLED Function1 register */
>> +#define RT5033_FL_FLED1_MASK		0x94
>> +#define RT5033_FL_STROBE_SEL		0x04
>> +#define RT5033_FL_PIN_CTRL		0x10
>> +#define RT5033_FL_RESET			0x80
>> +
>> +/* RT5033 FLED Function2 register */
>> +#define RT5033_FL_FLED2_MASK		0x81
>> +#define RT5033_FL_ENFLED		0x01
>> +#define RT5033_FL_SREG_STROBE		0x80
>> +
>> +/* RT5033 FLED Strobe Control1 */
>> +#define RT5033_FL_STRBCTRL1_MASK	0xFF
>> +#define RT5033_FL_STRBCTRL1_TM_CUR_MAX	0xE0
>> +#define RT5033_FL_STRBCTRL1_FL_CUR_DEF	0x0D
>> +#define RT5033_FL_STRBCTRL1_FL_CUR_MAX	0x1F
>> +
>> +/* RT5033 FLED Strobe Control2 */
>> +#define RT5033_FL_STRBCTRL2_MASK	0x3F
>> +#define RT5033_FL_STRBCTRL2_TM_DEF	0x0F
>> +#define RT5033_FL_STRBCTRL2_TM_MAX	0x3F
>> +
>> +/* RT5033 FLED Control1 */
>> +#define RT5033_FL_CTRL1_MASK		0xF7
>> +#define RT5033_FL_CTRL1_TORCH_CUR_DEF	0x20
>> +#define RT5033_FL_CTRL1_TORCH_CUR_MAX	0xF0
>> +#define RT5033_FL_CTRL1_LBP_DEF		0x02
>> +#define RT5033_FL_CTRL1_LBP_MAX		0x07
>> +
>> +/* RT5033 FLED Control2 */
>> +#define RT5033_FL_CTRL2_MASK		0xFF
>> +#define RT5033_FL_CTRL2_VMID_DEF	0x37
>> +#define RT5033_FL_CTRL2_VMID_MAX	0x3F
>> +#define RT5033_FL_CTRL2_TRACK_ALIVE	0x40
>> +#define RT5033_FL_CTRL2_MID_TRACK	0x80
>> +
>> +/* RT5033 FLED Control4 */
>> +#define RT5033_FL_CTRL4_MASK		0xE0
>> +#define RT5033_FL_CTRL4_RESV		0x14
>> +#define RT5033_FL_CTRL4_VTRREG_DEF	0x40
>> +#define RT5033_FL_CTRL4_VTRREG_MAX	0x60
>> +#define RT5033_FL_CTRL4_TRACK_CLK	0x80
>> +
>> +/* RT5033 FLED Control5 */
>> +#define RT5033_FL_CTRL5_MASK		0xC0
>> +#define RT5033_FL_CTRL5_RESV		0x10
>> +#define RT5033_FL_CTRL5_TA_GOOD		0x40
>> +#define RT5033_FL_CTRL5_TA_EXIST	0x80
>> +
>>  /* RT5033 control register */
>>  #define RT5033_CTRL_FCCM_BUCK_MASK		0x00
>>  #define RT5033_CTRL_BUCKOMS_MASK		0x01
>> diff --git a/include/linux/mfd/rt5033.h b/include/linux/mfd/rt5033.h
>> index 6cff5cf..45c97b7 100644
>> --- a/include/linux/mfd/rt5033.h
>> +++ b/include/linux/mfd/rt5033.h
>> @@ -12,10 +12,11 @@
>>  #ifndef __RT5033_H__
>>  #define __RT5033_H__
>> =20
>> -#include <linux/regulator/consumer.h>
>> +#include <linux/led-class-flash.h>
>>  #include <linux/i2c.h>
>> -#include <linux/regmap.h>
>>  #include <linux/power_supply.h>
>> +#include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>> =20
>>  /* RT5033 regulator IDs */
>>  enum rt5033_regulators {
>> @@ -59,4 +60,26 @@ struct rt5033_charger {
>>  	struct rt5033_charger_data	*chg;
>>  };
>> =20
>> +/* RT5033 led platform data */
>> +
>> +struct rt5033_led_config_data {
>> +	/* maximum LED current in movie mode */
>> +	u32 torch_max_microamp;
>> +	/* maximum LED current in flash mode */
>> +	u32 flash_max_microamp;
>> +	/* maximum flash timeout */
>> +	u32 flash_max_timeout;
>> +	/* max LED brightness level */
>> +	enum led_brightness max_brightness;
>> +};
>=20
> Rid these comments.  Use kerneldoc format instead.
>=20
>> +struct rt5033_led {
>> +	struct device		*dev;
>> +	struct rt5033_dev	*rt5033;
>> +	struct regmap		*regmap;
>> +
>> +	/* Related LED class device */
>> +	struct led_classdev	cdev;
>> +};
>> +
>>  #endif /* __RT5033_H__ */
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
