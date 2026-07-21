Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7646D2CB;
	Tue, 21 Jul 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658685; cv=pass; b=eKFkMolxtcYB2+Gm9KwpMQ9OxEOBpb3TZJUhxSmVYSnB6WS6snZC9uysTzTpFCck9iR4WIpD1mPXUoJybarJ8QWgEHifxFEGZHspr4596aisPGll4qc1dwGTvU4utVmC+eWN+4ab9Xbk1BSOPIyELxE5u9lwxHIqut/lt9mQ28c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658685; c=relaxed/simple;
	bh=W8moX1nxVPBDqmSEYU2KurOsq2pedj1S8i3Ihmfxq4M=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IhJHB9oO0TyofdcXiE83usatlcT3MWFpoAk89tM5IGvkXBNl/sJIVuvC/XF3j3ytvirsWr6S1JUTN31MSL/87PUqUFA3r7ULfciqsy/38T57QLD8kW/wr6jJ4PAeonyr9e1EHszqyNTA2fsIPC3rCw800LEjskzf8E17r8tOrds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=maYoWBfm; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="maYoWBfm"
ARC-Seal: i=1; a=rsa-sha256; t=1784658655; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XH02KziGeYM4Molhywj63UgGCfiIt9508Aa7WhFLfBFRykm3eNbQKJmnz3pKJBN5hnjjO8bs7CjTHwRihaP88zzTSWnd3WczmV07dGPjytNh8zLXetj2bPLqxcIaBvPIjZAJ0iM23E/5VEbcSjsX8ZUMhVm46cLJap0cv16W7KA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784658655; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xl28rW6aDVyQKo+zcmef8/uqnjsUkguSjVjlYO834SM=; 
	b=lbL1+vI9AC/zRVeB6lxjIRJ8P87bunjpUQAk0HjDuvbO1QrX7r0NUUJ+nOmfXn3D24iY9Px6tk2bzMxfU5zzkjJGpoVJHWowqpjwqK9NJnsBZCiEAeJv2CeE8rjdCeiHU99+QByGpHqp+Ow0m61QuOhHRnJ4zNeAppGzE0eYKv4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784658655;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=xl28rW6aDVyQKo+zcmef8/uqnjsUkguSjVjlYO834SM=;
	b=maYoWBfmHpKRhwROFPVsf4Cjcj/PHFRlKSgZnx2UAJSeWjQmaP5U0yKP0quh9vda
	5M5vIXaUROx4ngidyE/RV7Ke/YNUUz3c5uBvWj2JmdqW98K/zVq5B2LPv4PFx7Xy2Uc
	10XKdQuCJBaUHoyFE4BN+ymz5pk86uOdeBUrEUNBD6+CpwEjI0HFKnXNoaLe28OCTQm
	W3s/Qk+e2/zarsK2fVmCR76ga0yaDPE16Kd0YVdNG2wtJMQKc0ruQeX29/PTACpOcBe
	m1FftACVrU+J1kapA69cSsQg7JrvfDpQEHKpkkGumOgQN06LgFXJ5zpIzl9h5f1A6wC
	FKiCybZlqA==
Received: by mx.zohomail.com with SMTPS id 1784658653012954.7838383886185;
	Tue, 21 Jul 2026 11:30:53 -0700 (PDT)
Message-ID: <7207b99c8103045943980c39867cfa03373b3675.camel@rong.moe>
Subject: Re: [PATCH RFC v3 11/11] platform/x86: ideapad-laptop: Fully
 support auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede	 <hansg@kernel.org>, Ike Panhc <ikepanhc@gmail.com>, Andrew
 Lunn	 <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, Vishnu
 Sankar	 <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
	linux-leds@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
In-Reply-To: <e4d81cf2-a44d-bcdb-1bc9-f5847b447984@linux.intel.com>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
	 <20260719-leds-trigger-hw-changed-v3-11-5fb55722e36e@rong.moe>
	 <e4d81cf2-a44d-bcdb-1bc9-f5847b447984@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 02:25:42 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External

Hi Ilpo,

Thanks for reviewing the series :)

On Tue, 2026-07-21 at 20:14 +0300, Ilpo J=C3=A4rvinen wrote:
> On Sun, 19 Jul 2026, Rong Zhang wrote:
>=20
> > Currently, the auto brightness mode of keyboard backlight maps to
> > brightness=3D0 in LED classdev. The only method to switch to such a mod=
e
> > is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
> > is a multiplexed brightness value; writing 0 simply results in the
> > backlight being turned off.
> >=20
> > With brightness processing code decoupled from LED classdev, we can now
> > fully support the auto brightness mode. In this mode, the keyboard
> > backlight is controlled by the EC according to the ambient light sensor
> > (ALS).
> >=20
> > To utilize this, a private hardware control trigger "ideapad-auto" is
> > added, with the event handling procedure calling the
> > led_trigger_notify_hw_control_changed() interface to activate/deactivat=
e
> > the private trigger according to the current LED trigger state.
> >=20
> > Meanwhile, block brightness changes on exit to prevent the side effect
> > of LED device unregistration when the private trigger is active from
> > resetting the brightness to zero, so that we can retain the state of
> > auto mode among boots.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v3:
> > - Address concerns from Sashiko
> >   - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
> >   - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
> >   - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-=
0-c28c44053cf3%40rong.moe
> > - Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
> > ---
> >  drivers/platform/x86/lenovo/ideapad-laptop.c | 112 +++++++++++++++++++=
+++++---
> >  1 file changed, 103 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/pla=
tform/x86/lenovo/ideapad-laptop.c
> > index 66e16abda5e3..253d2962b927 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > @@ -1714,9 +1714,58 @@ static int ideapad_kbd_bl_led_cdev_brightness_se=
t(struct led_classdev *led_cdev,
> >  {
> >  	struct ideapad_private *priv =3D container_of(led_cdev, struct ideapa=
d_private, kbd_bl.led);
> > =20
> > +	/*
> > +	 * When deinitializing: It must be the side effect of led_cdev
> > +	 * unregistration when our private trigger is active. We've set
> > +	 * LED_RETAIN_AT_SHUTDOWN to retain led_cdev brightness level.
> > +	 * To do the same for auto mode, gate changes and return early.
> > +	 */
> > +	if (unlikely(!priv->kbd_bl.initialized))
>=20
> This too would need include, but I think addressing some earlier include=
=20
> request will cover it.
>=20
> > +		return 0;
> > +
> >  	return ideapad_kbd_bl_brightness_set(priv, brightness);
> >  }
> > =20
> > +static bool ideapad_kbd_bl_auto_trigger_offloaded(struct led_classdev =
*led_cdev)
> > +{
> > +	struct ideapad_private *priv =3D container_of(led_cdev, struct ideapa=
d_private, kbd_bl.led);
>=20
> Add include for container_of().
>=20
> > +
> > +	return atomic_read(&priv->kbd_bl.last_hw_brightness) =3D=3D KBD_BL_AU=
TO_MODE_HW_BRIGHTNESS;
> > +}
> > +
> > +static int ideapad_kbd_bl_auto_trigger_activate(struct led_classdev *l=
ed_cdev)
> > +{
> > +	struct ideapad_private *priv =3D container_of(led_cdev, struct ideapa=
d_private, kbd_bl.led);
> > +
> > +	return ideapad_kbd_bl_hw_brightness_set(priv, KBD_BL_AUTO_MODE_HW_BRI=
GHTNESS);
> > +}
> > +
> > +static struct led_hw_trigger_type ideapad_kbd_bl_auto_trigger_type;
> > +
> > +static struct led_trigger ideapad_kbd_bl_auto_trigger =3D {
> > +	.name =3D "ideapad-auto",
> > +	.trigger_type =3D &ideapad_kbd_bl_auto_trigger_type,
> > +	.activate =3D ideapad_kbd_bl_auto_trigger_activate,
> > +	.offloaded =3D ideapad_kbd_bl_auto_trigger_offloaded,
> > +};
> > +
> > +static bool ideapad_kbd_bl_auto_trigger_registered;
> > +
> > +static void ideapad_kbd_bl_notify_hw_control(struct ideapad_private *p=
riv,
> > +					     int hw_brightness, int last_hw_brightness)
> > +{
> > +	bool hw_control, last_hw_control;
> > +
> > +	if (priv->kbd_bl.type !=3D KBD_BL_TRISTATE_AUTO)
> > +		return;
> > +
> > +	hw_control =3D hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGHTNESS;
> > +	last_hw_control =3D last_hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRI=
GHTNESS;
> > +
> > +	if (hw_control !=3D last_hw_control)
> > +		led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_control)=
;
> > +}
> > +
> >  static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
> >  {
> >  	int hw_brightness, brightness, last_hw_brightness;
> > @@ -1738,6 +1787,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_=
private *priv)
> >  	if (hw_brightness =3D=3D last_hw_brightness)
> >  		return;
> > =20
> > +	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_brightn=
ess);
> > +
> >  	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightne=
ss);
> >  }
> > =20
> > @@ -1768,6 +1819,24 @@ static int ideapad_kbd_bl_init(struct ideapad_pr=
ivate *priv)
> > =20
> >  	switch (priv->kbd_bl.type) {
> >  	case KBD_BL_TRISTATE_AUTO:
> > +		priv->kbd_bl.led.max_brightness =3D 2;
> > +
> > +		if (!ideapad_kbd_bl_auto_trigger_registered) {
> > +			dev_warn(&priv->platform_device->dev,
> > +				 "Could not provide LED trigger %s for keyboard backlight\n",
> > +				 ideapad_kbd_bl_auto_trigger.name);
> > +			break;
> > +		}
> > +
> > +		priv->kbd_bl.led.flags             |=3D LED_TRIG_HW_CHANGED;
> > +		priv->kbd_bl.led.hw_control_trigger =3D ideapad_kbd_bl_auto_trigger.=
name;
> > +		priv->kbd_bl.led.trigger_type       =3D &ideapad_kbd_bl_auto_trigger=
_type;
>=20
> I'm skeptical aligning makes things better here.
>=20
> > +
> > +		/* Hardware remembers the last brightness level, including auto mode=
. */
> > +		if (hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
> > +			priv->kbd_bl.led.default_trigger =3D ideapad_kbd_bl_auto_trigger.na=
me;
> > +
> > +		break;
> >  	case KBD_BL_TRISTATE:
> >  		priv->kbd_bl.led.max_brightness =3D 2;
> >  		break;
> > @@ -1779,13 +1848,22 @@ static int ideapad_kbd_bl_init(struct ideapad_p=
rivate *priv)
> >  		unreachable();
> >  	}
> > =20
> > -	err =3D led_classdev_register(&priv->platform_device->dev, &priv->kbd=
_bl.led);
> > -	if (err)
> > -		return err;
> > +	/* Queue notifications, as kbd_bl.initialized is about to be set. */
> > +	guard(mutex)(&priv->kbd_bl.notif_mutex);
> > =20
> > +	/*
> > +	 * Setting kbd_bl.initialized after led_classdev_register() could lea=
d
> > +	 * to race conditions in ideapad_kbd_bl_led_cdev_brightness_set() whe=
re
> > +	 * kbd_bl.initialized is checked, so set it now. It can be reverted b=
ack
> > +	 * if the LED classdev failed to register.
> > +	 */
> >  	priv->kbd_bl.initialized =3D true;
> > =20
> > -	return 0;
> > +	err =3D led_classdev_register(&priv->platform_device->dev, &priv->kbd=
_bl.led);
> > +	if (err)
> > +		priv->kbd_bl.initialized =3D false;
> > +
> > +	return err;
> >  }
> > =20
> >  static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
> > @@ -2612,17 +2690,30 @@ static int __init ideapad_laptop_init(void)
> >  {
> >  	int err;
> > =20
> > +	err =3D led_trigger_register(&ideapad_kbd_bl_auto_trigger);
> > +	if (err) {
> > +		pr_warn("Failed to register LED trigger %s: %d\n",
>=20
> include missing.
>=20
> > +			ideapad_kbd_bl_auto_trigger.name, err);
> > +	} else {
> > +		ideapad_kbd_bl_auto_trigger_registered =3D true;
> > +	}
> > +
> >  	err =3D ideapad_wmi_driver_register();
> >  	if (err)
> > -		return err;
> > +		goto err_ledtrig;
> > =20
> >  	err =3D platform_driver_register(&ideapad_acpi_driver);
> > -	if (err) {
> > -		ideapad_wmi_driver_unregister();
> > -		return err;
> > -	}
> > +	if (err)
> > +		goto err_wmi;
> > =20
> >  	return 0;
> > +
> > +err_wmi:
> > +	ideapad_wmi_driver_unregister();
> > +err_ledtrig:
> > +	if (ideapad_kbd_bl_auto_trigger_registered)
> > +		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
> > +	return err;
> >  }
> >  module_init(ideapad_laptop_init)
> > =20
> > @@ -2630,6 +2721,9 @@ static void __exit ideapad_laptop_exit(void)
> >  {
> >  	ideapad_wmi_driver_unregister();
> >  	platform_driver_unregister(&ideapad_acpi_driver);
>=20
> Why is the order not the reverse of the init order?

Thanks for discovering it. Since it exists before the series, I guess I
will submit a fixup patch for it separately so that it don't have to
wait for an RFC series.

And ACK to all other comments in this and previous replies. Will fix
them when I resubmit the series.

Thanks,
Rong

>=20
> > +
> > +	if (ideapad_kbd_bl_auto_trigger_registered)
> > +		led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
> >  }
> >  module_exit(ideapad_laptop_exit)
> > =20
> >=20
> >=20
