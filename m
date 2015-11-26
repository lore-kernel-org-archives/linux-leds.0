From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/2] leds: rt5033: Add RT5033 Flash led device driver
Date: Thu, 26 Nov 2015 09:12:43 +0000
Message-ID: <20151126091243.GQ12874@x1>
References: <1448446948-13729-1-git-send-email-ingi2.kim@samsung.com>
 <1448446948-13729-3-git-send-email-ingi2.kim@samsung.com>
 <5655D001.8090803@samsung.com>
 <5656BC88.2070603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:33889 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752445AbbKZJMs (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2015 04:12:48 -0500
Received: by wmvv187 with SMTP id v187so21453352wmv.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2015 01:12:46 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5656BC88.2070603@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, rpurdie@rpsys.net, inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, andi.shyti@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Thu, 26 Nov 2015, Ingi Kim wrote:
> On 2015=EB=85=84 11=EC=9B=94 26=EC=9D=BC 00:13, Jacek Anaszewski wrot=
e:
> > Hi Ingi,
> >=20
> > Thanks for the update.
> >=20
> > On 11/25/2015 11:22 AM, Ingi Kim wrote:
> >> This patch adds device driver of Richtek RT5033 PMIC.
> >> The RT5033 Flash LED Circuit is designed for one or two LEDs drivi=
ng
> >> for torch and strobe applications, it provides an I2C software com=
mand
> >> to trigger the torch and strobe operation.
> >>
> >> Each of LED outputs can contorl a separate LED sharing their setti=
ng,
> >=20
> > s/contorl/control/
> >=20
>=20
> Oh, I see, Thanks
>=20
> >> and can be connected together for a single connected LED.
> >> One LED is represented by one child node.
> >>
> >> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> >> ---
> >>   drivers/leds/Kconfig               |   8 +
> >>   drivers/leds/Makefile              |   1 +
> >>   drivers/leds/leds-rt5033.c         | 541 +++++++++++++++++++++++=
++++++++++++++
> >>   include/linux/mfd/rt5033-private.h |  51 ++++
> >>   4 files changed, 601 insertions(+)
> >>   create mode 100644 drivers/leds/leds-rt5033.c

[...]

> >> diff --git a/include/linux/mfd/rt5033-private.h b/include/linux/mf=
d/rt5033-private.h
> >> index 1b63fc2..b20c7e4 100644
> >> --- a/include/linux/mfd/rt5033-private.h
> >> +++ b/include/linux/mfd/rt5033-private.h
> >> @@ -93,6 +93,57 @@ enum rt5033_reg {
> >>   #define RT5033_RT_CTRL1_UUG_MASK    0x02
> >>   #define RT5033_RT_HZ_MASK        0x01
> >>
> >> +/* RT5033 FLED Function1 register */
> >> +#define RT5033_FLED_FUNC1_MASK        0x97
> >=20
> > Bitmask should define group of bits that control single
> > functionality. There is no point in defining a bit mask
> > for the whole register width.
> >=20
>=20
> Thanks, I'll remove it.
>=20
> >> +#define RT5033_FLED_EN_LEDCS1        0x01
> >> +#define RT5033_FLED_EN_LEDCS2        0x02
> >> +#define RT5033_FLED_STRB_SEL        0x04
> >> +#define RT5033_FLED_PINCTRL        0x10
> >> +#define RT5033_FLED_RESET        0x80
> >> +
> >> +/* RT5033 FLED Function2 register */
> >> +#define RT5033_FLED_FUNC2_MASK        0x81
> >=20
> > Ditto.
> >=20
>=20
> Thanks,
>=20
> >> +#define RT5033_FLED_ENFLED        0x01
> >> +#define RT5033_FLED_SREG_STRB        0x80
> >> +
> >> +/* RT5033 FLED Strobe Control1 */
> >> +#define RT5033_FLED_STRBCTRL1_MASK        0xFF
> >=20
> > Ditto.
> >=20
>=20
> Thanks,
>=20
> >> +#define RT5033_FLED_STRBCTRL1_TM_CUR_MAX    0xE0
> >> +#define RT5033_FLED_STRBCTRL1_FL_CUR_DEF    0x0D
> >> +#define RT5033_FLED_STRBCTRL1_FL_CUR_MAX    0x1F
> >=20
> > Don't mix value constraints with bitmask .
> > You don't use above MAX and DEF macros in the driver, but
> > instead you define following set of macros in leds-rt5033.c:
> >=20
> > #define RT5033_LED_FLASH_TIMEOUT_MIN            64000
> > #define RT5033_LED_FLASH_TIMEOUT_STEP           32000
> > #define RT5033_LED_FLASH_BRIGHTNESS_MIN         50000
> > #define RT5033_LED_FLASH_BRIGHTNESS_MAX_1CH     600000
> > #define RT5033_LED_FLASH_BRIGHTNESS_MAX_2CH     800000
> > #define RT5033_LED_FLASH_BRIGHTNESS_STEP        25000
> > #define RT5033_LED_TORCH_BRIGHTNESS_MIN         12500
> > #define RT5033_LED_TORCH_BRIGHTNESS_STEP        12500
> >=20
> > These can be moved to this file, but below bit field
> > definitions.
> >=20
> > Besides, you could add bitmasks for "Timeout Current Level"
> > adn "Fled Strobe Current" bitfields, that are documented
> > for this register.
> >=20
>=20
> Thanks, I understand.
> I'll change it
>=20
> >> +
> >> +/* RT5033 FLED Strobe Control2 */
> >> +#define RT5033_FLED_STRBCTRL2_MASK    0x3F
> >> +#define RT5033_FLED_STRBCTRL2_TM_DEF    0x0F
> >> +#define RT5033_FLED_STRBCTRL2_TM_MAX    0x3F
> >=20
> > Insted of the above three please just add bitmask definition for th=
e
> > "FLED Strobe Timeout" bits.
> >=20
>=20
> Thanks, I'll change it
>=20
> >> +/* RT5033 FLED Control1 */
> >> +#define RT5033_FLED_CTRL1_MASK        0xF7
> >> +#define RT5033_FLED_CTRL1_TORCH_CUR_DEF    0x20
> >> +#define RT5033_FLED_CTRL1_TORCH_CUR_MAX    0xF0
> >> +#define RT5033_FLED_CTRL1_LBP_DEF    0x02
> >> +#define RT5033_FLED_CTRL1_LBP_MAX    0x07
> >=20
> > Similarly, just add bitmask definitions for "FLED Torch Current"
> > and "LPB".
> >=20
>=20
> Thanks, I'll change it
>=20
> >> +/* RT5033 FLED Control2 */
> >> +#define RT5033_FLED_CTRL2_MASK        0xFF
> >=20
> > This bitmask is useless.
> >=20
>=20
> Thanks,=20
>=20
> >> +#define RT5033_FLED_CTRL2_VMID_DEF    0x37
> >=20
> > Please remove this.
> >=20
>=20
> Thanks,=20
>=20
> >> +#define RT5033_FLED_CTRL2_VMID_MAX    0x3F
> >=20
> > Rename MAX to MASK.
> >=20
>=20
> Thanks, I'll change it.
>=20
> >> +#define RT5033_FLED_CTRL2_TRACK_ALIVE    0x40
> >> +#define RT5033_FLED_CTRL2_MID_TRACK    0x80
> >> +
> >> +/* RT5033 FLED Control4 */
> >> +#define RT5033_FLED_CTRL4_MASK        0xE0
> >> +#define RT5033_FLED_CTRL4_RESV        0x14
> >> +#define RT5033_FLED_CTRL4_VTRREG_DEF    0x40
> >=20
> > Above three are useless.
> >=20
>=20
> Thanks,=20
>=20
> >> +#define RT5033_FLED_CTRL4_VTRREG_MAX    0x60
> >=20
> > Rename DEF to MASK.
> >=20
>=20
> Thanks,=20
>=20
> >> +#define RT5033_FLED_CTRL4_TRACK_CLK    0x80
> >> +
> >> +/* RT5033 FLED Control5 */
> >> +#define RT5033_FLED_CTRL5_MASK        0xC0
> >> +#define RT5033_FLED_CTRL5_RESV        0x10
> >=20
> > Remove both above lines.
> >=20
>=20
> Thanks,=20
> >> +#define RT5033_FLED_CTRL5_TA_GOOD    0x40
> >> +#define RT5033_FLED_CTRL5_TA_EXIST    0x80
> >> +
> >>   /* RT5033 control register */
> >>   #define RT5033_CTRL_FCCM_BUCK_MASK        0x00
> >>   #define RT5033_CTRL_BUCKOMS_MASK        0x01

Once you've made these changes, please carry my Ack across.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
