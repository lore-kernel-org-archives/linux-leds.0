Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793644707;
	b=gutANjHecAl6h25PJFmrwmmXU/PcR2Jfq1JLP99HFSALTwpSr8hGmk6yYXezgoylETBN
	 UA9AjxLKUPPYVQQPi+EB/9HEEhFhAs5hReXu32VptWRqKmk/o+WD/6jFPuJculurGraYb
	 c/za3rcZf90W+kaKMQ2k+/Wsiside1Egjw2mb51/HrfAHt4Oga6cl+I0sENBR8JqJMy/c
	 ukv8IerO0GwzdnOERLlafCNX8JDMmKi0ED/ZKkW3Ynj0OLgS91ip3wP4jyAyMdH/LSIBt
	 ozWiqlqBtc2vBDTPGIOb30N2989hqdNYwgzZun0FF9BfeX5wkkX+bHqQwm2rK1c0X/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644707;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=YyTNUB58XiYL7Eyza4cKaimcacs/nSWRNsZcdsp4tZc=;
	b=sqtT4WkW3FzWH1po+jwCXPyKhlLSvFsUQg3jx8IRyX5tfgKObRpNmtqU1WgvxAJEvKlu
	 JToPEW6q+jtN9uDXG50YM2r2DY4xPVyF135tnqVu41j49o/Uf0FTBGKpA+AAIqdn4s/fa
	 JeDGeIrvh/A8babjYYjSZJhIRMJO8jarRJMFW/A9PpaVjyGxfDKixUCWqcXb7EQxyNqJ7
	 P5gtyv1ydGK2i97APStvwp0pKrMY4GB7LCXPR/xylZb0n+8nAaQxjYEL1Kd96WG5aHBpi
	 D/sBcZlr9wIl4qgQ8MCj7ODmb80bQYBSP/3ulnFjMzQLttS5HjY/WXc5dcT4aYadxzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=QVObcauK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DD3606A324;
	Mon,  2 Nov 2026 18:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8DD3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=QVObcauK
ARC-Seal: i=1; a=rsa-sha256; t=1793644680; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QnAeZl9QXDSq3NhHXMPLHueWiZfBajp3MPMXIO3ZShfo+kZFlDnMucKuivI4r6qdimYn6g1sAzfOZg15s37trJft5AAV9WSVEVGuyV7Ef7qa+qINHSt8WNV3zGXxAgf7D3baaW5UyCDiuNdnwVdWOKj37D6e45Ij2GFwqg/ddB4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793644680; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YyTNUB58XiYL7Eyza4cKaimcacs/nSWRNsZcdsp4tZc=; 
	b=WpDl1NZO81TZLIS529+SUxmm89RDnewdC/nh7TWQgMp5FkSQ2Yqcs9NuSJhyMgDcACcGN4Ie3LwV2+f2IZfKCpvJknAhfpoMTCk9aHYdrBX2ZTfvXSntmXKyXLGlPaZplJzUzCL4li/UkhxDyjHhpaVgJWxK4g50z9YyVpI6l/Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=QVObcauKl5RTwQV0RjFjg1gbAGFLDFnNtsbGZyN+V8wcNLyFiZw0wRhvuPb/sdGeKBQIi4jEWRhFyeZxbcE+Jqax7ZQzyXNbNvBEdAz3Q7AqENI87csdinfItvMBLobvJLCD4Yc9/np8kCATtadI6XDWnw49MBgC2Iun6GfALefacYAC8xAShk7jwNkUKKXSWPN5uOyrpTzqeKrP0XfejAuILw3A9QqOhIrjlM29uKnc+u6HRmFbeAy3aWux8+lXQzl8WdUNeAmhCfaQqtk1UU8ZK9EfqXB11Xi4BBSRf6HRiDo4/PcyJAD7mcVqgH5yue8hjlractpPOBAyKAJqLQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=YyTNUB58XiYL7Eyza4cKaimcacs/nSWRNsZcdsp4tZc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793644677372100.39152180631663;
	Mon, 2 Nov 2026 10:37:57 -0800 (PST)
Message-ID: <e52830d6eb20e826a64910ef242348e790bf1815.camel@rong.moe>
Subject: Re: [RFC PATCH v2 2/2] platform/x86: thinkpad_acpi: Add support
 for auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, 
	ibm-acpi-devel@lists.sourceforge.net, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek	
 <pavel@kernel.org>, platform-driver-x86@vger.kernel.org,
 vishnuocv@gmail.com, 	vsankar@lenovo.com
In-Reply-To: <20261102151211.40701-3-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
	 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261102151211.40701-3-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 02:32:51 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-2 
X-ZohoMailClient: External

Hi Qiling,

On Mon, 2026-11-02 at 23:10 +0800, Qiling Zhu wrote:
> Recent ThinkPads with an ambient light sensor (ALS) support an auto mode
> for the keyboard backlight: the EC controls the backlight according to
> ambient light. The mode is EC keyboard backlight level 3, above the two
> fixed levels exposed so far, and is currently reachable only through the
> Fn+Space shortcut, which is handled directly by the firmware.
>=20
> Wire the auto mode up as a private hardware control trigger, named
> "tpacpi-kbd-auto", on top of the LED hw control trigger framework:
>=20
>   - selecting the trigger writes level 3 (activate); the offloaded state
>     is derived from the current EC level
>   - when Fn+Space cycles into or out of auto mode, the driver notifies
>     the LED core about the hardware-initiated hardware control
>     transition, so the trigger state (shown bracketed in the trigger
>     sysfs attribute) follows along
>   - if the EC is already in auto mode at driver initialization, the
>     trigger is set as the default one
>=20
> The auto mode is not a brightness level: max_brightness stays 2 and the
> LED core is always told a brightness of 0 while in auto mode. The proc
> interface keeps reporting the raw EC level, including 3, and keeps
> rejecting writes of 3 with -EINVAL; writing a regular level through it
> while in auto mode drops the trigger, like writing a brightness through
> sysfs does. In auto mode suspend and resume are left to the EC and the
> firmware; on resume the restored EC level is observed and reconciled.
>=20
> LEDS_TRIGGERS is selected to keep the trigger functional in
> stripped-down configurations.
>=20
> Deliberately unchanged: module unload still resets the backlight to off;
> retaining auto mode across unload is left for future work.
>=20
> Note that Documentation/admin-guide/laptops/thinkpad-acpi.rst has no
> kbdlight section at all, so there is no in-tree documentation to update;
> userspace-facing semantics of hardware control triggers are documented
> in Documentation/leds/leds-class.rst.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/Kconfig         |   1 +
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 152 ++++++++++++++++++--
>  2 files changed, 141 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 516594993..77d159a3a 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -83,6 +83,7 @@ config THINKPAD_ACPI
>  =09select NVRAM
>  =09select NEW_LEDS
>  =09select LEDS_CLASS
> +=09select LEDS_TRIGGERS
>  =09select INPUT_SPARSEKMAP
>  =09help
>  =09  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 3260eaa62..7b46ad6f9 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5102,6 +5102,14 @@ static struct ibm_struct video_driver_data =3D {
>   * Keyboard backlight subdriver
>   */
> =20
> +/* EC level that selects ALS-controlled auto mode for the keyboard backl=
ight */
> +#define TPACPI_KBD_LIGHT_AUTO_LEVEL=093
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
>  =09return status & BIT(9);
>  }
> =20
> +/* The auto mode is not a brightness level; report it as off to the LED =
core. */
> +static enum led_brightness kbdlight_level_to_brightness(int level)
> +{
> +=09if (level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +=09=09return 0;
> +
> +=09return level;
> +}
> +
>  static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
>  =09=09=09enum led_brightness brightness)
>  {
> @@ -5194,16 +5211,54 @@ static enum led_brightness kbdlight_sysfs_get(str=
uct led_classdev *led_cdev)
>  =09if (level < 0)
>  =09=09return 0;
> =20
> -=09return level;
> +=09return kbdlight_level_to_brightness(level);
> +}
> +
> +static struct led_hw_trigger_type kbdlight_auto_trigger_type;
> +
> +static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
> +{
> +=09/*
> +=09 * The EC may already be in auto mode (cycled there on Fn+Space, or
> +=09 * active since before the driver loaded), in which case there is
> +=09 * nothing to program.
> +=09 */
> +=09if (kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +=09=09return 0;

I don't think the device needs this, as kbdlight_set_level() should be
idempotent.

> +
> +=09if (kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL))
> +=09=09return -EIO;
> +
> +=09/*
> +=09 * Check that the EC actually accepted the auto mode; on error the
> +=09 * trigger core reverts the LED to the "none" trigger.
> +=09 */
> +=09if (kbdlight_get_level() !=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +=09=09return -EIO;

Nah. Please wait until Vishnu and Mark answer about the approach to
determine the support for auto mode.

> +
> +=09return 0;
>  }
> =20
> +static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_=
cdev)
> +{
> +=09return kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +}
> +
> +static struct led_trigger kbdlight_auto_trigger =3D {
> +=09.name=09=09=3D "tpacpi-kbd-auto",
> +=09.trigger_type=09=3D &kbdlight_auto_trigger_type,
> +=09.activate=09=3D kbdlight_auto_trigger_activate,
> +=09.hw_offloaded=09=3D kbdlight_auto_trigger_hw_offloaded,
> +};
> +
>  static struct tpacpi_led_classdev tpacpi_led_kbdlight =3D {
>  =09.led_classdev =3D {
>  =09=09.name=09=09=3D "tpacpi::kbd_backlight",
>  =09=09.max_brightness=09=3D 2,
> -=09=09.flags=09=09=3D LED_BRIGHT_HW_CHANGED,
> +=09=09.flags=09=09=3D LED_BRIGHT_HW_CHANGED | LED_TRIG_HW_CHANGED,
>  =09=09.brightness_set_blocking =3D &kbdlight_sysfs_set,
>  =09=09.brightness_get=09=3D &kbdlight_sysfs_get,
> +=09=09.trigger_type=09=3D &kbdlight_auto_trigger_type,
>  =09}
>  };
> =20
> @@ -5221,9 +5276,30 @@ static int __init kbdlight_init(struct ibm_init_st=
ruct *iibm)
>  =09=09return -ENODEV;
>  =09}
> =20
> -=09kbdlight_brightness =3D kbdlight_sysfs_get(NULL);
> +=09kbdlight_brightness =3D kbdlight_get_level();
> +=09if (kbdlight_brightness < 0)
> +=09=09kbdlight_brightness =3D 0;
>  =09tp_features.kbdlight =3D 1;
> =20
> +=09/*
> +=09 * Register the auto-mode trigger before the LED classdev: if the
> +=09 * EC is already in auto mode, the trigger can then be set as the
> +=09 * default one and gets activated during LED classdev registration.
> +=09 */
> +=09rc =3D devm_led_trigger_register(&tpacpi_pdev->dev,
> +=09=09=09=09       &kbdlight_auto_trigger);
> +=09if (rc) {
> +=09=09tp_features.kbdlight =3D 0;
> +=09=09return rc;
> +=09}
> +
> +=09tpacpi_led_kbdlight.led_classdev.hw_control_trigger =3D
> +=09=09kbdlight_auto_trigger.name;
> +
> +=09if (kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +=09=09tpacpi_led_kbdlight.led_classdev.default_trigger =3D
> +=09=09=09kbdlight_auto_trigger.name;
> +
>  =09rc =3D led_classdev_register(&tpacpi_pdev->dev,
>  =09=09=09=09   &tpacpi_led_kbdlight.led_classdev);
>  =09if (rc < 0) {
> @@ -5246,9 +5322,22 @@ static int kbdlight_set_level_and_update(int level=
)
>  =09int ret;
>  =09struct led_classdev *led_cdev;
> =20
> -=09ret =3D kbdlight_set_level(level);
>  =09led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> =20
> +=09/*
> +=09 * Leaving auto mode through the proc interface has to drop the
> +=09 * trigger, like writing a brightness through sysfs does. Route the
> +=09 * new level through the LED core as well, so that it is applied
> +=09 * after the LED_OFF queued by dropping the trigger.
> +=09 */
> +=09if (led_trigger_is_hw_controlled(led_cdev)) {

You don't need this, and it causes a TOCTOU issue between
is_hw_controlled() and remove_hw_control().

> +=09=09led_trigger_remove_hw_control(led_cdev);
> +=09=09led_set_brightness(led_cdev, level);

???

Can't you simply refactor and call kbdlight_notify_change() here?

In detail:

- PATCH 1: split kbdlight_notify_change() into a function that accepts a
hw brightness level and a wrapper that queries the hardware
- PATCH 2: call the former in kbdlight_set_level_and_update(), like what
commit 07f48f668fac ("platform/x86: ideapad-laptop: add FnLock LED class
device") did
- PATCH 3: add support for auto mode

With those changes, kbdlight_set_level_and_update() should automatically
removes the triggers without the need of poking the LED core harshly.

Besides, IMO the attribute should really be deprecated with a warning
stating that writing to the attribute may desynchronize the LED core, so
that we can reduce the maintenance burden instead of infinitely working
around all sorts of such issues [1]. I am not an expert at this driver,
so I will defer it to other maintainers.

> +=09=09return 0;
> +=09}
> +
> +=09ret =3D kbdlight_set_level(level);
> +
>  =09if (ret =3D=3D 0 && !(led_cdev->flags & LED_SUSPENDED))
>  =09=09led_cdev->brightness =3D level;

[1]: for example, here is a pre-existing race condition.

> =20
> @@ -5293,6 +5382,8 @@ static int kbdlight_write(char *buf)
>  =09return kbdlight_set_level_and_update(level);
>  }
> =20
> +static void kbdlight_notify_change(void);
> +
>  static void kbdlight_suspend(void)
>  {
>  =09struct led_classdev *led_cdev;
> @@ -5301,38 +5392,75 @@ static void kbdlight_suspend(void)
>  =09=09return;
> =20
>  =09led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +
> +=09/*
> +=09 * In auto mode the EC drives the backlight and the firmware turns
> +=09 * it off for suspend and restores it on resume by itself; keep the
> +=09 * LED core out of it entirely.
> +=09 */
> +=09if (kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +=09=09return;
> +

As I've said, getting rid of led_classdev_{suspend,resume}() completely
when the device supports auto mode will make our life much easier.

>  =09led_update_brightness(led_cdev);
>  =09led_classdev_suspend(led_cdev);
>  }
> =20
>  static void kbdlight_resume(void)
>  {
> +=09struct led_classdev *led_cdev;
> +
>  =09if (!tp_features.kbdlight)
>  =09=09return;
> =20
> -=09led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
> +=09led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +
> +=09/* Only balance a suspend that actually suspended the LED. */
> +=09if (led_cdev->flags & LED_SUSPENDED) {
> +=09=09led_classdev_resume(led_cdev);
> +=09=09return;
> +=09}
> +
> +=09/*
> +=09 * Auto mode was left running over suspend; observe what the
> +=09 * firmware actually restored.
> +=09 */
> +=09kbdlight_notify_change();

If you'd like to do so, it should be in a separated patch, too.

Thanks,
Rong

>  }
> =20
>  /*
> - * The EC cycles the keyboard backlight level itself on Fn+Space; check
> - * the current level and update the LED core state.
> + * The EC cycles the keyboard backlight level (and auto mode) itself on
> + * Fn+Space; check the current level and update the LED core state.
>   */
>  static void kbdlight_notify_change(void)
>  {
>  =09struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
>  =09enum led_brightness brightness;
> +=09bool was_auto, is_auto;
> +=09int level;
> =20
>  =09guard(mutex)(&kbdlight_mutex);
> =20
>  =09/*
> -=09 * Check the brightness actually changed, setting the brightness
> -=09 * through kbdlight_set_level() also triggers this event.
> +=09 * Check the level actually changed, setting the brightness through
> +=09 * kbdlight_set_level() also triggers this event.
>  =09 */
> -=09brightness =3D kbdlight_sysfs_get(NULL);
> -=09if (kbdlight_brightness =3D=3D brightness)
> +=09level =3D kbdlight_get_level();
> +=09if (kbdlight_brightness =3D=3D level)
>  =09=09return;
> =20
> -=09kbdlight_brightness =3D brightness;
> +=09/*
> +=09 * Notifying the trigger core is safe while holding
> +=09 * kbdlight_mutex: the transition is only queued, and the worker
> +=09 * re-reads the EC level (via hw_offloaded) after this critical
> +=09 * section has been left.
> +=09 */
> +=09is_auto =3D level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +=09was_auto =3D kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +=09if (is_auto !=3D was_auto)
> +=09=09led_trigger_notify_hw_control_changed(led_cdev, is_auto);
> +
> +=09brightness =3D kbdlight_level_to_brightness(level);
> +=09kbdlight_brightness =3D level;
>  =09led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
>  }
> =20
