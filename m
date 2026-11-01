Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528545;
	b=T+MU8gIJSnjTKala6aKLfkodwazsavtJLYg6nj00SWmQJTaEiEPb6ptSKXKGz1/4aeyI
	 zVTYUE9kz6RLMeaMT5bWlDWGyT21N84vfwAekmM9GxBgmtZIp1qOHsRAktAU3yvmr23l/
	 P/jQtYiOzZmb/AZnKDV3btmqZ7sMEQOaLhRHO1fQdvFvjJtEjrmXcgQ9KMyV8nPpuzIyA
	 z/SG+ZStDzzSZE963+DeDpkW04VzqW0peqR65eiR2DrPSPp8ONvkC2fpS3PA3UEUOR0FP
	 fepZzwdFiKXQlMrFdlKpWxm4AAQobD9b6p9LE6ymqmn6tWq8gjM4VvuEjvxt10+xaaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528545;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VFCDQO7AhnHiER+K3k4XHWOjV7X4gU2vRsEVylJ/1MY=;
	b=ZzJvDZvwhW6aJQBX090uLLPJlD7Xf1II6czuS1RETmTIrX6iraAlDU63Z1WiqYVFCyR5
	 JCXSoPcMZgd0uw49x26qMkRBaxocMMMUDgvYvQN21yWyEnezVKqdLMlSQSrlEKX5Wz5Xn
	 LBPK5qY48cpuONrlJv6VeZYwNUQcwm8NlgTZRNS6zf+sDr+PaE1vMgEitVqLskWZr/z7l
	 z6ht70alSNip4W7eidWfW0yKJuFi9UEHwYdDeZpbyK1NvGbXMvYqmMloqRnEMvLTgUkhr
	 WAGA1MY04sMxQQdD7mv7VTgkbSAxsSPQcavYhf4mN1gL1e+/Jw/h+9SFSLV+5bxqrow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M05S08p2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D58606A324
	for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2026 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M05S08p2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642711F000C1;
	Sun,  1 Nov 2026 10:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793528544;
	bh=VFCDQO7AhnHiER+K3k4XHWOjV7X4gU2vRsEVylJ/1MY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M05S08p2S0Dg4PRtPUSs1HkWPcxcShDZJdrMYwIrUrS0N9SzQO2O671DPlvMAycyB
	 kTjiTxaeMMWvHMNpBFCaw1fj6hDLlrUS2+ZfX0koFkSy9thbgUKUUHH53kne4UQbGo
	 10luZy180wK15btZ2VrwzPTaA0IbP0Em8C225TsJGwaGtdY22dKoXz9kvFZyEgTBmD
	 xY2WLWBIuFc7tnfueKah30vw5GUrQFk1eBimTtRM92L04KMokDaF5HDH2AypFMihiv
	 a8ov6hIslwr2/eq7vbgeeraIDaMrBC+z7FMHGw7muWla/OdX3F4aIHnZh3GvQUjRQd
	 eQCSCRuSP+UlQ==
Message-ID: <sashiko-outbox-192354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/1] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101100123.28749-2-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261101100123.28749-2-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 10:22:23 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] platform/x86: thinkpad_acpi: circular Kconfig dependency on THIN=
KPAD_ACPI
- [Medium] platform/x86: thinkpad_acpi: auto level 3 exposed as LED brightn=
ess > max
- [Medium] platform/x86: thinkpad_acpi: procfs write in auto mode leaves tr=
igger stuck
- [Medium] platform/x86: thinkpad_acpi: race in kbdlight_auto_trigger_activ=
ate() work
- [Medium] platform/x86: thinkpad_acpi: kbdlight_suspend() breaks auto trig=
ger state
- [Medium] platform/x86: thinkpad_acpi: unchecked level 3 support in kbdlig=
ht_set_level()
--

commit 0036d7647f18bf2aea756a93b29c68f5fa29627e
Author: Qiling Zhu <kmatzkaczor244@gmail.com>

platform/x86: thinkpad_acpi: Add support for auto keyboard backlight

This commit adds support for the EC-controlled automatic keyboard backlight
mode (level 3) on ThinkPads by registering a private "tpacpi-kbd-auto" LED
hardware control trigger and notifying the LED core when Fn+Space cycles
into or out of auto mode.

> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 5165949930739..74fc66a44c1e2 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -75,6 +75,7 @@ config THINKPAD_ACPI
>  	depends on RFKILL || RFKILL =3D n
>  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on LEDS_TRIGGERS_HW_CHANGED

[Severity: Medium]
Does adding "depends on LEDS_TRIGGERS_HW_CHANGED" to THINKPAD_ACPI in
drivers/platform/x86/lenovo/Kconfig introduce a circular Kconfig dependency?

In drivers/platform/x86/lenovo/Kconfig, THINKPAD_ACPI selects NEW_LEDS and
LEDS_CLASS:

	select NEW_LEDS
	select LEDS_CLASS

Meanwhile, in drivers/leds/Kconfig and drivers/leds/trigger/Kconfig,
LEDS_TRIGGERS_HW_CHANGED is defined inside "if NEW_LEDS" and "if
LEDS_TRIGGERS", where LEDS_TRIGGERS depends on LEDS_CLASS. This forms a
dependency cycle (THINKPAD_ACPI -> LEDS_TRIGGERS_HW_CHANGED -> LEDS_TRIGGERS
-> LEDS_CLASS -> THINKPAD_ACPI) that causes Kconfig dependency checking to
fail with a recursive dependency error.

Additionally, LEDS_TRIGGERS_HW_CHANGED defaults to
LEDS_BRIGHTNESS_HW_CHANGED (which defaults to n), so depending on it hides
THINKPAD_ACPI whenever LEDS_TRIGGERS_HW_CHANGED is disabled, even though
include/linux/leds.h provides a stub for
led_trigger_notify_hw_control_changed() when CONFIG_LEDS_TRIGGERS_HW_CHANGED
is not set. Since struct led_trigger and devm_led_trigger_register() are
guarded by CONFIG_LEDS_TRIGGERS, should THINKPAD_ACPI select LEDS_TRIGGERS
(or LEDS_TRIGGERS_HW_CHANGED) instead of depending on
LEDS_TRIGGERS_HW_CHANGED?

> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721c..cd5c17d5f0877 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c

[ ... ]

> @@ -5197,13 +5200,33 @@ static enum led_brightness kbdlight_sysfs_get(str=
uct led_classdev *led_cdev)
>  	return level;
>  }
> =20
> +static struct led_hw_trigger_type kbdlight_auto_trigger_type;
> +
> +static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
> +{
> +	return kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL);
> +}

[Severity: Medium]
Can the asynchronous trigger_hw_changed_work race with a subsequent Fn+Space
press and overwrite the EC level back to TPACPI_KBD_LIGHT_AUTO_LEVEL (3)?

When Fn+Space cycles the EC from level 2 to level 3,
kbdlight_notify_change() sets kbdlight_brightness =3D 3 and calls
led_trigger_notify_hw_control_changed(led_cdev, true), which queues
led_cdev->trigger_hw_changed_work.

When led_trigger_hw_control_changed_worker() runs, it snapshots
activate =3D READ_ONCE(led_cdev->trigger_hw_changed) (true) and calls
__led_trigger_set(led_cdev, hc_trig, true), which sleeps in
synchronize_rcu() and flush_work(&led_cdev->set_brightness_work) before
invoking kbdlight_auto_trigger_activate().

If the user presses Fn+Space again to cycle from level 3 (auto) to level 0
(off) during this window:

1. If the EC transitions to level 0 before kbdlight_auto_trigger_activate()
   runs and before the second TP_HKEY_EV_KBD_LIGHT event is handled,
   kbdlight_auto_trigger_activate() calls kbdlight_set_level(3), forcing the
   EC back to level 3 and keeping kbdlight_brightness at 3, so the second
   kbdlight_notify_change() call sees kbdlight_brightness =3D=3D 3 and drop=
s the
   transition to 0.

2. If the second kbdlight_notify_change() runs after the worker has already
   read activate =3D true (for instance while __led_trigger_set() is in
   synchronize_rcu()), kbdlight_notify_change() updates kbdlight_brightness
   to 0, sets trigger_hw_changed =3D false, and re-queues
   trigger_hw_changed_work. The first worker then calls
   kbdlight_auto_trigger_activate() -> kbdlight_set_level(3), writing level
   3 back to the EC and setting kbdlight_brightness =3D 3. The re-queued
   worker then runs with activate =3D false and calls
   __led_trigger_set(led_cdev, NULL, true), which detaches the trigger in
   software without changing the hardware, leaving the EC stuck in auto mode
   (level 3) while sysfs shows the trigger as [none].

Should kbdlight_auto_trigger_activate() avoid writing to the EC when the
activation was initiated by hardware (or when kbdlight_brightness is already
TPACPI_KBD_LIGHT_AUTO_LEVEL)?

> +
> +static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_=
cdev)
> +{
> +	return kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +}

[Severity: Medium]
How does kbdlight_auto_trigger_hw_offloaded() interact with
kbdlight_suspend() and kbdlight_resume() when the keyboard backlight is in
auto mode?

During system suspend, kbdlight_suspend() runs:

	led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
	led_update_brightness(led_cdev);
	led_classdev_suspend(led_cdev);

led_classdev_suspend() sets LED_SUSPENDED, calls
led_set_brightness_nopm(led_cdev, 0), and flushes set_brightness_work, which
calls kbdlight_sysfs_set(led_cdev, 0) -> kbdlight_set_level(0). This sets
both the EC hardware level and kbdlight_brightness to 0 while
led_cdev->trigger remains kbdlight_auto_trigger.

While suspended, and during resume after kbdlight_resume() ->
led_classdev_resume() clears LED_SUSPENDED and queues set_brightness_work
before that work executes, the EC level is 0, so
kbdlight_auto_trigger_hw_offloaded() returns false even though
tpacpi-kbd-auto is still the active trigger:

- Reading /sys/class/leds/tpacpi::kbd_backlight/brightness sees
  led_trigger_is_hw_controlled() =3D=3D false, calls
  led_update_brightness(led_cdev) (overwriting led_cdev->brightness with 0),
  and returns 0 instead of -ENODATA.

- Writing a non-zero brightness (1 or 2) to sysfs brightness calls
  led_trigger_remove_hw_control(), which checks
  __led_trigger_is_hw_controlled() -> kbdlight_auto_trigger_hw_offloaded(),
  gets false, and fails to detach tpacpi-kbd-auto.

- Because kbdlight_suspend() overwrote kbdlight_brightness with 0 via
  kbdlight_set_level(0), if the backlight exits auto mode to level 0 across
  suspend/resume, kbdlight_notify_change() sees kbdlight_brightness =3D=3D =
0 and
  does not notify the LED core that auto mode ended.

> +
> +static struct led_trigger kbdlight_auto_trigger =3D {
> +	.name		=3D "tpacpi-kbd-auto",
> +	.trigger_type	=3D &kbdlight_auto_trigger_type,
> +	.activate	=3D kbdlight_auto_trigger_activate,
> +	.hw_offloaded	=3D kbdlight_auto_trigger_hw_offloaded,
> +};
> +
>  static struct tpacpi_led_classdev tpacpi_led_kbdlight =3D {
>  	.led_classdev =3D {
>  		.name		=3D "tpacpi::kbd_backlight",
>  		.max_brightness	=3D 2,
> -		.flags		=3D LED_BRIGHT_HW_CHANGED,
> +		.flags		=3D LED_BRIGHT_HW_CHANGED | LED_TRIG_HW_CHANGED,
>  		.brightness_set_blocking =3D &kbdlight_sysfs_set,
>  		.brightness_get	=3D &kbdlight_sysfs_get,
> +		.trigger_type	=3D &kbdlight_auto_trigger_type,
>  	}
>  };
> =20
> @@ -5224,6 +5247,26 @@ static int __init kbdlight_init(struct ibm_init_st=
ruct *iibm)
>  	kbdlight_brightness =3D kbdlight_sysfs_get(NULL);
>  	tp_features.kbdlight =3D 1;
> =20
> +	/*
> +	 * Register the auto-mode trigger before the LED classdev: if the
> +	 * hardware is already in auto mode, the trigger can then be set as
> +	 * the default one and gets activated during LED classdev
> +	 * registration.
> +	 */
> +	rc =3D devm_led_trigger_register(&tpacpi_pdev->dev,
> +				       &kbdlight_auto_trigger);
> +	if (rc) {
> +		tp_features.kbdlight =3D 0;
> +		return rc;
> +	}
> +
> +	tpacpi_led_kbdlight.led_classdev.hw_control_trigger =3D
> +		kbdlight_auto_trigger.name;

[Severity: Medium]
What happens on ThinkPad models that have a keyboard backlight (so
kbdlight_is_supported() returns true) but do not support ALS auto mode (lev=
el
3) when userspace selects the tpacpi-kbd-auto trigger?

kbdlight_init() unconditionally registers kbdlight_auto_trigger on all
models with a keyboard backlight. When userspace writes "tpacpi-kbd-auto" to
/sys/class/leds/tpacpi::kbd_backlight/trigger,
kbdlight_auto_trigger_activate() calls
kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL):

static int kbdlight_set_level(int level)
{
	if (!hkey_handle)
		return -ENXIO;

	guard(mutex)(&kbdlight_mutex);

	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
		return -EIO;

	kbdlight_brightness =3D level;
	return 0;
}

Unlike kbdlight_get_level() and kbdlight_is_supported(), kbdlight_set_level=
()
passes NULL for the MLCS return value (so a negative ACPI method error stat=
us
is ignored) and does not verify via kbdlight_get_level() that the EC
actually entered level 3. If the EC rejects or ignores level 3:

1. kbdlight_set_level(3) still sets kbdlight_brightness =3D 3 and returns 0,
   so __led_trigger_set() marks tpacpi-kbd-auto as the active trigger.
2. kbdlight_auto_trigger_hw_offloaded() checks
   kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL, which returns f=
alse
   because the hardware stayed at its previous level (0, 1, or 2).
3. Subsequent non-zero writes to sysfs brightness call
   led_trigger_remove_hw_control(), which checks
   __led_trigger_is_hw_controlled(), gets false, and fails to remove the
   active tpacpi-kbd-auto trigger.
4. When TP_HKEY_EV_KBD_LIGHT fires, kbdlight_notify_change() compares the
   stale kbdlight_brightness (3) against kbdlight_sysfs_get(NULL) and treats
   it as a hardware-initiated transition out of auto mode.

Should kbdlight_set_level() (or kbdlight_auto_trigger_activate()) check the
MLCS return status and verify that kbdlight_get_level() transitioned to the
requested level before updating kbdlight_brightness and succeeding?

[ ... ]

> @@ -5313,6 +5356,47 @@ static void kbdlight_resume(void)
>  	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
>  }
> =20
> +/* Notify the LED core when the hardware cycles into or out of auto mode=
. */
> +static void kbdlight_notify_hw_control(struct led_classdev *led_cdev,
> +				       int old_level, int new_level)
> +{
> +	bool was_auto =3D old_level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +	bool is_auto =3D new_level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +
> +	if (is_auto !=3D was_auto)
> +		led_trigger_notify_hw_control_changed(led_cdev, is_auto);
> +}

[Severity: Medium]
If the keyboard backlight is currently in auto mode (level 3) and a fixed
brightness level (0, 1, or 2) is written via /proc/acpi/ibm/kbdlight, doesn=
't
the tpacpi-kbd-auto trigger remain stuck as the active trigger?

Writing 0, 1, or 2 to /proc/acpi/ibm/kbdlight calls kbdlight_write() ->
kbdlight_set_level_and_update(level) -> kbdlight_set_level(level).
kbdlight_set_level() evaluates MLCS to switch the EC out of auto mode and
updates kbdlight_brightness =3D level under kbdlight_mutex, without calling
kbdlight_notify_hw_control() or removing the hardware control trigger.

When the EC then raises TP_HKEY_EV_KBD_LIGHT for that MLCS call,
kbdlight_notify_change() sees brightness =3D=3D kbdlight_brightness and ret=
urns
early without calling kbdlight_notify_hw_control().

Furthermore, because the EC is now at level 0, 1, or 2,
kbdlight_auto_trigger_hw_offloaded() returns false. If userspace then writes
a non-zero brightness (1 or 2) to
/sys/class/leds/tpacpi::kbd_backlight/brightness, brightness_store() calls
led_trigger_remove_hw_control(), which checks
__led_trigger_is_hw_controlled() -> kbdlight_auto_trigger_hw_offloaded(),
sees false, and leaves tpacpi-kbd-auto attached (the same thing can also
happen if userspace writes 1 or 2 to sysfs brightness in the asynchronous
window after Fn+Space exits auto mode before trigger_hw_changed_work runs).

Should kbdlight_set_level_and_update() (or kbdlight_set_level()) notify or
remove the hardware control trigger when transitioning out of
TPACPI_KBD_LIGHT_AUTO_LEVEL?

> +
> +/*
> + * The EC cycles the keyboard backlight level (and auto mode) itself on
> + * Fn+Space; check the current level and update the LED core state.
> + */
> +static void kbdlight_notify_change(void)
> +{
> +	struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +	enum led_brightness brightness;
> +
> +	guard(mutex)(&kbdlight_mutex);
> +
> +	/*
> +	 * Check the brightness actually changed, setting the brightness
> +	 * through kbdlight_set_level() also triggers this event.
> +	 */
> +	brightness =3D kbdlight_sysfs_get(NULL);
> +	if (kbdlight_brightness =3D=3D brightness)
> +		return;
> +
> +	/*
> +	 * Calling kbdlight_notify_hw_control() is safe while holding
> +	 * kbdlight_mutex: the notification is only queued, and the worker
> +	 * re-acquires the mutex (if at all) after this critical section has
> +	 * been left.
> +	 */
> +	kbdlight_notify_hw_control(led_cdev, kbdlight_brightness, brightness);
> +	kbdlight_brightness =3D brightness;
> +	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
> +}

[Severity: Medium]
Doesn't this expose TPACPI_KBD_LIGHT_AUTO_LEVEL (3), which exceeds
max_brightness (2), through both brightness_hw_changed and brightness?

The commit message notes that max_brightness stays 2 and auto mode is not
multiplexed into the brightness value. However:

1. In kbdlight_notify_change(), when Fn+Space cycles the EC into auto mode,
   kbdlight_sysfs_get(NULL) returns TPACPI_KBD_LIGHT_AUTO_LEVEL (3), and
   led_classdev_notify_brightness_hw_changed(led_cdev, brightness) is called
   unconditionally with brightness =3D=3D 3. This stores 3 in
   led_cdev->brightness_hw_changed and notifies userspace pollers (such as
   upower) of a brightness value greater than max_brightness.

2. Because kbdlight_sysfs_get() (the led_cdev->brightness_get callback)
   returns kbdlight_get_level() verbatim, led_update_brightness() sets
   led_cdev->brightness =3D 3 during led_classdev_register() when booting in
   auto mode (before led_trigger_set_default() activates the trigger), duri=
ng
   kbdlight_suspend() when suspending in auto mode, and whenever userspace
   reads /sys/class/leds/tpacpi::kbd_backlight/brightness while the EC is at
   level 3 and led_trigger_is_hw_controlled() is false (such as in the
   asynchronous window after Fn+Space before trigger_hw_changed_work runs, =
or
   when a software trigger is attached). When Fn+Space later cycles from au=
to
   mode (3) to off (0), __led_trigger_set(led_cdev, NULL, true) does not
   update led_cdev->brightness, leaving it at 3.

Should kbdlight_notify_change() skip
led_classdev_notify_brightness_hw_changed() when entering
TPACPI_KBD_LIGHT_AUTO_LEVEL, and should kbdlight_sysfs_get() avoid returning
TPACPI_KBD_LIGHT_AUTO_LEVEL as an enum led_brightness to the LED core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101100123.2874=
9-1-kmatzkaczor244@gmail.com?part=3D1
