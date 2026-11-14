Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680545;
	b=MpSFGcXcMnpcjqrY0W94oIbpfmEkUStd8vw4Mz0VPaVYXlxPNInrJ96GC6T7UOw78wFd
	 Ekn840XZdHL/3jTzrjecDyi7GD8Gp3N+2lCfgKNpzuizNFGR2Ow7tk2lGE2hIVFvkjGmG
	 9WL7t75ELH5wyBoZxfrV/my9qQ/TEDjVVaSdd+i4FDoAp/Kj85Y7cq1LdAoSjOkpvIyZt
	 6huH1Bv0zhmyWUE3AV0BJuuxYv42Id8tyjOC8ptyasx5CV7GHa2GKmWkNfvsnqTvRG+PA
	 1MkYRnzBU7eUWhUHJNkQwcWKeX+af+fi2t8zzQ82KCE5zJVA0siJbcmX+YtNpMw3Wfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680545;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d11CVeEVD8Dkb17zIvdMnooZrTk/m2CjW/kEmaNRKT8=;
	b=JlZ+WRJi51/hnocp0FDUr6spmkPNUSJjRLIDK1++j3quLh07+DfmMFAr5uVsscNVL/tw
	 rIkiWTKKUe17T59pl6bnE1lsW+iWJmiPHqcW1B3szJ9S2r1KwUrER/B6wWvSt2RWdVFqO
	 Jqh3YOZsmMqhcPmlIZ5MomnnMw7UhFo42wHq8FdGYwRam312BGfUFyJUMEaZjswOhn8B8
	 2My8H76BwdA4XLxgLrChnxbzhWN+AGS2slGSvMJw8CqP7OaW9BIqDVVtbcUeLwuG3HW9F
	 iBcqdpQvAWxsaNre5SnZVZzs1nnnoNJScccgmws1ErYSxoMTaNv7EvqkgrlKn0PGIQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zpdijolf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E17606A329
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zpdijolf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A28C1F000C4;
	Sat, 14 Nov 2026 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794680545;
	bh=d11CVeEVD8Dkb17zIvdMnooZrTk/m2CjW/kEmaNRKT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZpdijolfEPO2UERzLARbXhyQ11w1Bi0d9GWTfYOwaTG/UjzVyZpRGhhl6fk/iTmOH
	 mMN1tR+xMGZtQv4P0IkeWIuPfkt0KXmnor7TpAWvSiCdsCcvy8z4/kAn94YvGKZhAP
	 MFqaGF833DtSI/WyURSVwsIkkxqBA323XKZJNOxwNaCB1+/dJW+hPh5mZVMsJ+k+4C
	 yQh+am65fWWganTdZ5i+pVCJv4XB4KhYdcPbZ5QaWmWXw1Yax7y//2sPtX+s+rP5P4
	 4/Ml0PVOvUcklhWgyc+oMT8WmxZPSc5+r7ifmfbETIemHZbP7XD0OEpT9iNSMLhU2G
	 BnuS7JWzVo/QA==
Message-ID: <sashiko-outbox-214898@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] platform/x86: thinkpad_acpi: Reconcile EC level
 on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114174814.62153-8-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-8-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:22:18 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] platform/x86: thinkpad_acpi: stale level in
  kbdlight_auto_trigger_activate()
- [Medium] platform/x86: thinkpad_acpi: unguarded notify in
  kbdlight_notify_level()
--

commit a90d6e4f6605e84d309fb918bc0981b8a24de37a
Author: Qiling Zhu <kmatzkaczor244@gmail.com>

platform/x86: thinkpad_acpi: Reconcile EC level on resume

This commit reads the keyboard backlight EC level on resume on auto-mode
machines and passes it through kbdlight_notify_change() to synchronize the
cached level and auto trigger state.

> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index f11e614172881..802e0d53b1312 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5395,13 +5395,22 @@ static void kbdlight_suspend(void)
>  	led_classdev_suspend(led_cdev);
>  }
> =20
> +static void kbdlight_notify_change(void);
> +
>  static void kbdlight_resume(void)
>  {
>  	if (!tp_features.kbdlight)
>  		return;
> =20
> -	if (tp_features.kbdlight_auto)
> +	if (tp_features.kbdlight_auto) {
> +		/*
> +		 * The firmware may not restore auto mode: after hibernation
> +		 * from level 3 it comes back with the backlight off.  Check
> +		 * the EC level and reconcile.
> +		 */
> +		kbdlight_notify_change();
>  		return;
> +	}

[Severity: Medium]
Does kbdlight_notify_change() fail to deactivate the tpacpi-kbd-auto
trigger on resume when auto mode was enabled via sysfs rather than the
Fn+Space hotkey?

After commit "platform/x86: thinkpad_acpi: Sync LED core state on level
writes" moved the kbdlight_brightness update out of kbdlight_set_level()
into kbdlight_notify_level(), kbdlight_auto_trigger_activate() sets the EC
to TPACPI_KBD_LIGHT_AUTO_LEVEL without updating kbdlight_brightness:

drivers/platform/x86/lenovo/thinkpad_acpi.c:kbdlight_auto_trigger_activate(=
) {
	guard(mutex)(&kbdlight_mutex);

	return kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL);
}

kbdlight_brightness stays at the previous manual level (0, 1, or 2), so
kbdlight_auto_trigger_hw_offloaded() returns false while the trigger is
active, and on resume from hibernation kbdlight_notify_level() sees
was_auto as false (or returns early when kbdlight_brightness was 0) and
skips led_trigger_notify_hw_control_changed().

[Severity: Medium]
Can kbdlight_notify_change() trigger a WARN_ON() in
led_trigger_notify_hw_control_changed() if devm_led_trigger_register()
failed during kbdlight_init()?

When devm_led_trigger_register() fails, kbdlight_init() logs a warning and
leaves tp_features.kbdlight_auto set without setting LED_TRIG_HW_CHANGED,
trigger_type, or hw_control_trigger on tpacpi_led_kbdlight.led_classdev:

drivers/platform/x86/lenovo/thinkpad_acpi.c:kbdlight_init() {
...
	if (tp_features.kbdlight_auto) {
		rc =3D devm_led_trigger_register(&tpacpi_pdev->dev,
					       &kbdlight_auto_trigger);
		if (rc) {
			dev_warn(&tpacpi_pdev->dev,
				 "auto-mode trigger unavailable\n");
		} else {
			struct led_classdev *led_cdev =3D
				&tpacpi_led_kbdlight.led_classdev;

			led_cdev->flags |=3D LED_TRIG_HW_CHANGED;
...
}

Any transition into or out of TPACPI_KBD_LIGHT_AUTO_LEVEL in
kbdlight_notify_level() then calls led_trigger_notify_hw_control_changed()
on an unconfigured led_cdev and hits the WARN_ON() in
drivers/leds/led-triggers.c.  In addition, THINKPAD_ACPI in Kconfig does
not select LEDS_TRIGGERS_HW_CHANGED, so when CONFIG_LEDS_TRIGGERS_HW_CHANGED
is disabled, led_trigger_notify_hw_control_changed() compiles to a no-op
and kbdlight_resume() leaves the auto trigger active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114174814.6215=
3-1-kmatzkaczor244@gmail.com?part=3D7
