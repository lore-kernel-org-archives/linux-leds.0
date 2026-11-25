Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613054;
	b=ozGHW/ac2GIQDr4Q02A4g1LqtVb2AJ7M/lptiyMSfnofa/iE2jdwoD2+K+6Iu+XSinpb
	 /toMm0ib2CsfAy2BOf7TcwiorYaRbkAwp3vcprJQxX/JwjDsjg/QGDmUjzHK3aD05EgDY
	 OZj6l1/7MCe3La59uHN2qiqqwtq9DfORXndVHVrmQLTItE4wxg4aMfODExGFo6cvvQdAD
	 Ze9owlZxMJMgO1vRwNZYvOoOTJBUDyCF74SWwJbJ+u92jO/I7K2sfSAXQEYpwGMuGT9Y4
	 hC2Kr5NeYGiAbOSQKJcvB4NqfuVKTCtdDDNlyvaRWR9Enj9hXA/g6E0RYRrd0imVvTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613054;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=WE+SmlVXVxbbJ8UnH6T5uVaQqHJ2e47Mld0et5owo0s=;
	b=DxSAuVwzEklOUzfeAis9xZATZ9elmTxLbBHYVlPwh7/kFCO6p57lzKmTsIpNdE+1gj8F
	 VXwAl5rX8O+/YGivJD8Kvwm0wTu8A4JZBd5qsM30W/XqDWCuyeIiniyX4ZkBz6y08fgIk
	 SNaq1dxFfqoHLzA0zhqXNGUj0X11jv6gxKfzDcPWoEFYZW+n99pVtxpXzmqDckm5Dhd3H
	 4p5CHABe9+cvB3IGIbB2aCxA+wgAAsvyaa8YDKLFZh5gLRmNH9eFBHkkzH8OQCvp8J2UF
	 3e2murP5mFlVkbtTFpIHN9KCHQXlptTqMmBKWAAhizb+/ar46K8+vYVyqMZdNJfF+ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=JT2zTUTm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA7606A687;
	Wed, 25 Nov 2026 13:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7FA7606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=JT2zTUTm
ARC-Seal: i=1; a=rsa-sha256; t=1795613008; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e2Gzu/8lC4qn9aK0C+Fvx7CwCKFdjAHP1qFYORoAvYukCzfXZxhKR/s2C9vuWZ7ZV3pCnfvBfDy+ssOFsJirdC8e8EGwB2fS6M1RlvqxjhoygxzhZCqpJXWoTUkQi0mIVd+NYuuAvjAlKTm++hv5yhkVGo6BVO+CzEQ9PhsuciA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795613008; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WE+SmlVXVxbbJ8UnH6T5uVaQqHJ2e47Mld0et5owo0s=; 
	b=V1arQyiUNjGQRfdLv0OGbL/ajYTe8rG0DQGXH6MLONyJ+d7jXg4n+/I3a/kG/cmtRZ+L0iKcEDh//kk9cgFmzSGCpzK9P8vtIl8jmQqyHj0glaF6Bu5QUpOAVrHGqgPu8QA1zzx1sGpXl8rcCsYtJSpYQP4hSQ09Zp2k5sPvgrs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=JT2zTUTmeU65YOSrGvsXhhk/ak8GCV7TOakb8M8K0YFfo2bUvzBQGAyIlGPIaCJQ70snxZZ9EwB9HvAqxEjalMhRleRgWaEvuoXZUR+RAh+lprxzE1UVIXMiFTkX7LaZAMuCTYOIar4I2HyFowikKxWmUP9cc/sH/ptFcWgQKYcv539iDSsS3X6vs1hrAb6En8Av5xuYai4N0e6MY5DXpWUjTbnD0MJImV7/r7XlQaN/4+tf1kkOCqN7SsdSYHB2/+L12sZu3Ju7hlwxmCwXYd5Og73VchqGchIKZZ6xKjQJr80BnCRirEzNUtOzJr4ob3w0ls0Wsc5lXACYMxdy8w==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=WE+SmlVXVxbbJ8UnH6T5uVaQqHJ2e47Mld0et5owo0s=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17956130066665.927232731429285;
	Wed, 25 Nov 2026 05:23:26 -0800 (PST)
Message-ID: <806cda3d6b490e1b0930aaa97fd3a3df50f54dff.camel@rong.moe>
Subject: Re: [PATCH v4 6/6] platform/x86: thinkpad_acpi: Add a keyboard
 backlight auto-mode trigger
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, Lee Jones <lee@kernel.org>, Pavel
 Machek	 <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, 
	linux-leds@vger.kernel.org, vishnuocv@gmail.com, vsankar@lenovo.com, Andrea
 Rabbaglietti <rabbagliettiandrea@gmail.com>
In-Reply-To: <20261125084644.137506-7-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
	 <20261125084644.137506-7-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:17:29 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Qiling,

On Wed, 2026-11-25 at 16:46 +0800, Qiling Zhu wrote:
> On ThinkPads that advertise the auto mode in MLCG bit 20, expose EC
> level 3 as a private LED trigger named "tpacpi-kbd-auto".  Select
> LEDS_TRIGGERS so that the trigger is available in stripped-down
> configurations.  If registering the trigger fails, register the
> keyboard backlight LED as before.
>=20
> Activating the trigger writes EC level 3 and records it in the cached
> level; whether the LED is hardware-controlled is derived from that
> cached level, so reading brightness returns -ENODATA while the trigger
> is active and the EC is in auto mode.  If the EC is already in auto
> mode when the driver loads, make the trigger the default one, to
> reflect a selection made before the driver was loaded.
>=20
> A sysfs brightness write leaves auto mode through the LED core's own
> trigger removal.  With CONFIG_LEDS_TRIGGERS_HW_CHANGED enabled, the LED
> core also switches between "none" and the trigger in response to
> Fn+Space, or to a procfs write that leaves auto mode.
>=20
> Deliberately unchanged: max_brightness stays 2.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
>  drivers/platform/x86/lenovo/Kconfig         |  1 +
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 60 +++++++++++++++++++++
>  2 files changed, 61 insertions(+)
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
> index ee8f7429d..f9a835fe2 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5222,6 +5222,27 @@ static bool kbdlight_is_supported(void)
>  =09return status & BIT(9);
>  }
> =20
> +static struct led_hw_trigger_type kbdlight_auto_trigger_type;
> +
> +static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
> +{
> +=09return kbdlight_set_level_and_update(TPACPI_KBD_LIGHT_AUTO_LEVEL);
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
>  static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
>  =09=09=09enum led_brightness brightness)
>  {
> @@ -5249,6 +5270,35 @@ static struct tpacpi_led_classdev tpacpi_led_kbdli=
ght =3D {
>  =09}
>  };
> =20
> +static void __init kbdlight_init_auto_trigger(void)
> +{
> +=09struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +=09int rc;
> +
> +=09rc =3D devm_led_trigger_register(&tpacpi_pdev->dev, &kbdlight_auto_tr=
igger);
> +=09if (rc) {
> +=09=09/*
> +=09=09 * Auto-mode trigger unavailable; basic backlight
> +=09=09 * control keeps working.
> +=09=09 */
> +=09=09dev_warn(&tpacpi_pdev->dev, "auto-mode trigger unavailable\n");
> +=09=09return;
> +=09}
> +
> +=09led_cdev->flags |=3D LED_TRIG_HW_CHANGED;
> +=09led_cdev->trigger_type =3D &kbdlight_auto_trigger_type;
> +=09led_cdev->hw_control_trigger =3D kbdlight_auto_trigger.name;
> +
> +=09/*
> +=09 * The EC does not keep the level across boots, but it may already
> +=09 * be in auto mode when the driver loads: Fn+Space works at the
> +=09 * BIOS or disk-encryption prompt, and while the module is
> +=09 * unloaded.  Sync the initial trigger state with the EC then.
> +=09 */
> +=09if (kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +=09=09led_cdev->default_trigger =3D kbdlight_auto_trigger.name;
> +}
> +
>  static int __init kbdlight_init(struct ibm_init_struct *iibm)
>  {
>  =09int rc;
> @@ -5269,6 +5319,9 @@ static int __init kbdlight_init(struct ibm_init_str=
uct *iibm)
> =20
>  =09tp_features.kbdlight =3D 1;
> =20
> +=09if (tp_features.kbdlight_auto)
> +=09=09kbdlight_init_auto_trigger();
> +
>  =09rc =3D led_classdev_register(&tpacpi_pdev->dev,
>  =09=09=09=09   &tpacpi_led_kbdlight.led_classdev);
>  =09if (rc < 0) {
> @@ -5289,6 +5342,7 @@ static void kbdlight_exit(void)
>  static void kbdlight_notify_level(int level)
>  {
>  =09struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +=09bool was_auto, is_auto;
> =20
>  =09lockdep_assert_held(&kbdlight_mutex);
> =20
> @@ -5299,6 +5353,12 @@ static void kbdlight_notify_level(int level)
>  =09if (level =3D=3D kbdlight_brightness)
>  =09=09return;
> =20
> +=09was_auto =3D kbdlight_brightness =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +=09is_auto =3D level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL;
> +
> +=09if (is_auto !=3D was_auto && led_cdev->hw_control_trigger)
> +=09=09led_trigger_notify_hw_control_changed(led_cdev, is_auto);
> +
>  =09kbdlight_brightness =3D level;
>  =09led_classdev_notify_brightness_hw_changed(led_cdev, kbdlight_level_to=
_brightness(level));
>  }
