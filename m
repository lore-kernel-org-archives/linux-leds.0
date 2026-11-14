Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680841;
	b=l2XcuQa+lW/BcCigE54SxZc0pQ5iUN+Oj/yRVRFTRmfoFr3ObC7PuXwrUBg7Hjm12KST
	 QWr+/b7qtXw0olpEuqBy18zcvd53IQS+YApyBaNrnlJcOmmoeGXB3HF6NPPOFsip7aYnK
	 wfnP8/aTzHDCNyfh9r0/8Uu5s8pbnQK/I+pDBkEj01+ltNruU5VmwWbm7ALYviRP4Up0W
	 ZfDSOx5fPeDgAe7q/apdDjUmlj4r85CM5srOcQ7kjholiBUyIJhX7u2aDIRwr6kNKmNqh
	 eCAwZbOOedJCUw/jwnnaa0wVuzJSG7uPQGRWMy/aKR2FTGplP0YfYOn6Zn02Wl2O10Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680841;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1sJtT4OuDY29r0aMtBSiMPt5TDi6Zpgp2FGoKWRWPvs=;
	b=Wu4C5blTM9en6f9n24f3SpwAru1V0TlGoIDxw3Az9g8t8AhaG5fDtDvD+EWrmo4QtcLU
	 Mb05sVDejGZRz3iptcH1PMa6zg09gDEJXdkK/pfBjL5LrPFiUlJ0miO59ktS+UegNgiYH
	 lm+osEgmENzkSR3KqUVMne7JTOqzVMaU3GnmfiJ8vrp4dULsruvyL7lj3w0An7K+b2upZ
	 B+8WN79rQ9T2rONVKPQhg2Vl+QtLxI0qGzjbBXp0awUIPVAAjIIDxlPAsMsWqnmabbLSj
	 zRXKSozMQKgJ524AuNQIDiVpMKcv/CVj8KiLkrhgRW3KxHae/nqlWxdVdfNuc+Tj0DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XY3GPuc/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E00606A330
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XY3GPuc/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF631F000C4;
	Sat, 14 Nov 2026 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794680841;
	bh=1sJtT4OuDY29r0aMtBSiMPt5TDi6Zpgp2FGoKWRWPvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XY3GPuc/cvGZF4XP393YLSWNlg8FXwxjZpW1iDHfryGgy9unZCVzYMgvbXPA3YLTk
	 aSwyJO+iM9Cvf/gaBqDCG5xQI8dJDYeq4dKE/WdA2oC11wVMRQhEhSFxkTx/zxDsPq
	 8GTfx0VhaTciQGQxJP2q5oULt+14SYDjkSzQh5ff1UrrpokPLfVegR9H+oSs3/yJQ1
	 KBUkipP4qlvCAakosycVh3RRUw+KlOfAK9mw6h2gfQy0ufXqHK7YFDopVQYxZ1KuY1
	 1GC12J008RhIGXE6Y+f2mqX+0YyMnKQP4ax759Msx14vgLoJoqKueU12ayw4OAsnFb
	 LNiBeh9lZCLxg==
Message-ID: <sashiko-outbox-214900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114174814.62153-7-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-7-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:27:17 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] platform/x86: thinkpad_acpi: stale cache in
  kbdlight_auto_trigger_activate()
- [Medium] platform/x86: thinkpad_acpi: WARN_ON in
  kbdlight_notify_level() without trigger
- [Medium] platform/x86: thinkpad_acpi: kbdlight_sysfs_set() undoes
  trigger activation
--

commit 02361acafbf4f75fad24437cece57aebc1b2b8d5
Author: Qiling Zhu <kmatzkaczor244@gmail.com>

platform/x86: thinkpad_acpi: Add support for auto keyboard backlight

This commit registers a private "tpacpi-kbd-auto" LED hardware control
trigger for ThinkPad keyboard backlight auto mode (EC level 3) and wires up
hardware-initiated trigger and brightness state notifications.

> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index f9e2d324db727..f11e614172881 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5106,7 +5106,12 @@ static struct ibm_struct video_driver_data =3D {
>  /* EC level that selects the auto mode for the keyboard backlight */
>  #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
> =20
> -static enum led_brightness kbdlight_brightness;
> +/*
> + * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
> + * tracking compares EC levels; the auto mode is translated to a
> + * brightness value only when reporting to the LED core.
> + */
> +static int kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
> =20
>  /*
> @@ -5191,6 +5196,38 @@ static bool kbdlight_is_supported(void)
>  	return status & BIT(9);
>  }
> =20
> +static struct led_hw_trigger_type kbdlight_auto_trigger_type;
> +
> +static enum led_brightness kbdlight_level_to_brightness(int level)
> +{
> +	/* Auto mode is not a brightness level; report it as off. */
> +	if (level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +		return 0;
> +
> +	return level;
> +}
> +
> +static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
> +{
> +	guard(mutex)(&kbdlight_mutex);
> +
> +	return kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL);
> +}
> +
> +static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_=
cdev)
> +{
> +	guard(mutex)(&kbdlight_mutex);
> +
> +	return kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +}

[Severity: High]
Does kbdlight_auto_trigger_activate() leave kbdlight_brightness stale when
switching into auto mode from a manual level?

Since commit "platform/x86: thinkpad_acpi: Sync LED core state on level
writes", kbdlight_set_level() only evaluates MLCS without updating
kbdlight_brightness.  When userspace selects "tpacpi-kbd-auto" via sysfs
while at level 0, 1, or 2, kbdlight_brightness remains at that manual
level.  kbdlight_auto_trigger_hw_offloaded() then returns false while the EC
is in auto mode, and a subsequent manual brightness write or Fn+Space press
fails to see was_auto =3D=3D true in kbdlight_notify_level() (or returns ea=
rly
at level =3D=3D kbdlight_brightness), leaving the trigger state out of sync=
 with
hardware.

[ ... ]

> @@ -5235,9 +5272,37 @@ static int __init kbdlight_init(struct ibm_init_st=
ruct *iibm)
>  		return -ENODEV;
>  	}
> =20
> -	kbdlight_brightness =3D kbdlight_sysfs_get(NULL);
> +	kbdlight_brightness =3D kbdlight_get_level();
> +	if (kbdlight_brightness < 0)
> +		kbdlight_brightness =3D 0;
> +
>  	tp_features.kbdlight =3D 1;
> =20
> +	if (tp_features.kbdlight_auto) {
> +		rc =3D devm_led_trigger_register(&tpacpi_pdev->dev,
> +					       &kbdlight_auto_trigger);
> +		if (rc) {
> +			/*
> +			 * Auto-mode trigger unavailable; basic backlight
> +			 * control keeps working.
> +			 */
> +			dev_warn(&tpacpi_pdev->dev,
> +				 "auto-mode trigger unavailable\n");
> +		} else {
> +			struct led_classdev *led_cdev =3D
> +				&tpacpi_led_kbdlight.led_classdev;
> +
> +			led_cdev->flags |=3D LED_TRIG_HW_CHANGED;
> +			led_cdev->trigger_type =3D &kbdlight_auto_trigger_type;
> +			led_cdev->hw_control_trigger =3D
> +				kbdlight_auto_trigger.name;
> +
> +			if (kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +				led_cdev->default_trigger =3D
> +					kbdlight_auto_trigger.name;
> +		}
> +	}

[ ... ]

> @@ -5347,6 +5412,8 @@ static void kbdlight_resume(void)
>  static void kbdlight_notify_level(int level)
>  {
>  	struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +	bool is_auto, was_auto;
> +	int brightness;
> =20
>  	/*
>  	 * Check the brightness actually changed, setting the brightness
> @@ -5355,15 +5422,29 @@ static void kbdlight_notify_level(int level)
>  	if (level =3D=3D kbdlight_brightness)
>  		return;
> =20
> +	is_auto =3D level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +	was_auto =3D kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +
> +	if (is_auto !=3D was_auto)
> +		led_trigger_notify_hw_control_changed(led_cdev, is_auto);

[Severity: Medium]
Can this trigger the WARN_ON() in led_trigger_notify_hw_control_changed()
when the trigger was not registered?

If devm_led_trigger_register() fails in kbdlight_init() (or firmware cycles
through level 3 without reporting MLCG bit 20), LED_TRIG_HW_CHANGED,
hw_control_trigger, and trigger_type are not set on led_cdev, so calling
led_trigger_notify_hw_control_changed() hits:

drivers/leds/led-triggers.c:led_trigger_notify_hw_control_changed() {
	if (WARN_ON(!(led_cdev->flags & LED_TRIG_HW_CHANGED) ||
		    !led_cdev->hw_control_trigger || !led_cdev->trigger_type))
		return;
    ...
}

[Severity: Medium]
Can calling led_trigger_notify_hw_control_changed() from software brightness
writes undo trigger activation?

kbdlight_sysfs_set() calls kbdlight_set_level_and_update() ->
kbdlight_notify_level().  When userspace writes "tpacpi-kbd-auto" (or
"default") to the trigger sysfs attribute while the backlight is already in
auto mode, __led_trigger_set() tears down the active trigger via
led_set_brightness(led_cdev, LED_OFF) and flushes set_brightness_work right
before calling trig->activate():

__led_trigger_set(led_cdev, &kbdlight_auto_trigger, false)
  down_write(&led_cdev->trigger_lock)
  led_set_brightness(led_cdev, LED_OFF)
    queue_work(..., &led_cdev->set_brightness_work)
  flush_work(&led_cdev->set_brightness_work)
    ...
      kbdlight_sysfs_set(led_cdev, 0)
        kbdlight_notify_level(0)
          led_trigger_notify_hw_control_changed(led_cdev, false)
            schedule_work(&led_cdev->trigger_hw_changed_work)
  kbdlight_auto_trigger_activate(led_cdev)
    kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL)
  up_write(&led_cdev->trigger_lock)

led_trigger_hw_control_changed_worker()
  __led_trigger_set(led_cdev, NULL, true)  <-- detaches trigger

Once trigger_lock is released, trigger_hw_changed_work runs with
activate =3D=3D false and removes the trigger in software while leaving the=
 EC
hardware in auto mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114174814.6215=
3-1-kmatzkaczor244@gmail.com?part=3D6
