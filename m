Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793557833;
	b=oYsd2uxTanheoPZ8zD1nbMxGN5sXOq/RaLWyuGT705celbRxRCcHh58n4f+vUtL8wZll
	 pf16t9GrXaijeMIMHm0q8+vZmwGMlxK9IulsDz4cl6Yrw0fsiuY0LIaWuJ1QhCWNHE0z5
	 iCFOa93m8UW5qOHz/GLoaTY87fVZGnXW8k4tykHSJjcnW/qkhxnNzsX3/J/B4A9Mc/4za
	 bShd35iS6LgzqimTFRMi4Af+TeGnbdOdJV4VPFA2QDKdoWq/Mda5dl0zRfCeTLvRwR8L/
	 Az3gmx/95XMQlSkfKDQEcZ0UBDQk5UCQbqHiJ/qQQUKagGoJXWIRvbs8GT3Ltc4t0Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793557833;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=1EJPeAiMC+CVyLboONMl65c6BTsg62mSg/tek3nQToU=;
	b=LqK43VJbnKYobHBclbFRNfYiQjHud8LcYL3ZBN+KisZ/BbTXgZ/rNduNHpdZZCcQQnwJ
	 pYIVUxhb9FqEStsTrHyF8AiHjgjKhw/ldBDzE4Imn2qNmmz6Ps5k/qxngeTaRnVgHEP86
	 HTjMBjf/5c9i3h6edArtdlEvcIvNTC+qIIjpHRNLcGQAeDTKfZ6Ffae96yX2NLbSLwTM/
	 mXd8i55o8fpLv6q20i2pu7ul9IzxHWncXzkkoNZhcA3I8pbLIaxyukeJZ+7XDjJdmp44l
	 gkQbsxhD0/vwx4HYpB4mUmX0dgXBHgnVKKVEH+wgNkY1ew48SfflSRY1uDgW1ePQong==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZAve3unZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B45606A326;
	Sun,  1 Nov 2026 18:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B45606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZAve3unZ
ARC-Seal: i=1; a=rsa-sha256; t=1793557797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MRDnTZU6o/vK/aj95qvvVBS4MMlJu6zfEIYBNp9WhnBMcOsPR4rE2fpheCUNYrnc2C4sUEXpVfi8IfMCQXAz5cwE24NhGc3pa0R9xRnMuCAvbZJ0aZncYkU9IBdN1BqHi+8VNrFDiPatOIWvAaf7+dMxBnmjgJ3GQyoh1Go4Npk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793557797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1EJPeAiMC+CVyLboONMl65c6BTsg62mSg/tek3nQToU=; 
	b=Zt1VnZmot4tSHULSVhgCz4pzimkB2r+JzsJvwTyJdbOjuVKGNg038qOxVSfsXJcYVt0zTuHq4qIHpQSjDMdrF/izxdEj2xZk0gdQ5qE0mk2qTI20tXNpiJblJRTGAJIPFJuvsYj4mvuMbFl5O6dIzVNjiMesXeIxV1oseKk/9wo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ZAve3unZT4kq8cHmKLnaPf1QjiaTDQdaL+jAynC8djDH2UcKLjuvOgFQweI3JzNttac8BlNPG1KgbrSNBPbqyjJc6Y3LBZIad0RonWir+4Vi7FuE1cY3pJJyUVlVHW+jyE2RPD4zDpjLmdSsgqKKyQAOQu8ppeXtcIrXvUaPKGPy6f5Hm849/25mHAguODi/jsB2Ct9i1bXLc8Y0mhYfr5K09k4eLLTckOpT1I8kE8t8aH4ISEj/Rptopvte4EuSYGq5wsnrjgpT7xXH1Pkv3braezDlsBZYFWJeWkzNCZhLYY22Bd96gc6V6OKv4Z6AKC6EKmuLw3bzATUUQyzyeQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=1EJPeAiMC+CVyLboONMl65c6BTsg62mSg/tek3nQToU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793557795752456.46629151756554;
	Sun, 1 Nov 2026 10:29:55 -0800 (PST)
Message-ID: <9b8b8c7308163c4adac8f97912d666d1b6854ffc.camel@rong.moe>
Subject: Re: [RFC PATCH 1/1] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
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
In-Reply-To: <20261101100123.28749-2-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
	 <20261101100123.28749-2-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:24:49 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Qiling

On Sun, 2026-11-01 at 18:01 +0800, Qiling Zhu wrote:
> Recent ThinkPads with an ambient light sensor (ALS) support an auto mode
> for the keyboard backlight: the EC controls the backlight according to
> ambient light. The mode is EC keyboard backlight level 3, in addition to
> the two fixed brightness levels currently exposed by the driver, and is
> currently reachable only through the Fn+Space shortcut, which is handled
> directly by the firmware.
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
>   - if the hardware is already in auto mode at driver initialization,
>     the trigger is set as the default one
>=20
> Deliberately unchanged:
>=20
>   - max_brightness stays 2, auto mode is not multiplexed into the
>     brightness value
>   - writing 3 to /proc/acpi/ibm/kbdlight keeps returning -EINVAL, while
>     reads keep reporting the current EC level verbatim (including 3)
>   - module unload still turns the keyboard backlight off
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>=20
> Note: Documentation/admin-guide/laptops/thinkpad-acpi.rst has no kbdlight
> section at all, so there is no in-tree documentation to update; the
> userspace-facing semantics of hardware control triggers are documented
> in Documentation/leds/leds-class.rst.
>=20
> Open questions (details in the cover letter): whether a MLCG capability
> bit indicates auto mode support, and the EC behavior on ALS-less models
> when asked for level 3.
>=20
>  drivers/platform/x86/lenovo/Kconfig         |   1 +
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 104 ++++++++++++++++----
>  2 files changed, 88 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 516594993..74fc66a44 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -75,6 +75,7 @@ config THINKPAD_ACPI
>  	depends on RFKILL || RFKILL =3D n
>  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on LEDS_TRIGGERS_HW_CHANGED

Nah. No driver should depend on or select LEDS_TRIGGERS_HW_CHANGED.
Everything still works without it.

That's also why no driver depends on or selects
LEDS_BRIGHTNESS_HW_CHANGED.

Both options are only enabled if a user (or a distribution) opts into it
while configuring Kconfig options.

>  	depends on I2C
>  	depends on DRM
>  	select ACPI_PLATFORM_PROFILE
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad..cd5c17d5f 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data =3D {
>   * Keyboard backlight subdriver
>   */
> =20
> +/* EC level that selects ALS-controlled auto mode for the keyboard backl=
ight */
> +#define TPACPI_KBD_LIGHT_AUTO_LEVEL	3
> +
>  static enum led_brightness kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
> =20
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
> +
> +static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_=
cdev)
> +{
> +	return kbdlight_get_level() =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +}
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
> +
> +	if (kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +		tpacpi_led_kbdlight.led_classdev.default_trigger =3D
> +			kbdlight_auto_trigger.name;
> +
>  	rc =3D led_classdev_register(&tpacpi_pdev->dev,
>  				   &tpacpi_led_kbdlight.led_classdev);
>  	if (rc < 0) {
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

Don't pass TPACPI_KBD_LIGHT_AUTO_LEVEL to
led_classdev_notify_brightness_hw_changed(). Please pass 0 instead.

> +}
> +
>  static struct ibm_struct kbdlight_driver_data =3D {
>  	.name =3D "kbdlight",
>  	.read =3D kbdlight_read,

I guess kbdlight_write() would need to call kbdlight_notify_hw_control()
to update the trigger's state as well.

Meanwhile, kbdlight_suspend() and kbdlight_resume() will override the
trigger.

> @@ -11581,22 +11665,8 @@ static bool tpacpi_driver_event(const unsigned i=
nt hkey_event)
>  		/* Key events are suppressed by default hotkey_user_mask */
>  		return false;
>  	case TP_HKEY_EV_KBD_LIGHT:
> -		if (tp_features.kbdlight) {
> -			enum led_brightness brightness;
> -
> -			guard(mutex)(&kbdlight_mutex);
> -
> -			/*
> -			 * Check the brightness actually changed, setting the brightness
> -			 * through kbdlight_set_level() also triggers this event.
> -			 */
> -			brightness =3D kbdlight_sysfs_get(NULL);
> -			if (kbdlight_brightness !=3D brightness) {
> -				kbdlight_brightness =3D brightness;
> -				led_classdev_notify_brightness_hw_changed(
> -					&tpacpi_led_kbdlight.led_classdev, brightness);
> -			}
> -		}
> +		if (tp_features.kbdlight)
> +			kbdlight_notify_change();

Please split pure refactor (moving existing code) and feature additions
into two patches.

Thanks,
Rong

>  		/* Key events are suppressed by default hotkey_user_mask */
>  		return false;
>  	case TP_HKEY_EV_DFR_CHANGE_ROW:
