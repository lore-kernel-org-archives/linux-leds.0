Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C1C2C1586
	for <linux-leds@vger.kernel.org>; Sat, 22 Aug 2026 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787430651; cv=pass; b=ezIA2oXvA3Dru8frTtWdEuXH+xEQjQrlAZAaG3siqayfa/SJ4Yl8s/A0DfQgoBoOeCSL1ZrQJIByODIektbG8T5eC86gI82rjgbWT4rZshqX2YIxiptKaemtCx4Fx5sMEYZ+KPUvmmLiKOzIpK4GwU3kqB26uT6D16LByKlDOSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787430651; c=relaxed/simple;
	bh=RiOYqWQvQFsFsXmt0GDV2rKtNNV6N95t1SlbJQ3NUlk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KKVMf1SRyaY6LWa1xhv4C29XV8OUiDH1FeYpSQOAuIwrU6WD1aWCqEBTYHTcFxwxpVsbYrJ7Zd7Br2rroYnzOVvTHFqwQYD38mRJ/kQz+Tc7ZBRxXNax1CDyj++rxU6Poy5DqD0PQdpq2Q14T1HXAPdt2g1+OYNO2gKRyEF99UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=BeI05LOp; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="BeI05LOp"
ARC-Seal: i=1; a=rsa-sha256; t=1787430642; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kpQWKCMQMia0BvcUkwpx/tpv1bhDzQiiGkASivVU+ugzYmfnmT+Qm1qU+GUbv0JimdNJZYZLHSBH79Ayozdy1HEUU6blx4MlnjDBKvO14ZggfsZXJYdzdPfOZgD9RHnveFfEac27sQzoqZgaBcj1zSuWTnUj2v07BhX0ZFdgL/g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787430642; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7zKGIXidZl+c58m7klxlfFNuSDqERNV+YNYWDeH5K4w=; 
	b=mWeHC48Lq1kwzIzRcgt7VG9kMg/RlRvF9cFMy2OsufVqGSwdp8jLbZ4oEhaPbJrL3gcTfnIli/MaWAI3O3C1T/Dx2SoqgRIgseQzFBKrcHPu+/G9n74WM12LkpKpEBiuegSljcKg0XQTggN5Stgc7z1nLWAngbG3RjQ2N8D8MGk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787430642;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=7zKGIXidZl+c58m7klxlfFNuSDqERNV+YNYWDeH5K4w=;
	b=BeI05LOpZ01F+osXgPFO1LprvfUHGCu7AwsL0DjsNXJ1Hk/RmF1E+jK7DIRVGS9I
	nH3s2eza0qS1APrIIZ4/ycwXWbOZj64tJFfE/v+Jyq574Z2u7FIF2pOVI/iwGM2g6yr
	TURHc6NzpRg+046Mj/Fz66UODH9DnGgiyWPDUEPKue+VxrhMQ3OOi92z9fidn2BgNtm
	fXac3CcLYQJDfdUdN8LB4/56antfYnyEMy0sY0/Xli4l9Eh2tbbLHqnpghfdy3hAkyT
	qjuu9leeff8pGRO3ASeRzI26FgBGkLFQSoTUMADuTjobhS0yO60OnsKC5czYN2Ta7h7
	fnIg5dNj/Q==
Received: by mx.zohomail.com with SMTPS id 1787430639228857.6143595846065;
	Sat, 22 Aug 2026 13:30:39 -0700 (PDT)
Message-ID: <e2b081dfd8f96511a73b86ab3ec75e5cd759b79b.camel@rong.moe>
Subject: Re: [PATCH v5 12/12] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821172742.F3FB31F00A3A@smtp.kernel.org>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
	 <20260821-leds-trigger-hw-changed-v5-12-3e00d6c4a936@rong.moe>
	 <20260821172742.F3FB31F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 04:25:31 +0800
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
> - [Medium] Hardware brightness state falls out of sync with `last_hw_brig=
htness` due to a TOCTOU race between ACPI notify and sysfs write.
> --
>=20
> --- Patch [12]: [PATCH v5 12/12] platform/x86: ideapad-laptop: Fully supp=
ort auto keyboard backlight ---
> commit 775eb668f48ee8e4ee7f513342cb65f613086809
> Author: Rong Zhang <i@rong.moe>
>=20
> platform/x86: ideapad-laptop: Fully support auto keyboard backlight
>=20
> This commit adds support for the auto brightness mode of the keyboard
> backlight on IdeaPad laptops. It introduces a private hardware control
> trigger to handle the auto mode and blocks brightness changes on exit
> to retain state across boots.
>=20
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/pla=
tform/x86/lenovo/ideapad-laptop.c
> > index 7f7b1e30c3263..5442cbfe3969b 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
>=20
> [ ... ]
>=20
> > @@ -1739,6 +1790,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_=
private *priv)
> >  	if (hw_brightness =3D=3D last_hw_brightness)
> >  		return;
> > =20
> > +	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_brightn=
ess);
> > +
>=20
> [Severity: Medium]
> Can a race condition here cause the hardware brightness state to permanen=
tly
> fall out of sync with the internal tracker?
>=20
> Looking at ideapad_kbd_bl_notify(), it reads the current hardware brightn=
ess
> and then updates the tracker using atomic_xchg():
>=20
> ideapad_kbd_bl_notify() {
>     ...
>     hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
>     ...
>     last_hw_brightness =3D atomic_xchg(&priv->kbd_bl.last_hw_brightness, =
hw_brightness);
> }
>=20
> If a concurrent sysfs write triggers ideapad_kbd_bl_hw_brightness_set()
> in the middle of this process, could we see this sequence:
>=20
> Thread 1 (ideapad_kbd_bl_notify):
>     Reads hw_brightness (e.g., 1)
>=20
> Thread 2 (sysfs write):
>     Calls ideapad_kbd_bl_hw_brightness_set()
>     Sets actual hardware brightness to 3 (auto mode)
>     Calls atomic_set(&priv->kbd_bl.last_hw_brightness, 3)
>=20
> Thread 1 (ideapad_kbd_bl_notify resumes):
>     Calls atomic_xchg(&priv->kbd_bl.last_hw_brightness, 1)
>=20
> Wouldn't Thread 1 blindly overwrite the correct atomic state (3) with the
> stale read state (1)?=20
>=20
> This seems like it would permanently desync the last_hw_brightness tracke=
r
> from the actual hardware, breaking ideapad_kbd_bl_auto_trigger_offloaded(=
)
> which would now falsely report that the trigger is not offloaded.

Well, the concern is valid, Thread 1 could disable the private trigger
after Thread 2 activating it, but the hardware state is still auto due to
__led_trigger_set being called with hw_triggered =3D=3D true.

led_trigger_notify_hw_control_changed() calls
ideapad_kbd_bl_hw_brightness_set(), that's why the latter is not
protected by the newly introduced notif_mutex.

Maybe we would need to introduce a workqueue deferral mechanism to
resolve that, as Sashiko suggested in the reply to v4...

Thanks,
Rong

>=20
> >  	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightne=
ss);
> >  }
