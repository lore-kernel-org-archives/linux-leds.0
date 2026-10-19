Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E224E73C1
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411139; cv=pass; b=jXMEnnR+6da/D1ZFiPkqdaLQ7LGTLpg4mj2qpCNlio9RhvjuOXZugDA1rk56Rz7ynGutKnAX2MQQWzltWWaNWAgU9efFt7NdwDe1AHeA9cZ87VCtiyYrp3xacBqra3I1atXcdAncv+9EuTuB42zdrR2i2Nsa68IAnG0ka4Rr3po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411139; c=relaxed/simple;
	bh=jT1eHC/10krFlVRF1b+GFfv8poOs3O5yJluApzOCVkc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WWjW+JGiHN4QX7nyDly6OVV3iB51SgaiXCqOIafRVxHNExVAoLOvNEVXt9/wMFf02PjIjzCHDldYbdQKbcw+rEEqyIGEFFwvqbSQOJhNp4ZuOlD9K1Uxz02l2MOApXmQDVTK9Y7jG1MnkfRnquFsAbzFVDx8VBcbQORglvgFhww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=DOfy6Aa2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="DOfy6Aa2"
ARC-Seal: i=1; a=rsa-sha256; t=1792411131; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UFGwLHm2/kwccG1MXHTkYxUA1jDTf8/ne874ZkL+aXFWT76Cy/5e3qZxUcBZFxWSyeiwWotqFJ2OMTIC4fwsB4HnvdWSX3N2oQqKFU8A37etRAktyMiRBZR37JU+LH5GGDm4dxfq9Q+7bZ9hRD4owLvwmR0QtuZxuRDuJhbA9NI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792411131; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nq7euQTw6ZpfHdh3BCc2Zda8nIWDuimwVYJsLPegZpk=; 
	b=AnJKrAZwahNhiF3b+LjvE7VKiFXsNZksBtwfmlTKt/gLkqFGcBgpoatBIIE7u+mg0SQrn1NP0PmBOBwSt8+l+GWyKUh4po98nbMlvyV3kK6GzHauPw01O14u5nhkNTlGF9M49WwflH8il/pNNKMGUsvfvnYUGt5W569qRamPGLs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792411131;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=nq7euQTw6ZpfHdh3BCc2Zda8nIWDuimwVYJsLPegZpk=;
	b=DOfy6Aa20SR/3NCTPkAQDWnno3gisiDhzV9Li4AvXPnrjE94u8ceIfpB+pQVLVsP
	zhmj2/qtFPEthPWaNMEzNgiDMJIUXf2sx3JLUCfjhTckW5g6GzQT3UKWvNDQHryV4C2
	XzH3kTSZHczlkNCA0r10KBXv0IIRBp0pgUwqOpZkiVTpIoXw/n8LClaPRoIKlrKqPEn
	keNW9acwajJUSo6wqUSBJ/kj8dQk8VQ0PEMVwaW9b3IpogqcowckjNnb6u4FVZP8g71
	7Sr6XWlTospQGpl1SnR5X4/r2YtY3RnMOSbVcXXbAVf0+qqD9+wSk8GKViXTWUi24Km
	IoIsF63+VQ==
Received: by smtp.zohomail.com with SMTPS id 1792411128251755.7737559520135;
	Mon, 19 Oct 2026 04:58:48 -0700 (PDT)
Message-ID: <24d07a72cfdfb39963fc3771fc105deb3b2eaddc.camel@rong.moe>
Subject: Re: [PATCH 06/10] leds: class: Take the LED access lock when
 reading brightness_hw_changed
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <81e458c4-b9c9-4881-b669-16c87171046f@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
	 <20261018135339.1109271-7-W_Armin@gmx.de>
	 <sashiko-outbox-176178@kernel.org>
	 <81e458c4-b9c9-4881-b669-16c87171046f@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:53:35 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Armin,

On Sun, 2026-10-18 at 19:08 +0200, Armin Wolf wrote:
> Am 18.10.26 um 16:03 schrieb sashiko-bot@kernel.org:
>=20
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] leds: one-sided locking in brightness_hw_changed_show()
> > --
> >=20
> > commit ef875f7f46dcbf0a55900c763a37bd3cfcb02775
> > Author: Armin Wolf <W_Armin@gmx.de>
> >=20
> > leds: class: Take the LED access lock when reading brightness_hw_change=
d
> >=20
> > This patch acquires the led_cdev->led_access mutex in
> > brightness_hw_changed_show() to guard reading brightness_hw_changed
> > against concurrent updates by led_classdev_notify_brightness_hw_changed=
().
> >=20
> > > diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> > > index e1f1b710536b0..77a0fce039528 100644
> > > --- a/drivers/leds/led-class.c
> > > +++ b/drivers/leds/led-class.c
> > [ ... ]
> > > @@ -102,11 +103,15 @@ static ssize_t brightness_hw_changed_show(struc=
t device *dev, const struct devic
> > >   					  char *buf)
> > >   {
> > >   	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > > +	unsigned int brightness_hw_changed;
> > >  =20
> > > -	if (led_cdev->brightness_hw_changed =3D=3D -1)
> > > +	scoped_guard(mutex, &led_cdev->led_access)
> > > +		brightness_hw_changed =3D led_cdev->brightness_hw_changed;
> > > +
> > > +	if (brightness_hw_changed =3D=3D -1)
> > >   		return -ENODATA;
> > >  =20
> > > -	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
> > > +	return sysfs_emit(buf, "%u\n", brightness_hw_changed);
> > >   }
> > >  =20
> > >   static const DEVICE_ATTR_RO(brightness_hw_changed);
> > [Severity: Medium]
> > Does taking led_cdev->led_access here actually synchronize against
> > led_classdev_notify_brightness_hw_changed()?
> >=20
> > Looking at drivers/leds/led-class.c, the writer updates
> > led_cdev->brightness_hw_changed without holding led_cdev->led_access:
> >=20
> > void led_classdev_notify_brightness_hw_changed(struct led_classdev *led=
_cdev, unsigned int brightness)
> > {
> > 	led_cdev->brightness_hw_changed =3D brightness;
> > 	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
> > }
> >=20
> > In addition, most callers invoke led_classdev_notify_brightness_hw_chan=
ged()
> > without holding led_cdev->led_access, such as t14s_kbd_bl_update() in
> > drivers/platform/arm64/lenovo-thinkpad-t14s.c:
> >=20
> > static void t14s_kbd_bl_update(struct t14s_ec *ec)
> > {
> > 	enum led_brightness brightness =3D t14s_kbd_bl_get(&ec->kbd_backlight)=
;
> >=20
> > 	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, brightne=
ss);
> > }
> >=20
> > Some callers also run in atomic context where a sleeping mutex cannot b=
e
> > taken, such as lg_g15_raw_event() -> lg_g13_event() in
> > drivers/hid/hid-lg-g15.c:
> >=20
> > 	if (backlight_disabled ^ g15->backlight_disabled) {
> > 		led_classdev_notify_brightness_hw_changed(
> > 			&g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev.led_cdev,
> > 			backlight_disabled
> > 			? 0 : g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
> > 		g15->backlight_disabled =3D backlight_disabled;
> > 	}
> >=20
> > Meanwhile, uniwill_ec_notify() in drivers/platform/x86/uniwill/uniwill-=
acpi.c
> > already holds led_cdev->led_access across the call:
> >=20
> > 	guard(mutex)(&led_cdev->led_access);
> >=20
> > 	/* Sync the LED brightness with the actual hardware state */
> > 	ret =3D led_update_brightness(led_cdev);
> > 	if (ret < 0)
> > 		return ret;
> >=20
> > 	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
> >=20
> > Since the writer side does not consistently hold led_cdev->led_access (=
and
> > cannot take it inside led_classdev_notify_brightness_hw_changed() witho=
ut
> > sleeping in atomic context or deadlocking uniwill_ec_notify()), should
> > brightness_hw_changed_show() and led_classdev_notify_brightness_hw_chan=
ged()
> > use READ_ONCE() and WRITE_ONCE() instead, similar to how trigger_hw_cha=
nged
> > is handled in drivers/leds/led-triggers.c?
>=20
> I am not sure if READ_ONCE() guarantees atomic behavior here. What do the=
 LED
> subsystem maintainers say?

While I am not a maintainer, paired READ_ONCE() and WRITE_ONCE() is
usually sufficient, as the attribute is only a hint for userspace OSD.

The memory access itself is inherently atomic, i.e., neither a RMW
operation nor a split R/W. Since the led_cdev->brightness_hw_changed is
never used to synchronize other things, no memory barrier is needed here.
Using rwonce prevents the compiler from reordering memory access, which
fulfills our requirements.

Thanks,
Rong

>=20
> Thanks,
> Armin Wolf
