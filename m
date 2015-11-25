From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 06/16] mfd: add TI LMU driver
Date: Wed, 25 Nov 2015 08:15:19 +0000
Message-ID: <20151125081519.GM12874@x1>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-7-git-send-email-milo.kim@ti.com>
 <20151123103025.GJ3098@x1>
 <5653CD07.2090602@ti.com>
 <56540627.7010901@ti.com>
 <20151124081847.GD807@x1>
 <56556D01.9070804@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56556D01.9070804-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On Wed, 25 Nov 2015, Kim, Milo wrote:

> On 11/24/2015 5:18 PM, Lee Jones wrote:
> >On Tue, 24 Nov 2015, Kim, Milo wrote:
> >
> >>On 11/24/2015 11:35 AM, Kim, Milo wrote:
> >>>Hi Lee,
> >>>
> >>>Thanks for all your comments. Please see my comments below.
> >>>
> >>>On 11/23/2015 7:30 PM, Lee Jones wrote:
> >>>>>+int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read)
> >>>>>>+{
> >>>>>>+	int ret;
> >>>>>>+	unsigned int val;
> >>>>>>+
> >>>>>>+	ret =3D regmap_read(lmu->regmap, reg, &val);
> >>>>>>+	if (ret < 0)
> >>>>>>+		return ret;
> >>>>>>+
> >>>>>>+	*read =3D (u8)val;
> >>>>>>+	return 0;
> >>>>>>+}
> >>>>>>+EXPORT_SYMBOL_GPL(ti_lmu_read_byte);
> >>>>It doesn't get much more simple than this.
> >>>>
> >>>>What's the purpose of abstracting it?
> >>>>
> >>>>>>+int ti_lmu_write_byte(struct ti_lmu *lmu, u8 reg, u8 data)
> >>>>>>+{
> >>>>>>+	return regmap_write(lmu->regmap, reg, data);
> >>>>>>+}
> >>>>>>+EXPORT_SYMBOL_GPL(ti_lmu_write_byte);
> >>>>>>+
> >>>>>>+int ti_lmu_update_bits(struct ti_lmu *lmu, u8 reg, u8 mask, u8=
 data)
> >>>>>>+{
> >>>>>>+	return regmap_update_bits(lmu->regmap, reg, mask, data);
> >>>>>>+}
> >>>>>>+EXPORT_SYMBOL_GPL(ti_lmu_update_bits);
> >>>>Okay, I lied, it does get more simple.
> >>>>
> >>>>Seems like abstraction for the sake of abstraction here.
> >>>>
> >>>>Feel free to try and convince me otherwise.
> >>>>
> >>>
> >>>The main reason was that LMU MFD core provides consistent register
> >>>access among LMU drivers like ti-lmu-backlight, leds-lm3633,
> >>>lm363x-regulator and ti-lmu-fault-monitor('ti-lmu-hwmon' will be c=
hanged
> >>>to this in the 2nd patch).
> >>>
> >>>However, LMU register helpers are exactly same as regmap interface
> >>>except using ti_lmu data structure. So let me replace them with re=
gmap
> >>>functions. Thanks for pointing this out.
> >>
> >>I just realized LMU MFD core helpers also provide module
> >>dependencies by using EXPORT_SYMBOL_GPL().
> >>
> >># modprobe -D ti-lmu-backlight
> >>insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/video/backlight/ti-lmu-bac=
klight.ko
> >># modprobe -D ti-lmu-fault-monitor
> >>insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu-fault-monitor.k=
o
> >># modprobe -D lm363x-regulator
> >>insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/regulator/lm363x-regulator=
=2Eko
> >># modprobe -D leds-lm3633
> >>insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> >>insmod /lib/modules/<ver>/kernel/drivers/leds/leds-lm3633.ko
> >>
> >>ti-lmu.ko should be loaded first because it has hardware enable pin
> >>control code. Four other drivers have dependency on this module.
> >>Without EXPORT_SYMBOL_GPL(), this dependency will be gone like
> >>below.
> >>
> >># modprobe -D ti-lmu-backlight
> >>insmod /lib/modules/<ver>/kernel/drivers/video/backlight/ti-lmu-bac=
klight.ko
> >># modprobe -D ti-lmu-fault-monitor
> >>insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu-fault-monitor.k=
o
> >># modprobe -D lm363x-regulator
> >>insmod /lib/modules/<ver>/kernel/drivers/regulator/lm363x-regulator=
=2Eko
> >># modprobe -D leds-lm3633
> >>insmod /lib/modules/<ver>/kernel/drivers/leds/leds-lm3633.ko
> >>
> >>If LMU MFD core module is not loaded and other modules call regmap
> >>helpers, then loaded drivers will not work because hardware is not
> >>enabled yet.
> >>
> >>So I'd like to keep LMU MFD helpers for module dependencies.
> >>Additionally, I'll modify 'ti_lmu_read_byte()' as follows.
> >>
> >>int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read)
> >>{
> >>	return regmap_read(lmu->regmap, reg, (unsigned int *)read);
> >>}
> >>EXPORT_SYMBOL_GPL(ti_lmu_read_byte);
> >>
> >>Please let me know if you have better idea.
> >
> >You're keeping the helpers for the wrong reasons.  This has now beco=
me
> >a hack.  If you have dependencies between modules, either use the in=
it
> >levels or defer probe in the usual way.
> >
>=20
> Yes, I was wrong. In case LMU MFD core is not loaded, other LMU
> modules like ti-lmu-backlight isn't probed because no platform
> device (mfd device) exists. So the situation which I've mentioned
> never happens.
> And if GPIO controller is not ready and HW enable GPIO request gets
> failed on LMU MFD initialization, this will be processed later
> because it returns as error code '-EPROBE_DEFER' from GPIO
> subsystem. In other words, there is no dependency issue between LMU
> modules. Those are just platform device and driver.
>=20
> OK, I'll remove LMU register helpers in the 2nd patch. Then, each
> LMU driver will call regmap helpers directly.
> Thanks for your comments.

No problem.  You are welcome.

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
