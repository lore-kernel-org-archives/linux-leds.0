Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633586;
	b=dm+18I6G45Rz+IK7w2Hlq++6CrcVXYkxw/Rqv4EZGvmfS/I/+hfUifUOvvJKvhCdzMnN
	 CQzTjTyglBY+W2tH0VCF7rl3CXIjv5M0dhEKi260j4w4T66ZBdEH8APjLTovTDxyFCBt3
	 2tTz/3kdH+i6aTFZS+H/J2iAj8GMzTnHiQ3l0eC1O3M2UKrSQZsNCRWs7/AIbVSypAtnR
	 wIm5kBXunDSmHJEb08vppaP7LKYLH3MRx4Oqs9wE9621Ne6ED6dtJr+NhtcOIN7kbqNS5
	 y29IuKGJRwA/mAdA11OTp4rtjd5jtuo+6eWdSPfDj/2nT8itvICSEzJgxsngwDfzlrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633586;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E7OmF1plexl2eybJPKLWRZ6ZcMLGqMLDeKumJULg9+U=;
	b=GBWN4IXWQexhLP3ZSSA5CWyaT+QUeCFoW7TVjlEK3rMvTf9pRwt9UaCsBLAMbywim7Nv
	 QYlW+TjUlKHr9wcWxkOEI2BmRMvbUk21iSB2P+tTB1L/oBeqve5XvEacL3emQvcvWrJ+j
	 zjRDChq9baBCS9d6bZPz7o6H+2N0bUxLAQCgAwRQjPboVPD6Bso+FDNnMeKURzrzcTc/s
	 DvT0ivSoRJVoCZV9Ldtv0ZRED/to5/VoP3jdFdSFfcm2q9refrCXzcp5VpWs58wp4IDyt
	 UK8L+C3nbswdW2LehGJH/BKD0uM8SxVITSalnSlqCNfK2t5823+/cXV13WyutyKb72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=awUlNYrk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1206072ED4
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=awUlNYrk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305151F00A18;
	Mon,  2 Nov 2026 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633585;
	bh=E7OmF1plexl2eybJPKLWRZ6ZcMLGqMLDeKumJULg9+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=awUlNYrkt5MuN8jhxlkqf+noTfsbEiCaixB+jNRmDoEFw5sOTuuB0ntBUBgRUsJxB
	 bhBhSruPcm6M15/4IwbxqIeBKh1YXePRcxBYzL1humOJTwP7ch7+3rwv7OvqEMilMz
	 Isir2CIHE6YsrRKbPi+zPs/vGvxmDQiI0DiXuSaa/QII3MXAdezubgUXkN0tF2K/uI
	 w9aqViPnOT0J8JI3zuBcpkCzKvpUdyZwJ89ZyHEqcr+tkdRlmiYsDY9TGokHyUnKwP
	 lTWC1TwRYbQ80svUxMJxAQkAroRVnJvrUBTQmUz4hR5DoauXy9dW6/YEihUXli9Hhh
	 39DHXkioZDJJA==
Message-ID: <sashiko-outbox-193671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 2/2] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261102151211.40701-3-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-3-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:33:04 +0000
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
- [High] platform/x86: thinkpad_acpi: bad kbdlight_auto_trigger_hw_offloade=
d() check
- [High] platform/x86: thinkpad_acpi: race in kbdlight_auto_trigger_activat=
e()
- [Medium] platform/x86: thinkpad_acpi: unsigned enum check in kbdlight_ini=
t()
- [Medium] platform/x86: thinkpad_acpi: unchecked level in kbdlight_notify_=
change()
- [Medium] platform/x86: thinkpad_acpi: stale level when auto trigger activ=
ate fails
- [Medium] platform/x86: thinkpad_acpi: async race in kbdlight_set_level_an=
d_update()
--

commit 58813975928928e80e772abf45a021a9664adf5b
Author: Qiling Zhu <kmatzkaczor244@gmail.com>

platform/x86: thinkpad_acpi: Add support for auto keyboard backlight

This commit adds support for the ambient light sensor (ALS) automatic
keyboard backlight mode (EC level 3) on ThinkPads by exposing a private
"tpacpi-kbd-auto" hardware control LED trigger and synchronizing EC level
changes with the LED core.

> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 3260eaa620a0e..7b46ad6f9618c 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5102,6 +5102,14 @@ static struct ibm_struct video_driver_data =3D {
>   * Keyboard backlight subdriver
>   */
> =20
> +/* EC level that selects ALS-controlled auto mode for the keyboard backl=
ight */
> +#define TPACPI_KBD_LIGHT_AUTO_LEVEL	3
> +
> +/*
> + * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL. All state
> + * tracking compares EC levels; the auto mode is translated to a
> + * brightness value only when reporting to the LED core.
> + */
>  static enum led_brightness kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
> =20
> @@ -5180,6 +5188,15 @@ static bool kbdlight_is_supported(void)
>  	return status & BIT(9);
>  }
> =20
> +/* The auto mode is not a brightness level; report it as off to the LED =
core. */
> +static enum led_brightness kbdlight_level_to_brightness(int level)
> +{
> +	if (level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +		return 0;
> +
> +	return level;
> +}
> +
>  static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
>  			enum led_brightness brightness)
>  {
> @@ -5194,16 +5211,54 @@ static enum led_brightness kbdlight_sysfs_get(str=
uct led_classdev *led_cdev)
>  	if (level < 0)
>  		return 0;
> =20
> -	return level;
> +	return kbdlight_level_to_brightness(level);
> +}
> +
> +static struct led_hw_trigger_type kbdlight_auto_trigger_type;
> +
> +static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
> +{
> +	/*
> +	 * The EC may already be in auto mode (cycled there on Fn+Space, or
> +	 * active since before the driver loaded), in which case there is
> +	 * nothing to program.
> +	 */
> +	if (kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +		return 0;
> +
> +	if (kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL))
> +		return -EIO;

[Severity: High]
Can a rapid Fn+Space sequence race with the asynchronous trigger activation
worker here and leave the EC stuck in auto mode while the trigger is detach=
ed?

When Fn+Space cycles into auto mode (level 3), kbdlight_notify_change() cal=
ls
led_trigger_notify_hw_control_changed(led_cdev, true), which schedules
trigger_hw_changed_work. Contrary to the comment in kbdlight_notify_change(=
),
led_trigger_hw_control_changed_worker() in drivers/leds/led-triggers.c does
not call hw_offloaded(); instead it runs:

  led_trigger_hw_control_changed_worker()
    led_trigger_do_hw_control_transition()
      __led_trigger_set(led_cdev, hc_trig, true)
        synchronize_rcu()
        flush_work(&led_cdev->set_brightness_work)
        kbdlight_auto_trigger_activate()

If a second Fn+Space press cycles the EC from level 3 to level 0 while the
first transition is pending or sleeping in synchronize_rcu(),
kbdlight_notify_change() sets trigger_hw_changed =3D false and re-queues
trigger_hw_changed_work.

When the first worker reaches kbdlight_auto_trigger_activate() in
drivers/platform/x86/lenovo/thinkpad_acpi.c, kbdlight_get_level() returns 0,
so kbdlight_auto_trigger_activate() calls
kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL) and programs the EC back to
level 3. Immediately afterwards, the re-queued worker runs with
activate =3D false and calls __led_trigger_set(led_cdev, NULL, true), which
detaches the trigger without changing the hardware level (because
hw_triggered is true), leaving the hardware in auto mode while sysfs reports
the [none] trigger.

> +
> +	/*
> +	 * Check that the EC actually accepted the auto mode; on error the
> +	 * trigger core reverts the LED to the "none" trigger.
> +	 */
> +	if (kbdlight_get_level() !=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +		return -EIO;

[Severity: Medium]
If the EC does not support auto mode and rejects level 3 when a user selects
tpacpi-kbd-auto via sysfs, does this leave kbdlight_brightness corrupted wi=
th
TPACPI_KBD_LIGHT_AUTO_LEVEL?

In drivers/platform/x86/lenovo/thinkpad_acpi.c, kbdlight_init() registers
kbdlight_auto_trigger unconditionally on all ThinkPads with a keyboard
backlight. When kbdlight_auto_trigger_activate() calls
kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL), kbdlight_set_level()
unconditionally updates kbdlight_brightness:

	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
		return -EIO;

	kbdlight_brightness =3D level;
	return 0;

When kbdlight_get_level() !=3D TPACPI_KBD_LIGHT_AUTO_LEVEL then fails and
returns -EIO, kbdlight_brightness remains set to 3. Because __led_trigger_s=
et()
only queues set_brightness_work asynchronously on activation failure (and s=
kips
it if LED_SUSPENDED is set), a concurrent or subsequent kbdlight_notify_cha=
nge()
call can observe kbdlight_brightness =3D=3D 3 while the EC is at a non-auto=
 level
and emit spurious hardware control and brightness change notifications.

> +
> +	return 0;
> +}
> +
> +static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_=
cdev)
> +{
> +	return kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +}

[Severity: High]
Does returning false from kbdlight_auto_trigger_hw_offloaded() when the EC
is no longer at level 3 prevent the trigger from being removed?

In drivers/leds/led-triggers.c, __led_trigger_is_hw_controlled() already
checks that led_cdev->trigger is attached and matches
led_cdev->hw_control_trigger before calling trig->hw_offloaded(led_cdev).
The hw_offloaded() callback is meant to distinguish hardware offload from
software fallback for hybrid triggers, rather than re-polling whether the
hardware is still in auto mode.

Because kbdlight_auto_trigger_hw_offloaded() in
drivers/platform/x86/lenovo/thinkpad_acpi.c returns false as soon as the EC
leaves level 3, __led_trigger_is_hw_controlled() also returns false even
though kbdlight_auto_trigger is still the active trigger on led_cdev:

1. If CONFIG_LEDS_TRIGGERS_HW_CHANGED is disabled (THINKPAD_ACPI only selec=
ts
   LEDS_TRIGGERS), pressing Fn+Space to exit auto mode changes the EC level=
 to
   0 while led_cdev->trigger remains kbdlight_auto_trigger. Subsequent writ=
es
   to /sys/class/leds/tpacpi::kbd_backlight/brightness (via
   led_trigger_remove_hw_control()) or /proc/acpi/ibm/kbdlight (via
   kbdlight_set_level_and_update()) see led_trigger_is_hw_controlled() =3D=
=3D false
   and never detach the trigger.

2. Even with CONFIG_LEDS_TRIGGERS_HW_CHANGED enabled, if the EC leaves leve=
l 3
   (for example across suspend/resume or via Fn+Space before the async noti=
fication
   runs) and userspace writes the matching level to /proc/acpi/ibm/kbdlight
   before kbdlight_notify_change() executes, kbdlight_set_level_and_update()
   sees led_trigger_is_hw_controlled() =3D=3D false, skips
   led_trigger_remove_hw_control(), and calls kbdlight_set_level(level),
   updating kbdlight_brightness =3D level. When kbdlight_notify_change() ru=
ns
   next, kbdlight_brightness =3D=3D level is already true, so it returns ea=
rly
   without calling led_trigger_notify_hw_control_changed(led_cdev, false),
   leaving the LED stuck on tpacpi-kbd-auto.

[ ... ]

> @@ -5221,9 +5276,30 @@ static int __init kbdlight_init(struct ibm_init_st=
ruct *iibm)
>  		return -ENODEV;
>  	}
> =20
> -	kbdlight_brightness =3D kbdlight_sysfs_get(NULL);
> +	kbdlight_brightness =3D kbdlight_get_level();
> +	if (kbdlight_brightness < 0)
> +		kbdlight_brightness =3D 0;

[Severity: Medium]
Since kbdlight_brightness is declared as enum led_brightness, is the
kbdlight_brightness < 0 check in kbdlight_init() always false?

In include/linux/leds.h, enum led_brightness only defines non-negative
constants (LED_OFF =3D 0 through LED_FULL =3D 255), so its underlying type =
is
unsigned int. Previously, kbdlight_sysfs_get() stored the return value of
kbdlight_get_level() in a signed int local variable and checked level < 0
before returning. Assigning kbdlight_get_level() directly to
kbdlight_brightness in drivers/platform/x86/lenovo/thinkpad_acpi.c means a
negative error code from kbdlight_get_level() wraps to a large unsigned val=
ue
and is not clamped to 0.

[ ... ]

> @@ -5246,9 +5322,22 @@ static int kbdlight_set_level_and_update(int level)
>  	int ret;
>  	struct led_classdev *led_cdev;
> =20
> -	ret =3D kbdlight_set_level(level);
>  	led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> =20
> +	/*
> +	 * Leaving auto mode through the proc interface has to drop the
> +	 * trigger, like writing a brightness through sysfs does. Route the
> +	 * new level through the LED core as well, so that it is applied
> +	 * after the LED_OFF queued by dropping the trigger.
> +	 */
> +	if (led_trigger_is_hw_controlled(led_cdev)) {
> +		led_trigger_remove_hw_control(led_cdev);
> +		led_set_brightness(led_cdev, level);
> +		return 0;
> +	}
> +
> +	ret =3D kbdlight_set_level(level);
> +
>  	if (ret =3D=3D 0 && !(led_cdev->flags & LED_SUSPENDED))
>  		led_cdev->brightness =3D level;

[Severity: Medium]
Because tpacpi_led_kbdlight uses brightness_set_blocking, calling
led_trigger_remove_hw_control() and led_set_brightness() in
kbdlight_set_level_and_update() clears led_cdev->trigger and queues
set_brightness_work on leds_wq asynchronously without holding
led_cdev->led_access or flushing set_brightness_work.

Could this race with a second procfs write or with kbdlight_suspend()?

If a second write to /proc/acpi/ibm/kbdlight arrives before
set_brightness_work runs, led_trigger_is_hw_controlled(led_cdev) is already
false, so the second write calls kbdlight_set_level() synchronously, and
set_brightness_work from the first write then overwrites the EC level out of
order. Similarly, if kbdlight_suspend() runs before set_brightness_work
executes, kbdlight_get_level() in kbdlight_suspend() still sees
TPACPI_KBD_LIGHT_AUTO_LEVEL and returns early without calling
led_classdev_suspend(), allowing the pending work to program the backlight
during suspend.

[ ... ]

> @@ -5301,38 +5392,75 @@ static void kbdlight_suspend(void)

[ ... ]

>  static void kbdlight_notify_change(void)
>  {
>  	struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
>  	enum led_brightness brightness;
> +	bool was_auto, is_auto;
> +	int level;
> =20
>  	guard(mutex)(&kbdlight_mutex);
> =20
>  	/*
> -	 * Check the brightness actually changed, setting the brightness
> -	 * through kbdlight_set_level() also triggers this event.
> +	 * Check the level actually changed, setting the brightness through
> +	 * kbdlight_set_level() also triggers this event.
>  	 */
> -	brightness =3D kbdlight_sysfs_get(NULL);
> -	if (kbdlight_brightness =3D=3D brightness)
> +	level =3D kbdlight_get_level();
> +	if (kbdlight_brightness =3D=3D level)
>  		return;
> =20
> -	kbdlight_brightness =3D brightness;
> +	/*
> +	 * Notifying the trigger core is safe while holding
> +	 * kbdlight_mutex: the transition is only queued, and the worker
> +	 * re-reads the EC level (via hw_offloaded) after this critical
> +	 * section has been left.
> +	 */
> +	is_auto =3D level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +	was_auto =3D kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +	if (is_auto !=3D was_auto)
> +		led_trigger_notify_hw_control_changed(led_cdev, is_auto);
> +
> +	brightness =3D kbdlight_level_to_brightness(level);
> +	kbdlight_brightness =3D level;
>  	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
>  }

[Severity: Medium]
What happens in kbdlight_notify_change() if kbdlight_get_level() returns a
negative error code on a hotkey notification or during kbdlight_resume()?

Previously, kbdlight_notify_change() called kbdlight_sysfs_get(NULL), which
checked if (level < 0). Now kbdlight_get_level() is called directly without=
 an
error check. If kbdlight_get_level() fails and returns a negative value (su=
ch
as -EIO or -ENXIO):

1. is_auto evaluates to false, so if was_auto was true,
   led_trigger_notify_hw_control_changed(led_cdev, false) is called and dro=
ps
   the active auto trigger.

2. kbdlight_level_to_brightness(level) returns the negative error value cas=
t to
   enum led_brightness, which is then stored in kbdlight_brightness and pas=
sed
   to led_classdev_notify_brightness_hw_changed(led_cdev, brightness), expo=
sing
   a wrapped unsigned error value through brightness_hw_changed in sysfs.

Should kbdlight_notify_change() bail out when level < 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102151211.4070=
1-1-kmatzkaczor244@gmail.com?part=3D2
