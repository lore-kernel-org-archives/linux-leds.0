Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140194B99BE
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332680; cv=none; b=r0zMZd5fadoxVqArGLj9a0HIVSU2ZDAuS+LVPs6okCaa3AlBZwrPpt7IctWbVcMTXo/q/Vvwsv2KrD0teyATzibWtuhaiZU+CbgHMtY8mf4SGeM6UmC0NWP3/SsgKosjYasroGcQfTdMuj5A+0ZH0Kv+26Zfmdt1Gi/gIA5tD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332680; c=relaxed/simple;
	bh=P4IoksmHl4BftZ4/F5dGsNXSb9OlA2UD3vtzRHK9IU4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qzG0WesHNhZXyPLUKuWc/4ZiqzFSn3z/mcUpYgGRiSA+Uzyj7aBrVzttYiJ1BRW+dDHpfr48I7teJjWphvuZfKbKfMywky4uYVqwy5sp0MLuujdG5oTQchMI+Qc1TA0nf92HkENrs035z/FRA0+3oEjWIYS7SxMPDHO17ruwiq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8G/7l7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8G/7l7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D7E1F000C4;
	Sun, 18 Oct 2026 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792332678;
	bh=8FKvB2XcwFEY3d5KQ93cfe5bKY3uXkWJufQAVlXnW3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h8G/7l7svZ0MHQMncd9brd8k2pbxibCsHfD8mTykbqC3MD+kBe6P4vIzX8p9es9jt
	 UGFHlXVPNF2ub3sbEZ8K0CSpqH18u5dp4G6r1ZGMXQ9ovS2leybnONIujvz3gLKCG4
	 mu8C+YY8vTQ95n4VEL84CQ4ezS7CWBrLmvax8yAxlpHihlLa1uG/rmMi++g+HbT6fY
	 Vi4OvzgfhX2eOmJkObChXDd6bsxUxW6P+YuyYKIZE9g51ikCjTMLU8GUfHGyc1VVkl
	 0j8bi8vzr0a/4v90YSDg/GXqt9D3kH1SYP41f29c/pcuIKJuYwaGxMfA4/brCvbubw
	 fCCDpUdBpgyLg==
Message-ID: <sashiko-outbox-176187@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] leds: class: Create "brightness_hw_changed"
 attribute atomically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-5-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 14:11:18 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] leds: class: sleeping in atomic context in led_classdev_notify_bri=
ghtness_hw_changed()
- [High] leds: NULL or ERR_PTR dereference in led_classdev_notify_brightnes=
s_hw_changed()
--

commit a70a68ffb21d71853f220e24fa090cea4db91df2
Author: Armin Wolf <W_Armin@gmx.de>

leds: class: Create "brightness_hw_changed" attribute atomically

This patch converts the brightness_hw_changed sysfs attribute to a static
attribute group with an is_visible callback so that the device core creates
it before sending the uevent to userspace. It also removes the cached
kernfs_node pointer from struct led_classdev and switches
led_classdev_notify_brightness_hw_changed() to use sysfs_notify().

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 3775ad13762f5..d460f041ed86e 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c

[ ... ]

> @@ -123,51 +116,48 @@ static ssize_t brightness_hw_changed_show(struct de=
vice *dev, const struct devic
> =20
>  static const DEVICE_ATTR_RO(brightness_hw_changed);
> =20
> -static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
> -{
> -	struct device *dev =3D led_cdev->dev;
> -	int ret;
> +static const struct attribute *const led_brightness_hw_changed_attrs[] =
=3D {
> +	&dev_attr_brightness_hw_changed.attr,
> +	NULL,
> +};

[ ... ]

> +#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
>  void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_=
cdev, unsigned int brightness)
>  {
> -	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
> -		return;
> -
>  	led_cdev->brightness_hw_changed =3D brightness;
> -	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
> +	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
>  }
>  EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);

[Severity: High]
Can replacing sysfs_notify_dirent() with sysfs_notify() here cause sleeping
in atomic context?

Previously, sysfs_notify_dirent() called kernfs_notify() on the cached
kernfs_node, which may be called from any context since it only uses
rcu_read_lock(), spin_lock_irqsave(&kernfs_notify_lock, flags), and
schedule_work().

With sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed"), a
non-NULL attribute name causes sysfs_notify() to look up the node via
kernfs_find_and_get() -> kernfs_find_and_get_ns(), which acquires the
sleeping rw_semaphore root->kernfs_rwsem:

fs/sysfs/file.c:sysfs_notify() {
	...
	if (kn && attr) {
		tmp =3D kernfs_find_and_get(kn, attr);
		kernfs_put(kn);
		kn =3D tmp;
	}
	...
}

fs/kernfs/dir.c:kernfs_find_and_get_ns() {
	...
	down_read(&root->kernfs_rwsem);
	kn =3D kernfs_find_ns(parent, name, ns);
	kernfs_get(kn);
	up_read(&root->kernfs_rwsem);
	...
}

In drivers/hid/hid-lg-g15.c, lg_g13_event() and lg_g510_leds_event() call
led_classdev_notify_brightness_hw_changed() when a hardware backlight
brightness change report arrives:

drivers/hid/hid-lg-g15.c:lg_g13_event() {
	...
	if (backlight_disabled ^ g15->backlight_disabled) {
		led_classdev_notify_brightness_hw_changed(
			&g15->leds[LG_G15_KBD_BRIGHTNESS].mcdev.led_cdev,
			backlight_disabled
			? 0 : g15->leds[LG_G15_KBD_BRIGHTNESS].brightness);
		g15->backlight_disabled =3D backlight_disabled;
	}
	...
}

Those handlers are invoked from lg_g15_raw_event() via the USB interrupt URB
completion path hid_irq_in() -> hid_safe_input_report() ->
__hid_input_report(), which runs in hardirq/atomic context.

[Severity: High]
Also in led_classdev_notify_brightness_hw_changed(), could removing the
WARN_ON(!led_cdev->brightness_hw_changed_kn) guard lead to a NULL or ERR_PTR
dereference on led_cdev->dev (or a use-after-free after commit "leds: class:
Split led_classdev_register_ext()" later in the series)?

Previously, if a classdev was not registered or did not set
LED_BRIGHT_HW_CHANGED, led_cdev->brightness_hw_changed_kn was NULL and the
function warned and returned before touching led_cdev->dev. That behavior is
also documented in Documentation/leds/leds-class.rst:

  Calling led_classdev_notify_brightness_hw_changed on a classdev not
  registered with the LED_BRIGHT_HW_CHANGED flag is a bug and will
  trigger a WARN_ON.

Without a guard, sysfs_notify(&led_cdev->dev->kobj, ...) immediately
dereferences kobj->sd in fs/sysfs/file.c:sysfs_notify().

For example, in drivers/platform/x86/system76_acpi.c, system76_probe() skips
registering data->kb_led when data->kbled_type =3D=3D KBLED_NONE, leaving
data->kb_led.dev as NULL:

drivers/platform/x86/system76_acpi.c:system76_probe() {
	...
	if (data->kbled_type !=3D KBLED_NONE) {
		err =3D devm_led_classdev_register(&pdev->dev, &data->kb_led);
		if (err)
			return err;
	}
	...
}

However, system76_notify() is still installed and calls kb_led_notify() ->
led_classdev_notify_brightness_hw_changed(&data->kb_led, ...) through
kb_led_hotkey_hardware(), kb_led_hotkey_toggle(), kb_led_hotkey_down(), and
kb_led_hotkey_up() on ACPI events 0x80-0x83.

Similarly, in drivers/platform/x86/toshiba_acpi.c, toshiba_acpi_probe()
ignores the return value of led_classdev_register(&pdev->dev, &dev->kbd_led=
):

drivers/platform/x86/toshiba_acpi.c:toshiba_acpi_probe() {
	...
	if (dev->kbd_illum_supported &&
	    (dev->kbd_mode =3D=3D SCI_KBD_MODE_FNZ || dev->kbd_type =3D=3D 2)) {
		dev->kbd_led.name =3D "toshiba::kbd_backlight";
		dev->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
		dev->kbd_led.max_brightness =3D 1;
		dev->kbd_led.brightness_set =3D toshiba_kbd_backlight_set;
		dev->kbd_led.brightness_get =3D toshiba_kbd_backlight_get;
		led_classdev_register(&pdev->dev, &dev->kbd_led);
	}
	...
}

If registration fails, dev->kbd_led.dev is left as NULL or ERR_PTR (or a
freed pointer after "leds: class: Split led_classdev_register_ext()"), while
toshiba_acpi_notify() and toshiba_acpi_kbd_bl_work() still call
led_classdev_notify_brightness_hw_changed(&dev->kbd_led, ...).

> -#else
> -static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
> -{
> -	return 0;
> -}
> -static void led_remove_brightness_hw_changed(struct led_classdev *led_cd=
ev)
> -{
> -}
>  #endif

[ ... ]

>
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D4
