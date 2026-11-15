Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794730996;
	b=MgcJrKWoQaGn7+fGd55mVvC9mK+muGATG4kXSfI4YhzCe9uWjKAEqrI3cQ83CP3jWIie
	 MArHx/8MRrixGa5lsr3eAJJ0Y+cpU3o12xJhQxah+gR72eyVEsHKJS286u4PIIbnnAd+9
	 RQaGoki8hHvDu5yA0xmVsDUk2fOQ9/P/HFhC+W+TcuirBokwSG5ax2gZNSMf4FtJUwWAM
	 rncosOfFvBjsllXuJiBaVgVYV09K0pajrVdPT0X8rcNlOF8RxH6qkJyVSpUvMl5Gxnety
	 EuBiYTybbOvQoo9viPwlIekX0DodntCftQwfIY8hMFI+XSnJwaiAlGBdCvGNQUd3R3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730996;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=aaNQL++D9N+GmkaFE6XF03ix3k0yr0hKRtisBHFV+jc=;
	b=18zXcf5BDmD5bRdS9H6dkgz8056G6cPQGz1sbMzujL2ePjdMori3am2PwAhlzJehXA8T
	 r0Y1PEma4fpxKlVN1y4stDtIh5/P2DhoG8tg4PqTWHzp8VI/8dgK7avnOK3hSuUxqxKBJ
	 rbNMzvK0XzuQ2Q2j6jHiWX/zTj3lJl/9m3riaCEE3+f8b3I+fIp7UmsX8JHpz+D7wFcI2
	 dBl6uo92WvjMdf3tXBQtUcznFptQmEPLnUOpJllVsDULO+G8dPrzgyPbyNOKAU/ZHv4MA
	 MBu43xotWEjbe98jhDNtCSo17Ww0+15/k82ohTvk7iWVmLQdk32wvXiJ0ySL8lE0d5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=YjVKAjZf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F72606A31A;
	Sun, 15 Nov 2026 08:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F72606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=YjVKAjZf
ARC-Seal: i=1; a=rsa-sha256; t=1794730971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bnCWSZz5hm7+1PCztJ6+5PM1UjcO5qlDLsn7K9m9iaSG+P+pDoW3vgBBquFQFbwOH6YAWg65IFcpMGqA8ZMi7X68Kf1fFtOf5EmfUjWDMkeFOVs8X1Xj4GfwWIgzZ+AXc4CxqN6cR6PbbBssmnQ94UGwVXP+WCvBeLyaSYvev3g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794730971; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aaNQL++D9N+GmkaFE6XF03ix3k0yr0hKRtisBHFV+jc=; 
	b=O4QYyKMbXkvxMQSDXeI60ONQiZE5nMZUsKjFBsXPuTUc3Qlck64CocZI5GBUAl+f6jvPFIjG/2d2AwDJlcZRPYZSNWkSEKbf+HQw6XjlZLxw7m3GhM9beMlAG40bEVFo7GuPBBpafzqhfV+9wz1q/KQp8skYbKNER2MaRWTSzv4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=YjVKAjZfLMfrR1CfAgrVfQn2f7IKDBIprVHqQjcDqIdHCqsEO2ACzBHFjL/bYrdlylZUEsfHdPySBvzs6m2+pHeGsHkdnwY+y79UEPQJrD6O+AA/B/41QjDzuras6lSMAKG6xzpxiMyi0vO6Sj+lV0kDE1qY2EeRwVPYJNqli+r+Po8vF8SXW0sCHFux74m1/73MbNa++yvoUF0+KipEBKrBRf7Wzk0jwqPthYC/0BLYDH+VzHKuSLVJLVe4VTy8yKA6hqM6sOQlaz2e9OikKQgoAuy9Adzc39oBjBa7z1SzmfruLvyM/jjJaXedUrcu4YnIYCWesxeBJty4xxmozw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=aaNQL++D9N+GmkaFE6XF03ix3k0yr0hKRtisBHFV+jc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794730968576109.36158973206864;
	Sun, 15 Nov 2026 00:22:48 -0800 (PST)
Message-ID: <78209dfec0574dd6ccc4b1b1410e0c23925a95ca.camel@rong.moe>
Subject: Re: [PATCH v3 6/7] platform/x86: thinkpad_acpi: Add support for
 auto keyboard backlight
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>, Lee Jones
	 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman
	 <griffin@kroah.com>, vishnuocv@gmail.com, vsankar@lenovo.com, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261114174814.62153-7-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-7-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 16:17:39 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Qiling,

On Sun, 2026-11-15 at 01:48 +0800, Qiling Zhu wrote:
> Wire the EC keyboard backlight auto mode (level 3) up as a private
> hardware control trigger, named "tpacpi-kbd-auto", on top of the LED
> hw control trigger framework.  On machines that support auto mode
> (MLCG bit 20) the trigger is registered and set as the LED's trigger
> type.
>=20
> Selecting the trigger switches the backlight to auto mode; the
> offloaded state is derived from the cached EC level.  When Fn+Space
> cycles into or out of auto mode, the driver notifies the trigger core,
> so the trigger state shown in the trigger sysfs attribute follows
> hardware-initiated transitions.  If the EC is already in auto mode at
> driver initialization, the trigger is set as the default one.  Writing
> a regular level through either sysfs or proc leaves auto mode, and the
> trigger is dropped by the LED core.
>=20
> Registering the trigger is allowed to fail; basic backlight control
> keeps working in that case.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/Kconfig         |  1 +
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 95 +++++++++++++++++++--
>  2 files changed, 89 insertions(+), 7 deletions(-)
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
> index f9e2d324d..f11e61417 100644
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
>  =09return status & BIT(9);
>  }
> =20
> +static struct led_hw_trigger_type kbdlight_auto_trigger_type;
> +
> +static enum led_brightness kbdlight_level_to_brightness(int level)
> +{
> +=09/* Auto mode is not a brightness level; report it as off. */
> +=09if (level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +=09=09return 0;
> +
> +=09return level;
> +}

Please move the helper to PATCH 1 and use it there.

Meanwhile, the return type can be int.

> +
> +static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
> +{
> +=09guard(mutex)(&kbdlight_mutex);
> +
> +=09return kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL);

This does not update kbdlight_brightness. See also my reply to PATCH 3.

> +}
> +
> +static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_=
cdev)
> +{
> +=09guard(mutex)(&kbdlight_mutex);
> +
> +=09return kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +}
> +
> +static struct led_trigger kbdlight_auto_trigger =3D {
> +=09.name=09=09=3D "tpacpi-kbd-auto",
> +=09.trigger_type=09=3D &kbdlight_auto_trigger_type,
> +=09.activate=09=3D kbdlight_auto_trigger_activate,
> +=09.hw_offloaded=09=3D kbdlight_auto_trigger_hw_offloaded,
> +};
> +
>  static int kbdlight_set_level_and_update(int level);
> =20
>  static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
> @@ -5204,11 +5241,11 @@ static enum led_brightness kbdlight_sysfs_get(str=
uct led_classdev *led_cdev)
>  =09int level;
> =20
>  =09level =3D kbdlight_get_level();
> -=09/* Auto mode is not a brightness level; report it as off. */
> -=09if (level < 0 || level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +
> +=09if (level < 0)
>  =09=09return 0;
> =20
> -=09return level;
> +=09return kbdlight_level_to_brightness(level);

What a back-and-forth change! That's why you should really move
kbdlight_level_to_brightness() to PATCH 1 and use it there.

>  }
> =20
>  static struct tpacpi_led_classdev tpacpi_led_kbdlight =3D {
> @@ -5235,9 +5272,37 @@ static int __init kbdlight_init(struct ibm_init_st=
ruct *iibm)
>  =09=09return -ENODEV;
>  =09}
> =20
> -=09kbdlight_brightness =3D kbdlight_sysfs_get(NULL);
> +=09kbdlight_brightness =3D kbdlight_get_level();
> +=09if (kbdlight_brightness < 0)
> +=09=09kbdlight_brightness =3D 0;
> +
>  =09tp_features.kbdlight =3D 1;
> =20
> +=09if (tp_features.kbdlight_auto) {
> +=09=09rc =3D devm_led_trigger_register(&tpacpi_pdev->dev,
> +=09=09=09=09=09       &kbdlight_auto_trigger);
> +=09=09if (rc) {
> +=09=09=09/*
> +=09=09=09 * Auto-mode trigger unavailable; basic backlight
> +=09=09=09 * control keeps working.
> +=09=09=09 */
> +=09=09=09dev_warn(&tpacpi_pdev->dev,
> +=09=09=09=09 "auto-mode trigger unavailable\n");
> +=09=09} else {
> +=09=09=09struct led_classdev *led_cdev =3D
> +=09=09=09=09&tpacpi_led_kbdlight.led_classdev;
> +
> +=09=09=09led_cdev->flags |=3D LED_TRIG_HW_CHANGED;
> +=09=09=09led_cdev->trigger_type =3D &kbdlight_auto_trigger_type;
> +=09=09=09led_cdev->hw_control_trigger =3D
> +=09=09=09=09kbdlight_auto_trigger.name;
> +
> +=09=09=09if (kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)

If it can't preserve across hibernation, how can it preserve across
boots?

If it does preserve, you'll need to take extra care to prevent the LED
core from resetting it on exit, or else this is always a no-op. Note that
setting LED_RETAIN_AT_SHUTDOWN is not sufficient as the teardown routine
of hw control trigger emits LED_OFF.

I am also thinking about enhancing the LED core to properly handle
LED_RETAIN_AT_SHUTDOWN for hw control trigger. That being said, please go
ahead without my enhancement in this cycle by implementing a similar
mechanism like ideapad-laptop, as cross-subsystem coordination takes much
more time.

> +=09=09=09=09led_cdev->default_trigger =3D
> +=09=09=09=09=09kbdlight_auto_trigger.name;

Lines can go up to 100 characters.

> +=09=09}
> +=09}

Add a helper function to reduce indentation and improve readability.

> +
>  =09rc =3D led_classdev_register(&tpacpi_pdev->dev,
>  =09=09=09=09   &tpacpi_led_kbdlight.led_classdev);
>  =09if (rc < 0) {
> @@ -5347,6 +5412,8 @@ static void kbdlight_resume(void)
>  static void kbdlight_notify_level(int level)
>  {
>  =09struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +=09bool is_auto, was_auto;
> +=09int brightness;
> =20
>  =09/*
>  =09 * Check the brightness actually changed, setting the brightness
> @@ -5355,15 +5422,29 @@ static void kbdlight_notify_level(int level)
>  =09if (level =3D=3D kbdlight_brightness)
>  =09=09return;
> =20
> +=09is_auto =3D level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +=09was_auto =3D kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +
> +=09if (is_auto !=3D was_auto)
> +=09=09led_trigger_notify_hw_control_changed(led_cdev, is_auto);

Skip when trigger registration has failed.

> +
>  =09kbdlight_brightness =3D level;
> -=09led_classdev_notify_brightness_hw_changed(led_cdev, level);
> +=09brightness =3D kbdlight_level_to_brightness(level);

Let's inline it into the next line.

Thanks,
Rong

> +
> +=09led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
>  }
> =20
>  static void kbdlight_notify_change(void)
>  {
> +=09int level;
> +
>  =09guard(mutex)(&kbdlight_mutex);
> =20
> -=09kbdlight_notify_level(kbdlight_sysfs_get(NULL));
> +=09level =3D kbdlight_get_level();
> +=09if (level < 0)
> +=09=09return;
> +
> +=09kbdlight_notify_level(level);
>  }
> =20
>  static struct ibm_struct kbdlight_driver_data =3D {
