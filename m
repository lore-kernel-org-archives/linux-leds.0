Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81976381AFF
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333264; cv=none; b=WYNu+JyYN8IcrhEOsDTpDs2/l7z1p3FEuNOWUEq0k+LY1BoZAvu0R/Y66hX6hU8bjxU9LWBRKHLAMQ99QsqoIYxoAFQI/WwYxS9XHvZojjE5hxIHVeC6pslmk1fTllHJjvJa4WbhobAcf1Dvkg6G4migSU36u1dfgX1TZNcunXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333264; c=relaxed/simple;
	bh=TVQqsHLK6Ga4Q8GN2QLSgALstUeBECxfdgwN2BCfC/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bZU7QjcF4hl7Ih1CafuRhVNX0VIFUBraAb5cHFaOcNuGQqi3pQ2Rnd0NiU7tOvazw29pQWK52SMEu29Tgui7lfvhvrDEOEtcGuBVRiix49t1IkjTGtTXTW+C/GvgML+OVFUD+shnSD/YDRFFHN2Jo7GP6Vk4s3vaqH+8VWAm1Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFmKNfs6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFmKNfs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FB31F00A3A;
	Fri, 21 Aug 2026 17:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333263;
	bh=kXokMwLtHJinmnz+Kz8wPHRIi/Fx2p5JDw42/gGLXJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZFmKNfs6iNOuRxAjwYc3oFk5dpzBrLkCO+SPLy35ioUNiwjM4bsGyMlnxmDCv7T3Q
	 kNxS+mNPNUfwk2ZhBOI/cVQNLOFfLwojFSAvCwsSs7Xt0tHkW56F0Qm9LewvwpaI54
	 SfjYfMgheWqpA2r5DXE+HJi0eJzqgDb+5t5rqCkVRUZNQbQueeL2wpSRYx+uUzxvEp
	 P1OVDvIsCVTqgyfDjh12W5Njy08NRUNyAR7Fcnt9VSvkL+hedFij84wqQQ1y2p/TAR
	 DkQkmWWSSa8ZYQ6eEV5yZxRgskAbtyTjsSL2bNto6xr3hm/Li90lJNP1wdxNUMF1+1
	 XtFEuLYtFXDfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/12] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-12-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-12-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:42 +0000
Message-Id: <20260821172742.F3FB31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware brightness state falls out of sync with `last_hw_bright=
ness` due to a TOCTOU race between ACPI notify and sysfs write.
--

--- Patch [12]: [PATCH v5 12/12] platform/x86: ideapad-laptop: Fully suppor=
t auto keyboard backlight ---
commit 775eb668f48ee8e4ee7f513342cb65f613086809
Author: Rong Zhang <i@rong.moe>

platform/x86: ideapad-laptop: Fully support auto keyboard backlight

This commit adds support for the auto brightness mode of the keyboard
backlight on IdeaPad laptops. It introduces a private hardware control
trigger to handle the auto mode and blocks brightness changes on exit
to retain state across boots.

> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 7f7b1e30c3263..5442cbfe3969b 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c

[ ... ]

> @@ -1739,6 +1790,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_pr=
ivate *priv)
>  	if (hw_brightness =3D=3D last_hw_brightness)
>  		return;
> =20
> +	ideapad_kbd_bl_notify_hw_control(priv, hw_brightness, last_hw_brightnes=
s);
> +

[Severity: Medium]
Can a race condition here cause the hardware brightness state to permanently
fall out of sync with the internal tracker?

Looking at ideapad_kbd_bl_notify(), it reads the current hardware brightness
and then updates the tracker using atomic_xchg():

ideapad_kbd_bl_notify() {
    ...
    hw_brightness =3D ideapad_kbd_bl_hw_brightness_get(priv);
    ...
    last_hw_brightness =3D atomic_xchg(&priv->kbd_bl.last_hw_brightness, hw=
_brightness);
}

If a concurrent sysfs write triggers ideapad_kbd_bl_hw_brightness_set()
in the middle of this process, could we see this sequence:

Thread 1 (ideapad_kbd_bl_notify):
    Reads hw_brightness (e.g., 1)

Thread 2 (sysfs write):
    Calls ideapad_kbd_bl_hw_brightness_set()
    Sets actual hardware brightness to 3 (auto mode)
    Calls atomic_set(&priv->kbd_bl.last_hw_brightness, 3)

Thread 1 (ideapad_kbd_bl_notify resumes):
    Calls atomic_xchg(&priv->kbd_bl.last_hw_brightness, 1)

Wouldn't Thread 1 blindly overwrite the correct atomic state (3) with the
stale read state (1)?=20

This seems like it would permanently desync the last_hw_brightness tracker
from the actual hardware, breaking ideapad_kbd_bl_auto_trigger_offloaded()
which would now falsely report that the trigger is not offloaded.

>  	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness=
);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D12
