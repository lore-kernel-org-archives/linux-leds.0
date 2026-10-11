Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E735A395;
	Sun, 11 Oct 2026 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748387; cv=pass; b=LsUauPLF5B1qoVKUuoCWbMTgAWiJqWIUKVe4aMgnC9PQdd3KLgmcbbqQUaPJshAKSJ64t+YHT+++0KQf/d9jN9mUust8ZQm/O9aSu5EMSigjoljC682nIOT2mY3O77lrtLEeHt0KxVr4ks9R5z88IcfI4McPq6Sorv7YyhfGfZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748387; c=relaxed/simple;
	bh=0wYxKFlPmNVJ4iYBf1Uloc/Hkn72LMIBKw/3/6MTdlc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rvPsPZDCR6Nwb/T1hDn34M7T+oDc6CGg0I2VWHgVBpFpqDqXqHXBHCU7BxUhEFDcA5w3dH8eq+V0BbeQiUzvUEzVQ/ajk4E38i/FLx6VA6rd8Ftl4dQ6MlSGllfiHmUT9QlAz0MUCLi/59eqWUpq0Vb7nIRWEyXJy35C1tcyJPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=bBdxULdI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="bBdxULdI"
ARC-Seal: i=1; a=rsa-sha256; t=1791748375; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XDR1jBViY8Bexr60Jm2Nwvg30tV3uYrpGvhHw5CElOJVUWTcv+bGbwczndgmoFKFTjjfxgi1Ns2L8VYhwKCWa0DY3eW2HHNNhTz5kANDJB53VVnvg1Mm2O8JIKRvTGQ8Dk9QakuRCIiX++m1FbyIw3T1hzFLlFLLnXarLFBTQuo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791748375; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JioO99Wy7cUGDgZKTWaXWHv12LZct4tUjuOiO/Pi0Bk=; 
	b=j2auPcyz9faWdFrFLYhDU9wf5FtKu+bcsa2YpYuSYOafKZSLCReWP24vxaXyVygRj2aNgbi7uTa5RF2hFYanCPYGdfNVZX/sfupAxyT8Nuj/q1UvE8X90ZaAouC8RoF1boYSYU9AR0jFgT4B0DmJTfjZnmP2bYFC7hmuhJ/4KQg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791748375;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=JioO99Wy7cUGDgZKTWaXWHv12LZct4tUjuOiO/Pi0Bk=;
	b=bBdxULdIrINqwyCkm8QYVLIjXADw2T2Oyi/ngxuO5MvWIVFABJtAEGPPiWNMwOxU
	EGo2aDBCZly59us2llBRZGhR75qySK0VtBx/NDF+A4+s9yWHaADt8/BwXRmgkIpfroL
	niLxPibY48rQIYKpsoh+j2feeDVXzBwZJmc2OHstXwfqiA3XPG3Fdx4yk7aUepaDJjy
	QwyzhOI8LMNLep7P2y4FVqqK7R3hA8/FcH58j2EHXsF82dI4QdoN6ZlEkqglsrOB+c9
	TgL/6Ygc951drTlFejW6oFRzVw4yHQ170sxEtyXCSV2tPk758Y7nOWbMjoVMb/a8sSj
	zTn0PNA7cg==
Received: by smtp.zohomail.com with SMTPS id 1791748374291659.8468890399357;
	Sun, 11 Oct 2026 12:52:54 -0700 (PDT)
Message-ID: <b31878aeb4af648106adc74efbb2d1e839f9f8ea.camel@rong.moe>
Subject: Re: [PATCH v2 2/5] platform/x86: uniwill-laptop: Implement rainbow
 animation as trigger
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <9087d109-d757-43bc-b80d-64df7dc9ff82@gmx.de>
References: <20261007144101.323289-1-W_Armin@gmx.de>
	 <20261007144101.323289-3-W_Armin@gmx.de>
	 <035799dd461fe0e7a60564e11f10fd23eb3daabf.camel@rong.moe>
	 <9087d109-d757-43bc-b80d-64df7dc9ff82@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 03:47:48 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Armin,

On Sun, 2026-10-11 at 02:52 +0200, Armin Wolf wrote:
> Am 10.10.26 um 13:20 schrieb Rong Zhang:
>=20
> > Hi Armin,
> >=20
> > On Wed, 2026-10-07 at 16:38 +0200, Armin Wolf wrote:
> > > It turns out that some models require the lightbar to be activated
> > > in order to display the rainbow animation, so users have to access
> > > both the "rainbow_animation" sysfs attribute and the LED sysfs
> > > interface when enabling the rainbow animation. This can cause short
> > > glitches when the lightbar was previously disabled.
> > >=20
> > > Fix this by replacing the sysfs attribute with a custom LED trigger
> > > called "uniwill-rainbow". Selecting this trigger will atomically
> > > activate the lightbar and enable the rainbow animation mode. This
> > > can potentially break userspace applications using the old sysfs
> > > attribute, but so far no such application is known to exist (yet).
> > >=20
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 ++
> > >   .../ABI/testing/sysfs-driver-uniwill-laptop   |  11 --
> > >   .../admin-guide/laptops/uniwill-laptop.rst    |   5 +-
> > >   MAINTAINERS                                   |   1 +
> > >   drivers/platform/x86/uniwill/Kconfig          |   1 +
> > >   drivers/platform/x86/uniwill/uniwill-acpi.c   | 133 +++++++++++----=
---
> > >   6 files changed, 95 insertions(+), 66 deletions(-)
> > >   create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-l=
aptop
> > >=20
> > > diff --git a/Documentation/ABI/removed/sysfs-driver-uniwill-laptop b/=
Documentation/ABI/removed/sysfs-driver-uniwill-laptop
> > > new file mode 100644
> > > index 000000000000..c226efc23b59
> > > --- /dev/null
> > > +++ b/Documentation/ABI/removed/sysfs-driver-uniwill-laptop
> > > @@ -0,0 +1,10 @@
> > > +What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
> > > +Date:		November 2025
> > > +KernelVersion:	6.19
> > > +Contact:	Armin Wolf <W_Armin@gmx.de>
> > > +Description:
> > > +		Forces the integrated lightbar to display a rainbow animation when=
 the machine
> > > +		is not suspended. Writing "1"/"0" into this file enables/disables =
this
> > > +		functionality.
> > > +
> > > +		Reading this file returns the current status of the rainbow animat=
ion functionality.
> > It'd be more helpful by documenting the removal date, version and what
> > has replaced it.
>=20
> True, i will write a patch to address this.

[..snip..]

> > > -
> > >   static ssize_t breathing_in_suspend_store(struct device *dev, struc=
t device_attribute *attr,
> > >   					  const char *buf, size_t count)
> > >   {
> > > @@ -1258,7 +1213,6 @@ static struct attribute *uniwill_attrs[] =3D {
> > >   	&dev_attr_super_key_enable.attr,
> > >   	&dev_attr_touchpad_toggle_enable.attr,
> > >   	/* Lightbar-related */
> > > -	&dev_attr_rainbow_animation.attr,
> > >   	&dev_attr_breathing_in_suspend.attr,
> > >   	/* Power-management-related */
> > >   	&dev_attr_ctgp_offset.attr,
> > > @@ -1288,8 +1242,7 @@ static umode_t uniwill_attr_is_visible(struct k=
object *kobj, struct attribute *a
> > >   			return attr->mode;
> > >   	}
> > >  =20
> > > -	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
> > > -	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
> > > +	if (attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
> > >   		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
> > >   			return attr->mode;
> > It'd be better to convert breathing_in_suspend into an LED device
> > attribute. See led_classdev->groups.
>=20
> We cannot do this because this field is being used by the multicolor LED =
class.

Whoops, I didn't notice that.

> I can try to find a workaround for this.

(+CC Lee, Pavel, linux-leds)

IMO the best way to solve the dilemma is to introduce class_group for
led-class-multicolor and led-class-flash, or else we will have to
introduce (or have already introduced?) more workarounds for other
drivers.

For this cycle let's keep the attribute as is.

[..snip..]

> > > +
> > > +static struct led_trigger uniwill_lightbar_trigger =3D {
> > > +	.name =3D "uniwill-rainbow",
> > > +	.activate =3D uniwill_lightbar_trigger_activate,
> > > +	.deactivate =3D uniwill_lightbar_trigger_deactivate,
> > > +	.trigger_type =3D &uniwill_lightbar_trigger_type,
> > > +};
> > > +
> > >   #define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGH=
TBAR_S3_OFF | LIGHTBAR_WELCOME)
> > >  =20
> > >   static int uniwill_led_init(struct uniwill_data *data)
> > > @@ -1587,12 +1593,18 @@ static int uniwill_led_init(struct uniwill_da=
ta *data)
> > >   	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
> > >   	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
> > >   	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led=
_brightness_set;
> > > +	data->led_mc_cdev.led_cdev.trigger_type =3D &uniwill_lightbar_trigg=
er_type;
> > > +	data->led_mc_cdev.led_cdev.hw_control_trigger =3D uniwill_lightbar_=
trigger.name;
> > > +	data->led_mc_cdev.led_cdev.hw_control_set =3D uniwill_led_hw_contro=
l_set;
> > A private trigger does not need hw_control_set, which is only meant to
> > coordinate between different drivers, i.e., in the case when the LED
> > device and the hardware control trigger are located at different driver=
s.
> >=20
> > I've also updated the documentation in commit 8e04e5382aa9 ("leds:
> > trigger: Add hw_offloaded() callback and provide
> > trigger_may_offload_to_hw attribute"), quoted below:
> >=20
> >     Alternatively, a private trigger can be implemented along with the =
LED
> >     driver if the LED's hardware control doesn't fit any generic trigge=
r. To
> >     associate the private trigger with the LED classdev, their `trigger=
_type`
> >     must be the same. To declare that the private trigger provides hard=
ware
> >     control for the associated LED classdev, set the `hw_control_trigge=
r`
> >     string to the trigger's name. Since both the LED classdev and the p=
rivate
> >     trigger are in the same LED driver, it's not necessary for them to
> >     coordinate via `hw_control_*` callbacks.
> >=20
> > I'd suggest calling uniwill_led_hw_control_set() directly from the
> > trigger's [de]activate callbacks, just like other drivers.
>=20
> I decided to use this callbacks in order to be able to add support for th=
e keyboard backlight
> animation in the future (if we someday find a device that supports this f=
eature).

The name "uniwill-rainbow" sounds irrelevant to keyboard backlight
animation. In this case the latter needs a new private trigger with a new
name, and it can have different [de]activate callbacks. IOW, we don't
need hw_control_set() either.

Otherwise, using hw_control_set() makes sense to me as long as the
current name is relevant.



Since I've CC'ed leds folks:

Per-key lighting is becoming increasingly common for keyboard backlight.

I am actually thinking about introducing LED array/matrix support to the
leds subsystem. An LED array/matrix device is just a special LED device
that controls all constituent LED devices, so that we can:

- implement keyboard backlight animation (or LampArray autonomous mode)
as an array/matrix hardware control trigger [1]
- tune the lighting of the whole array/matrix at once by tuning the LED
array/matrix device [2]
- tune per-key lighting by tuning constituent LED devices
- apply generic LED triggers to the whole array/matrix [1]
- apply different generic LED triggers to different constituent LED
devices
- properly deconflict the above operations

It definitely requires a lot of work to get things (especially locking
and atomicity) right, but it should be very helpful for devices with per-
key lighting once done. I believe missing proper LED array/matrix support
was the main reason why tuxedo_nb04_wmi_ab [3] implemented a virtual
LampArray HID device far before any userspace LampArray tool emerged.

[1]: The constituent LED devices will be inoperable when a trigger is
active on their array/matrix LED device.

[2]: The leds subsystem won't emulate this. The driver must implement
brightness_get() and brightness_set[_blocking]() for the LED array/matrix
device.

[3]: I know Texudo folks are working on adding hid-lamparray to connect
it to the LED subsystem. I've had another independent implementation with
HIDRAW sniff, no hid-generic dependency, autonomous mode as a trigger,
non-RGB LampArray support, and per-key LED device support in my local
tree, but that's another story. I will firstly push it further without
LED array/matrix support. Then I will try to add LED array/matrix
support, with hid-lamparray being the first user.

Thanks,
Rong

>=20
> > >  =20
> > >   	if (value & LIGHTBAR_S0_OFF)
> > >   		data->led_mc_cdev.led_cdev.brightness =3D 0;
> > >   	else
> > >   		data->led_mc_cdev.led_cdev.brightness =3D 1;
> > >  =20
> > > +	if (value & LIGHTBAR_WELCOME)
> > Check !LIGHTBAR_S0_OFF too?
> >=20
> > If the last state is LIGHTBAR_S0_OFF|LIGHTBAR_WELCOME (probably caused =
by
> > an outdated driver without this patch), the trigger's activate callback
> > will be called on probe, lighting up the previously off LED. Is this
> > intentional?
> >=20
> > Thanks,
> > Rong
>=20
> Yes, this is intentional. LIGHTBAR_WELCOME implies !LIGHTBAR_S0_OFF, some=
 devices
> even assume this.
>=20
> Thanks,
> Armin Wolf
>=20
> > > +		data->led_mc_cdev.led_cdev.default_trigger =3D uniwill_lightbar_tr=
igger.name;
> > > +
> > >   	for (int i =3D 0; i < LED_CHANNELS; i++) {
> > >   		data->led_mc_subled_info[i].color_index =3D color_indices[i];
> > >  =20
> > > @@ -3540,17 +3552,31 @@ static int __init uniwill_init(void)
> > >   		pr_warn("Enabling potentially unsupported features\n");
> > >   	}
> > >  =20
> > > -	ret =3D platform_driver_register(&uniwill_driver);
> > > +	/*
> > > +	 * We cannot register the trigger inside the .probe callback of the
> > > +	 * platform driver, because each trigger needs a unique name.
> > > +	 */
> > > +	ret =3D led_trigger_register(&uniwill_lightbar_trigger);
> > >   	if (ret < 0)
> > >   		return ret;
> > >  =20
> > > +	ret =3D platform_driver_register(&uniwill_driver);
> > > +	if (ret < 0)
> > > +		goto err_platform;
> > > +
> > >   	ret =3D uniwill_wmi_register_driver();
> > > -	if (ret < 0) {
> > > -		platform_driver_unregister(&uniwill_driver);
> > > -		return ret;
> > > -	}
> > > +	if (ret < 0)
> > > +		goto err_wmi;
> > >  =20
> > >   	return 0;
> > > +
> > > +err_wmi:
> > > +	platform_driver_unregister(&uniwill_driver);
> > > +
> > > +err_platform:
> > > +	led_trigger_unregister(&uniwill_lightbar_trigger);
> > > +
> > > +	return ret;
> > >   }
> > >   module_init(uniwill_init);
> > >  =20
> > > @@ -3558,6 +3584,7 @@ static void __exit uniwill_exit(void)
> > >   {
> > >   	uniwill_wmi_unregister_driver();
> > >   	platform_driver_unregister(&uniwill_driver);
> > > +	led_trigger_unregister(&uniwill_lightbar_trigger);
> > >   }
> > >   module_exit(uniwill_exit);
> > >  =20
