Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B741DF26E;
	Wed, 22 Jul 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707736; cv=none; b=X07GCiQSuogpjkbW/GBLCp+xbU3X/kw7ZycTuzOa9P1gcH/Dui7RSNXpo/y7g9BmaBoa8LtScEbhVH1eQhP/g02Y2wizxqP87KDQUTU0sVOKuzA5kFbHOEIcBGfWRButkWbYXmtnygy9ZgyPyH/WzLECHkwAlf7imCnfYGKbJxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707736; c=relaxed/simple;
	bh=FjIwpe7Ws/7Gr8Tfxx0j9ISIoFynOT6DCLIjWM7rnis=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RJszrRIZSjBWlY4z541wywwTL7Wx1H/7l8aK2epTIF1k/MD0YENj/uFFFD+XCNXMdeHyUmf8y6UAPFA7hljq2WCdlN5flahLp8bnFHYUoqQTmx32xzxWaEnMJr2aYkeIL+Eh+f3qB4Gpa/FxbRK/8FGeiXZZr+GivfpaNiYD9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPLV1+i6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPLV1+i6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784707734; x=1816243734;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FjIwpe7Ws/7Gr8Tfxx0j9ISIoFynOT6DCLIjWM7rnis=;
  b=bPLV1+i6moK9X/fgip7DrGAVaR7x40NkfXNPbsw6PvhAbe3xfBufkm9Y
   1AhWF2Fx2fEf3zVbpgDALM8nwP+qHnOE3HomFzO5mtqpFSlxVZNUtCfQ8
   feZyOYx1QtejFuGflVdVeV/oAqwreL3Ml6XaA04RKenx6EDB3jci19zIW
   MYYCgsFklTdyszeBP7uMsHmFuka3eGvksWNt14DC3F1l6eVJIB+zWgNzf
   gk83g6vNmL/1oYZT9NhuF8BHjjzYOO97N/3Xq5W179gXcRCVoMchBNmrT
   gEQA9UpuWRFVJySIUZGBm2AcsK3fK0taEowkPFYCuKGMtRt/mQp2FmeSE
   A==;
X-CSE-ConnectionGUID: oLT7tPPCTtGT5v+7uz1IqA==
X-CSE-MsgGUID: 38eBl2ZmQJOLYm+tG50TMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85208566"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85208566"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 01:08:53 -0700
X-CSE-ConnectionGUID: rKncRLoLTQmr3ZctJx0iCw==
X-CSE-MsgGUID: hvMBhtBeQ+GL8mZ1K6SUeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="254624250"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.200])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 01:08:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 22 Jul 2026 11:08:43 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
    =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Ike Panhc <ikepanhc@gmail.com>, 
    Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
    linux-leds@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v3 11/11] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
In-Reply-To: <7207b99c8103045943980c39867cfa03373b3675.camel@rong.moe>
Message-ID: <4956d1ca-1979-bca7-3673-641ab6e842b2@linux.intel.com>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>  <20260719-leds-trigger-hw-changed-v3-11-5fb55722e36e@rong.moe>  <e4d81cf2-a44d-bcdb-1bc9-f5847b447984@linux.intel.com> <7207b99c8103045943980c39867cfa03373b3675.camel@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-847042249-1784707723=:1198"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-847042249-1784707723=:1198
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 22 Jul 2026, Rong Zhang wrote:

> Hi Ilpo,
>=20
> Thanks for reviewing the series :)
>=20
> On Tue, 2026-07-21 at 20:14 +0300, Ilpo J=C3=A4rvinen wrote:
> > On Sun, 19 Jul 2026, Rong Zhang wrote:
> >=20
> > > Currently, the auto brightness mode of keyboard backlight maps to
> > > brightness=3D0 in LED classdev. The only method to switch to such a m=
ode
> > > is by pressing the manufacturer-defined shortcut (Fn+Space). However,=
 0
> > > is a multiplexed brightness value; writing 0 simply results in the
> > > backlight being turned off.
> > >=20
> > > With brightness processing code decoupled from LED classdev, we can n=
ow
> > > fully support the auto brightness mode. In this mode, the keyboard
> > > backlight is controlled by the EC according to the ambient light sens=
or
> > > (ALS).
> > >=20
> > > To utilize this, a private hardware control trigger "ideapad-auto" is
> > > added, with the event handling procedure calling the
> > > led_trigger_notify_hw_control_changed() interface to activate/deactiv=
ate
> > > the private trigger according to the current LED trigger state.
> > >=20
> > > Meanwhile, block brightness changes on exit to prevent the side effec=
t
> > > of LED device unregistration when the private trigger is active from
> > > resetting the brightness to zero, so that we can retain the state of
> > > auto mode among boots.
> > >=20
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > ---
> > > Changes in v3:
> > > - Address concerns from Sashiko
> > >   - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
> > >   - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
> > >   - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v=
2-0-c28c44053cf3%40rong.moe
> > > - Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
> > > ---
> > >  drivers/platform/x86/lenovo/ideapad-laptop.c | 112 +++++++++++++++++=
+++++++---
> > >  1 file changed, 103 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/p=
latform/x86/lenovo/ideapad-laptop.c
> > > index 66e16abda5e3..253d2962b927 100644
> > > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > > @@ -1714,9 +1714,58 @@ static int ideapad_kbd_bl_led_cdev_brightness_=
set(struct led_classdev *led_cdev,
> > >  {
> > >  =09struct ideapad_private *priv =3D container_of(led_cdev, struct id=
eapad_private, kbd_bl.led);
> > > =20
> > > +=09/*
> > > +=09 * When deinitializing: It must be the side effect of led_cdev
> > > +=09 * unregistration when our private trigger is active. We've set
> > > +=09 * LED_RETAIN_AT_SHUTDOWN to retain led_cdev brightness level.
> > > +=09 * To do the same for auto mode, gate changes and return early.
> > > +=09 */
> > > +=09if (unlikely(!priv->kbd_bl.initialized))
> >=20
> > This too would need include, but I think addressing some earlier includ=
e=20
> > request will cover it.
> >=20
> > > +=09=09return 0;
> > > +
> > >  =09return ideapad_kbd_bl_brightness_set(priv, brightness);
> > >  }
> > > =20
> > > +static bool ideapad_kbd_bl_auto_trigger_offloaded(struct led_classde=
v *led_cdev)
> > > +{
> > > +=09struct ideapad_private *priv =3D container_of(led_cdev, struct id=
eapad_private, kbd_bl.led);
> >=20
> > Add include for container_of().
> >=20
> > > +
> > > +=09return atomic_read(&priv->kbd_bl.last_hw_brightness) =3D=3D KBD_B=
L_AUTO_MODE_HW_BRIGHTNESS;
> > > +}
> > > +
> > > +static int ideapad_kbd_bl_auto_trigger_activate(struct led_classdev =
*led_cdev)
> > > +{
> > > +=09struct ideapad_private *priv =3D container_of(led_cdev, struct id=
eapad_private, kbd_bl.led);
> > > +
> > > +=09return ideapad_kbd_bl_hw_brightness_set(priv, KBD_BL_AUTO_MODE_HW=
_BRIGHTNESS);
> > > +}
> > > +
> > > +static struct led_hw_trigger_type ideapad_kbd_bl_auto_trigger_type;
> > > +
> > > +static struct led_trigger ideapad_kbd_bl_auto_trigger =3D {
> > > +=09.name =3D "ideapad-auto",
> > > +=09.trigger_type =3D &ideapad_kbd_bl_auto_trigger_type,
> > > +=09.activate =3D ideapad_kbd_bl_auto_trigger_activate,
> > > +=09.offloaded =3D ideapad_kbd_bl_auto_trigger_offloaded,
> > > +};
> > > +
> > > +static bool ideapad_kbd_bl_auto_trigger_registered;
> > > +
> > > +static void ideapad_kbd_bl_notify_hw_control(struct ideapad_private =
*priv,
> > > +=09=09=09=09=09     int hw_brightness, int last_hw_brightness)
> > > +{
> > > +=09bool hw_control, last_hw_control;
> > > +
> > > +=09if (priv->kbd_bl.type !=3D KBD_BL_TRISTATE_AUTO)
> > > +=09=09return;
> > > +
> > > +=09hw_control =3D hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGHTNES=
S;
> > > +=09last_hw_control =3D last_hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW=
_BRIGHTNESS;
> > > +
> > > +=09if (hw_control !=3D last_hw_control)
> > > +=09=09led_trigger_notify_hw_control_changed(&priv->kbd_bl.led, hw_co=
ntrol);
> > > +}
> > > +
> > >  static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
> > >  {
> > >  =09int hw_brightness, brightness, last_hw_brightness;
> > > @@ -1738,6 +1787,8 @@ static void ideapad_kbd_bl_notify(struct ideapa=
d_private *priv)
> > >  =09if (hw_brightness =3D=3D last_hw_brightness)
> > >  =09=09return;
> > > =20
> > > +=09ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_bri=
ghtness);
> > > +
> > >  =09led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brig=
htness);
> > >  }
> > > =20
> > > @@ -1768,6 +1819,24 @@ static int ideapad_kbd_bl_init(struct ideapad_=
private *priv)
> > > =20
> > >  =09switch (priv->kbd_bl.type) {
> > >  =09case KBD_BL_TRISTATE_AUTO:
> > > +=09=09priv->kbd_bl.led.max_brightness =3D 2;
> > > +
> > > +=09=09if (!ideapad_kbd_bl_auto_trigger_registered) {
> > > +=09=09=09dev_warn(&priv->platform_device->dev,
> > > +=09=09=09=09 "Could not provide LED trigger %s for keyboard backligh=
t\n",
> > > +=09=09=09=09 ideapad_kbd_bl_auto_trigger.name);
> > > +=09=09=09break;
> > > +=09=09}
> > > +
> > > +=09=09priv->kbd_bl.led.flags             |=3D LED_TRIG_HW_CHANGED;
> > > +=09=09priv->kbd_bl.led.hw_control_trigger =3D ideapad_kbd_bl_auto_tr=
igger.name;
> > > +=09=09priv->kbd_bl.led.trigger_type       =3D &ideapad_kbd_bl_auto_t=
rigger_type;
> >=20
> > I'm skeptical aligning makes things better here.
> >=20
> > > +
> > > +=09=09/* Hardware remembers the last brightness level, including aut=
o mode. */
> > > +=09=09if (hw_brightness =3D=3D KBD_BL_AUTO_MODE_HW_BRIGHTNESS)
> > > +=09=09=09priv->kbd_bl.led.default_trigger =3D ideapad_kbd_bl_auto_tr=
igger.name;
> > > +
> > > +=09=09break;
> > >  =09case KBD_BL_TRISTATE:
> > >  =09=09priv->kbd_bl.led.max_brightness =3D 2;
> > >  =09=09break;
> > > @@ -1779,13 +1848,22 @@ static int ideapad_kbd_bl_init(struct ideapad=
_private *priv)
> > >  =09=09unreachable();
> > >  =09}
> > > =20
> > > -=09err =3D led_classdev_register(&priv->platform_device->dev, &priv-=
>kbd_bl.led);
> > > -=09if (err)
> > > -=09=09return err;
> > > +=09/* Queue notifications, as kbd_bl.initialized is about to be set.=
 */
> > > +=09guard(mutex)(&priv->kbd_bl.notif_mutex);
> > > =20
> > > +=09/*
> > > +=09 * Setting kbd_bl.initialized after led_classdev_register() could=
 lead
> > > +=09 * to race conditions in ideapad_kbd_bl_led_cdev_brightness_set()=
 where
> > > +=09 * kbd_bl.initialized is checked, so set it now. It can be revert=
ed back
> > > +=09 * if the LED classdev failed to register.
> > > +=09 */
> > >  =09priv->kbd_bl.initialized =3D true;
> > > =20
> > > -=09return 0;
> > > +=09err =3D led_classdev_register(&priv->platform_device->dev, &priv-=
>kbd_bl.led);
> > > +=09if (err)
> > > +=09=09priv->kbd_bl.initialized =3D false;
> > > +
> > > +=09return err;
> > >  }
> > > =20
> > >  static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
> > > @@ -2612,17 +2690,30 @@ static int __init ideapad_laptop_init(void)
> > >  {
> > >  =09int err;
> > > =20
> > > +=09err =3D led_trigger_register(&ideapad_kbd_bl_auto_trigger);
> > > +=09if (err) {
> > > +=09=09pr_warn("Failed to register LED trigger %s: %d\n",
> >=20
> > include missing.
> >=20
> > > +=09=09=09ideapad_kbd_bl_auto_trigger.name, err);
> > > +=09} else {
> > > +=09=09ideapad_kbd_bl_auto_trigger_registered =3D true;
> > > +=09}
> > > +
> > >  =09err =3D ideapad_wmi_driver_register();
> > >  =09if (err)
> > > -=09=09return err;
> > > +=09=09goto err_ledtrig;
> > > =20
> > >  =09err =3D platform_driver_register(&ideapad_acpi_driver);
> > > -=09if (err) {
> > > -=09=09ideapad_wmi_driver_unregister();
> > > -=09=09return err;
> > > -=09}
> > > +=09if (err)
> > > +=09=09goto err_wmi;
> > > =20
> > >  =09return 0;
> > > +
> > > +err_wmi:
> > > +=09ideapad_wmi_driver_unregister();
> > > +err_ledtrig:
> > > +=09if (ideapad_kbd_bl_auto_trigger_registered)
> > > +=09=09led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
> > > +=09return err;
> > >  }
> > >  module_init(ideapad_laptop_init)
> > > =20
> > > @@ -2630,6 +2721,9 @@ static void __exit ideapad_laptop_exit(void)
> > >  {
> > >  =09ideapad_wmi_driver_unregister();
> > >  =09platform_driver_unregister(&ideapad_acpi_driver);
> >=20
> > Why is the order not the reverse of the init order?
>=20
> Thanks for discovering it. Since it exists before the series, I guess I
> will submit a fixup patch for it separately so that it don't have to
> wait for an RFC series.

A separate patch works. I assume this series won't make it into this=20
cycle.

> And ACK to all other comments in this and previous replies. Will fix
> them when I resubmit the series.
>=20
> Thanks,
> Rong
>=20
> >=20
> > > +
> > > +=09if (ideapad_kbd_bl_auto_trigger_registered)
> > > +=09=09led_trigger_unregister(&ideapad_kbd_bl_auto_trigger);
> > >  }
> > >  module_exit(ideapad_laptop_exit)
> > > =20
> > >=20
> > >=20
>=20

--=20
 i.

--8323328-847042249-1784707723=:1198--
