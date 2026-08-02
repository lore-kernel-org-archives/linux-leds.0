Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F9233926
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691909; cv=none; b=P1qOrJm9LofWMlHNH3TgBJBCPd9Tfscsi31j0CVggXd8M7HKtcREYFz+gSsrD1m7qlm2bOdIsyBOiDKUMjnnPhcc64esdFL2wG5MtA9glnKLgiYCxm7Apf9+neYiD+NswuihgLVVTIqMeUTK3e7N1I3pULFQwQ4KyBGhAsVQ0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691909; c=relaxed/simple;
	bh=SnqWdYdBy/2IT/Ezy/cRwNP3DDM/Lj0jjgluYPsDCJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LQKC/1EKaPeSb6SWMVwxrybgUJkiOr0IUuZMsUkYt9MelIT43DTBBo2E00MlG316Pnoid9JzPxsighYYoSleNVA+8jd1O7VLhotwcv4RHcCDNktFFpBwbjRnlRjc+XoMBMzoflzZNPkDd9wVC2DtBAn006K2bPR8cw0gmA1lgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYKAO3xD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYKAO3xD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE361F000E9;
	Sun,  2 Aug 2026 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691908;
	bh=2rbfIly0X6OQLMk4f1PTixgZoOkVNHtrSu0wusR5Jls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JYKAO3xDYcfvOZzagpc9k34yyJmV6mqytU6cnK6hyBQaSaOF72uj4pqMi5u4YqBxb
	 qCzFNpI1Eaop2O/NCkodhv5IHFrrAVcCrBmYZZAnWxf+XbbeXWcJi1b4/52ipUyjUk
	 YS3Xp2Eq4NJ106JC86585swy1wLMV1t/jGbzvRX0WGCvb1HqBbQzcRFXAH3gYOmEFQ
	 JJMXN2/1I63DDBEhOCvP4Q8gNwQuE7e5cvlKjaaqbpjIoJngFtfm9i7MDOVGhVCrZW
	 cBQ06qep5RIwf1qjfHa3Oh3H2NwSDz+IX271j7/ECBaW01FZbVstsmHXjZpAN0SGPo
	 gUgOtKDiHfahA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/12] leds: cros_ec: Implement offloaded() trigger
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-4-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-4-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:47 +0000
Message-Id: <20260802173147.EAE361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Registering a global static `led_trigger` structure in a driver's =
probe function causes list corruption and lock re-initialization if the dri=
ver is probed multiple times.
--

--- Patch [4]: [PATCH v4 04/12] leds: cros_ec: Implement offloaded() trigge=
r callback ---
commit 74008c8c0e283ff69ceee35b25286706470006e0
Author: Rong Zhang <i@rong.moe>

leds: cros_ec: Implement offloaded() trigger callback
   =20
"chromeos-auto" is a private hardware control trigger which always stays
in hardware control. Implement offloaded() callback with its return
value to be always true to reflect this.

> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index 1844d0cd5f528..6db83d0152775 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
[ ... ]
>  static struct led_hw_trigger_type cros_ec_led_trigger_type;
> =20
>  static struct led_trigger cros_ec_led_trigger =3D {
>  	.name =3D "chromeos-auto",
>  	.trigger_type =3D &cros_ec_led_trigger_type,
>  	.activate =3D cros_ec_led_trigger_activate,
> +	.offloaded =3D cros_ec_led_trigger_offloaded,
>  };

[Severity: High]
This is a pre-existing issue, but registering a global static led_trigger
structure in a driver's probe function can cause list corruption and lock
re-initialization if the driver is probed multiple times.

When cros_ec_led_probe() calls devm_led_trigger_register() and passes
this global static cros_ec_led_trigger struct, led_trigger_register()
unconditionally re-initializes the led_cdevs list and leddev_list_lock
on the passed pointer before checking if it already exists:

drivers/leds/led-triggers.c:led_trigger_register() {
    ...
    spin_lock_init(&trig->leddev_list_lock);
    INIT_LIST_HEAD(&trig->led_cdevs);
    ...
}

Does this corrupt the state of the active trigger if a subsequent probe
(such as for a second EC or manually via sysfs) calls it again with the
exact same static pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D4
