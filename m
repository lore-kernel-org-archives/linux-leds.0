Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C12537DE84
	for <linux-leds@vger.kernel.org>; Sat, 22 Aug 2026 20:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787430718; cv=pass; b=Yah+Ihevocdvbud6RFkDpOGyof+TVxZR5qP8yiF7rK4tY50eAoLIVqnCgUJR8G26OC0GYl+coq/RIdTchz4VTzWieQay02Ci2sz21wsyWcEMwrOvH5fUQfnPGjv58rDS7DUEe3wcpVkV7c90sxP6pxIMhXy7r444gFOO7lqHlKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787430718; c=relaxed/simple;
	bh=Gd5wPNxKM3Xn7HAteOv/M+uLlkzSW832aI+Bs3TOIXg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CQrfdhT9DSn+8SVj9PsJ+rQYEYz+ZuTuhTh13Cynac09x8Y+M2rR4Bv8ibkF3fvULI+CQdMNZwTgYc9UHAwVzY2BGTcXA21ZCCFDiwFSk2Bkt8SRu7nxp7qeLoh/PMo7vBxHSiHyRRUFtHEjcbaGmmXzbdv+5cgh4yJRnqvo3to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=GYYNzmk5; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="GYYNzmk5"
ARC-Seal: i=1; a=rsa-sha256; t=1787430712; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FNHBvD5qis5b7M9+3Yej8L0YaL9QWU0ZvXNQ6nf7uEz1/CkMdXuxF9P0L26Owi26kZ2+ZsYQXoYX8iEA03LhbU+XpCJO1sATl+0p6DTRynZ3JLVAuewn6jeJQMqJhxqK9hkfsvuKhVFsnH1I1jacmwS22LFvMZ1+S9AYNQxZA1E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787430712; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8MprMeXo4N7sgrkHBT5SYGyTPC3NdBhXHg7U8DzoUL0=; 
	b=i97MixhVUM266+s0m0QO0TDxXWoaqN1spiy1TC/OtkZ/VbhEal3GQxkm6PLqPeKnVOEM4j4Pfod6T0peooED9zPIiul/HX+6hfgXgPeZPqrOkdVu3iySLd4SHJKsyB170SnCNo1Om4aU0TxsYlGl8sN2p84lsBH6vbKo+uqn3Lw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787430712;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=8MprMeXo4N7sgrkHBT5SYGyTPC3NdBhXHg7U8DzoUL0=;
	b=GYYNzmk5+AGQ0Ha3wZCrQJ2VFfr046PACi/j+25rovgfTUstzGmGob3ueCEjLc5i
	vdkP8GWv6O41J8mIv/A2x36/mtWNVNEBk2IBeG8ndlA8x6vdbFqvV1D7NLECbxox//E
	VuRBkcgocne2sMwUInq8aaANhW/wdbp49Plxbs6q0hNOaVr/lZVYkhVtG0H9bpOJ5X0
	O7D1vObj0amaESUIvjgBdvnQKa9eiQNsKfwDyzrEMHudY9ND4GXfpcVMBaIYSn4EFhA
	8i1irw0FnAX5zYLAGe8ZaHHR+aS+LWmMfVsKc6GJcj7k+KAuL6vno2hF/Z+FE2Kb1aO
	80H12Ondbg==
Received: by mx.zohomail.com with SMTPS id 1787430708831565.9469100220783;
	Sat, 22 Aug 2026 13:31:48 -0700 (PDT)
Message-ID: <434de30b4a6975a245263c72af6f1c94b994ba7e.camel@rong.moe>
Subject: Re: [PATCH v5 10/12] platform/x86: ideapad-laptop: Decouple
 hardware & classdev brightness for keyboard backlight
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821172741.010471F00A3D@smtp.kernel.org>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
		 <20260821-leds-trigger-hw-changed-v5-10-3e00d6c4a936@rong.moe>
		 <20260821172741.010471F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 04:26:13 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi all,

On Fri, 2026-08-21 at 17:27 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] The conversion of `last_hw_brightness` to an `atomic_t` fails to=
 prevent a TOCTOU (Time-Of-Check to Time-Of-Use) race condition between ACP=
I notifications and sysfs brightness writes, violating core kernel locking =
rules.

Please see my reply to Sashiko's review to PATCH 12.

Thanks,
Rong

> --
>=20
> --- Patch [10]: [PATCH v5 10/12] platform/x86: ideapad-laptop: Decouple h=
ardware & classdev brightness for keyboard backlight ---
> commit b73007a6498db545468f511c09a496e09dfcac31
> Author: Rong Zhang <i@rong.moe>
>=20
> platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for=
 keyboard backlight
>=20
> This commit decouples hardware brightness from LED classdev brightness fo=
r
> the keyboard backlight. It also converts last_hw_brightness into an atomi=
c_t
> to help prevent potential race conditions.
>=20
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/pla=
tform/x86/lenovo/ideapad-laptop.c
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> [ ... ]
> > @@ -1637,32 +1676,37 @@ static enum led_brightness ideapad_kbd_bl_led_c=
dev_brightness_get(struct led_cla
> >  	return ideapad_kbd_bl_brightness_get(priv);
> >  }
> > =20
> > -static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv,=
 unsigned int brightness)
> > +static int ideapad_kbd_bl_hw_brightness_set(struct ideapad_private *pr=
iv, int hw_brightness)
> >  {
> [ ... ]
> >  	if (err)
> >  		return err;
> > =20
> > -	priv->kbd_bl.last_brightness =3D brightness;
> > +	atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
> > =20
> >  	return 0;
> >  }
> [ ... ]
> > @@ -1673,26 +1717,29 @@ static int ideapad_kbd_bl_led_cdev_brightness_s=
et(struct led_classdev *led_cdev,
> > =20
> >  static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
> >  {
> > -	int brightness;
> > +	int hw_brightness, brightness, last_hw_brightness;
> > =20
> >  	if (!priv->kbd_bl.initialized)
> >  		return;
> > =20
> > -	brightness =3D ideapad_kbd_bl_brightness_get(priv);
> > -	if (brightness < 0)
> > +	hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
> > +	if (hw_brightness < 0)
> >  		return;
> > =20
> > -	if (brightness =3D=3D priv->kbd_bl.last_brightness)
> > -		return;
> > +	brightness =3D ideapad_kbd_bl_brightness_parse(priv, hw_brightness);
> > +	if (brightness < 0)
> > +		return; /* Reject insane values early. */
> > =20
> > -	priv->kbd_bl.last_brightness =3D brightness;
> > +	last_hw_brightness =3D atomic_xchg(&priv->kbd_bl.last_hw_brightness, =
hw_brightness);
>=20
> [Severity: High]
> This is a pre-existing issue, but does converting last_hw_brightness to a=
n
> atomic_t fully prevent a time-of-check to time-of-use race condition here=
?
>=20
> Since the hardware read and the atomic_xchg() are separate steps, could
> the following sequence occur?
>=20
> CPU1 in ideapad_kbd_bl_notify():
>     hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
>=20
> CPU2 in ideapad_kbd_bl_hw_brightness_set() via concurrent sysfs write:
>     exec_kblc(priv->adev->handle, value);
>     atomic_set(&priv->kbd_bl.last_hw_brightness, hw_brightness);
>=20
> CPU1 resumes in ideapad_kbd_bl_notify():
>     last_hw_brightness =3D atomic_xchg(&priv->kbd_bl.last_hw_brightness, =
hw_brightness);
>=20
> In this scenario, wouldn't CPU1 overwrite the software cache with a stale
> hardware state, causing it to become permanently desynchronized from the
> actual hardware?
>=20
> Although follow-up patches in this series introduce a notif_mutex, does
> the sysfs write path ever acquire this mutex to serialize these updates
> properly?
>=20
> > +	if (hw_brightness =3D=3D last_hw_brightness)
> > +		return;
> > =20
> >  	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightne=
ss);
> >  }
