From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND 06/16] mfd: add TI LMU driver
Date: Tue, 24 Nov 2015 08:18:47 +0000
Message-ID: <20151124081847.GD807@x1>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-7-git-send-email-milo.kim@ti.com>
 <20151123103025.GJ3098@x1>
 <5653CD07.2090602@ti.com>
 <56540627.7010901@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56540627.7010901@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kim, Milo" <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mark Brown <broonie@kernel.org>, lm-sensors@lm-sensors.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 24 Nov 2015, Kim, Milo wrote:

> On 11/24/2015 11:35 AM, Kim, Milo wrote:
> >Hi Lee,
> >
> >Thanks for all your comments. Please see my comments below.
> >
> >On 11/23/2015 7:30 PM, Lee Jones wrote:
> >>>+int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read)
> >>>>+{
> >>>>+	int ret;
> >>>>+	unsigned int val;
> >>>>+
> >>>>+	ret =3D regmap_read(lmu->regmap, reg, &val);
> >>>>+	if (ret < 0)
> >>>>+		return ret;
> >>>>+
> >>>>+	*read =3D (u8)val;
> >>>>+	return 0;
> >>>>+}
> >>>>+EXPORT_SYMBOL_GPL(ti_lmu_read_byte);
> >>It doesn't get much more simple than this.
> >>
> >>What's the purpose of abstracting it?
> >>
> >>>>+int ti_lmu_write_byte(struct ti_lmu *lmu, u8 reg, u8 data)
> >>>>+{
> >>>>+	return regmap_write(lmu->regmap, reg, data);
> >>>>+}
> >>>>+EXPORT_SYMBOL_GPL(ti_lmu_write_byte);
> >>>>+
> >>>>+int ti_lmu_update_bits(struct ti_lmu *lmu, u8 reg, u8 mask, u8 d=
ata)
> >>>>+{
> >>>>+	return regmap_update_bits(lmu->regmap, reg, mask, data);
> >>>>+}
> >>>>+EXPORT_SYMBOL_GPL(ti_lmu_update_bits);
> >>Okay, I lied, it does get more simple.
> >>
> >>Seems like abstraction for the sake of abstraction here.
> >>
> >>Feel free to try and convince me otherwise.
> >>
> >
> >The main reason was that LMU MFD core provides consistent register
> >access among LMU drivers like ti-lmu-backlight, leds-lm3633,
> >lm363x-regulator and ti-lmu-fault-monitor('ti-lmu-hwmon' will be cha=
nged
> >to this in the 2nd patch).
> >
> >However, LMU register helpers are exactly same as regmap interface
> >except using ti_lmu data structure. So let me replace them with regm=
ap
> >functions. Thanks for pointing this out.
>=20
> I just realized LMU MFD core helpers also provide module
> dependencies by using EXPORT_SYMBOL_GPL().
>=20
> # modprobe -D ti-lmu-backlight
> insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> insmod /lib/modules/<ver>/kernel/drivers/video/backlight/ti-lmu-backl=
ight.ko
> # modprobe -D ti-lmu-fault-monitor
> insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu-fault-monitor.ko
> # modprobe -D lm363x-regulator
> insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> insmod /lib/modules/<ver>/kernel/drivers/regulator/lm363x-regulator.k=
o
> # modprobe -D leds-lm3633
> insmod /lib/modules/<ver>/kernel/drivers/base/regmap/regmap-i2c.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/mfd-core.ko
> insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu.ko
> insmod /lib/modules/<ver>/kernel/drivers/leds/leds-lm3633.ko
>=20
> ti-lmu.ko should be loaded first because it has hardware enable pin
> control code. Four other drivers have dependency on this module.
> Without EXPORT_SYMBOL_GPL(), this dependency will be gone like
> below.
>=20
> # modprobe -D ti-lmu-backlight
> insmod /lib/modules/<ver>/kernel/drivers/video/backlight/ti-lmu-backl=
ight.ko
> # modprobe -D ti-lmu-fault-monitor
> insmod /lib/modules/<ver>/kernel/drivers/mfd/ti-lmu-fault-monitor.ko
> # modprobe -D lm363x-regulator
> insmod /lib/modules/<ver>/kernel/drivers/regulator/lm363x-regulator.k=
o
> # modprobe -D leds-lm3633
> insmod /lib/modules/<ver>/kernel/drivers/leds/leds-lm3633.ko
>=20
> If LMU MFD core module is not loaded and other modules call regmap
> helpers, then loaded drivers will not work because hardware is not
> enabled yet.
>=20
> So I'd like to keep LMU MFD helpers for module dependencies.
> Additionally, I'll modify 'ti_lmu_read_byte()' as follows.
>=20
> int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read)
> {
> 	return regmap_read(lmu->regmap, reg, (unsigned int *)read);
> }
> EXPORT_SYMBOL_GPL(ti_lmu_read_byte);
>=20
> Please let me know if you have better idea.

You're keeping the helpers for the wrong reasons.  This has now become
a hack.  If you have dependencies between modules, either use the init
levels or defer probe in the usual way.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
