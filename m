Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612958;
	b=QZ6MxOm5aTtwaMWj1LteV6Qy4pEXtMmKGeQCevN+EBcNKzOLzycjWT2XCXsHPMhTUE82
	 buuA4qx+UEfaL0djZ9Tp5i9xSCkjxMQEvmVnvEtNyUiEgdHkPWqMEykQ6jwp8jrS7OKKs
	 c9xtRrzOH3iZk4otwE6TRtCGPsmSvg9oXDX7oLzseXlH9HanDYr2+90ttQEnxrPcpkUjg
	 lR3G5SQ1c/pm3yrj7YRIEyuD+NtQEPQOioxPilQRfX5I5RVzFM67K/zvVVhFhPT7EyPqb
	 TShb93nkHRhyX9re+6VitT6rgSFk3XRmeg/6QRTMP3yrN7SGaZ7HphIL/1XyZoEqxHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612958;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=gTZ5RCXqmBhZUpuuWBBkcgRt74bv///8083+IQ+cJcI=;
	b=ln7waPwFz6+TTCkkMGloaaoR6HD64ezY0Zb7wXAYFy9dIS6AfSxgl2wNRTKn2M60FwRI
	 1CAsWFyobMLo63s+KepZ7eQbYEfufFoMM7u7CUEy0sR5drsR0QOEjKr+E5TGH+CXbwaQY
	 Z1DxyKaN5MTdN4W6UiGuFoJgCAzn+RLZN5JyZiEJ+yZ35DU+qxOg+jliFauAJHggby56b
	 MIY+8yV5E8thEkGIOqJtZxwYo1opultE77EkQ/EFNDt50RiWDTvGFGM3NuueiggGsfG2K
	 lGLOxpTAL8z96XO/+LEU6JbRR9EuzKNNsI0pRcj3Anm8rJPveDfSlnTiZ6eAo7B1uSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=hMazQX8g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D7606A31E;
	Wed, 25 Nov 2026 13:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 430D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=hMazQX8g
ARC-Seal: i=1; a=rsa-sha256; t=1795612923; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Go6rWjUIstgwrKFEQDYKMH+ISTgcSsRWzYYqf4flPBYGBK/UM3qeVuG4mLETwzkKexflGY45Mgo45gM2FIVekQ1MCyN0hWg3FYqI5EeVMZPLct39Hqzkb4Bbw0WfI9U1ZbYvX0TvhmZNhKGP/fgQ4g95hfLeg4zwH+vNKJuzf9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795612923; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gTZ5RCXqmBhZUpuuWBBkcgRt74bv///8083+IQ+cJcI=; 
	b=Vq9JazDnFPxFIEHS4I7Zh4hP/RwqSf27FgYYVxvDgFS3qtAA4TvpHoZj0QkRr55E6rjy6EWlLSCNpIt9Qgdb2YGUoe3jcH7ZgSoEZZ+9m/o5S5tLsvxfeXOMbnyLYJto1zzhNMvP1tqg8AhI5F69sEHnJ7/GBEKektloTKf2NWs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=hMazQX8gWtIDXcnCaWd4tIPe5ZyLA3E8v7Xgqx2kl5d8wstrUg0BRddB3aeSjAXj5L/Dcno3ODkSINYiM3Luxhh0LWZoeJsFb8LIShR+o2hCF9nww45HPFpD3YoHk5v3w1ZwlIxVN5vD13x+N06ixDYhyWo+u0DO6XO8rhPJSShHH/tms4iq2iOMKB9FGi6R1me31z8xqH86+oD8kQUES+7pMF3cWppuGEMuSFpXmEQZ7Fpg6N7yTZ8V4XXIPuR8voVSBxINscVkqfO+o92VO0/KSMbUqhzmWN0GDXs7P3+cR0cOUZy/3xDnG2PDpSgAd2irroqckeVK3FuWRVq/lg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=gTZ5RCXqmBhZUpuuWBBkcgRt74bv///8083+IQ+cJcI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795612920119490.9209554113056;
	Wed, 25 Nov 2026 05:22:00 -0800 (PST)
Message-ID: <2acea8e2f1a457be724c9475881f1d5f47ade7d2.camel@rong.moe>
Subject: Re: [PATCH v4 4/6] platform/x86: thinkpad_acpi: Restore keyboard
 backlight level ourselves
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
In-Reply-To: <20261125084644.137506-5-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
	 <20261125084644.137506-5-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:16:31 +0800
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
> kbdlight_suspend() and kbdlight_resume() leave the keyboard backlight to
> the LED core across sleep: the LED core caches the current brightness
> and turns the backlight off on suspend, and writes that brightness back
> on resume.
>=20
> On a ThinkPad X1 Carbon Gen 14 with thinkpad_acpi unloaded, the firmware
> turned the backlight off when entering both s2idle and hibernation.
> After waking from s2idle the EC was back at its previous level, for each
> of the four levels tested; after waking from hibernation it was at 0.
>=20
> Drop kbdlight_suspend() and leave turning the backlight off to the
> firmware.  On resume, write the cached level back to the EC on all
> models, instead of relying on the LED core: this brings the backlight
> back where the firmware came up with it off, and changes nothing
> where the EC already has that level.  For this to hold for every
> mode, have kbdlight_brightness track the EC level itself, 0 to 3,
> rather than the brightness reported to the LED core, in which the auto
> mode (level 3) shows up as 0; translate it only when reporting a
> brightness.
>=20
> Only s2idle and S4 were available on the test machine; S3-capable
> models were not tested.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 38 +++++++++++----------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 16bf2267d..764b1efa6 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5105,7 +5105,12 @@ static struct ibm_struct video_driver_data =3D {
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
>  static int kbdlight_set_level(int level)
> @@ -5247,7 +5252,10 @@ static int __init kbdlight_init(struct ibm_init_st=
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
>  =09rc =3D led_classdev_register(&tpacpi_pdev->dev,
> @@ -5281,14 +5289,20 @@ static void kbdlight_notify_level(int level)
>  =09=09return;
> =20
>  =09kbdlight_brightness =3D level;
> -=09led_classdev_notify_brightness_hw_changed(led_cdev, level);
> +=09led_classdev_notify_brightness_hw_changed(led_cdev, kbdlight_level_to=
_brightness(level));
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

I believe these changes doesn't affect the behavior of
TP_HKEY_EV_KBD_LIGHT. Usually you can move the changes to the factor-out
patch (i.e., PATCH 2) to reduce back-and-forth changes, with a brief
explanation added to the commit message there.

With them moved:

Reviewed-by: Rong Zhang <i@rong.moe>

Note that you don't need to drop my R-b from PATCH 2.

Thanks,
Rong

>  }
> =20
>  static int kbdlight_read(struct seq_file *m)
> @@ -5337,31 +5351,19 @@ static int kbdlight_write(char *buf)
>  =09return 0;
>  }
> =20
> -static void kbdlight_suspend(void)
> -{
> -=09struct led_classdev *led_cdev;
> -
> -=09if (!tp_features.kbdlight)
> -=09=09return;
> -
> -=09led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> -=09led_update_brightness(led_cdev);
> -=09led_classdev_suspend(led_cdev);
> -}
> -
>  static void kbdlight_resume(void)
>  {
>  =09if (!tp_features.kbdlight)
>  =09=09return;
> =20
> -=09led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
> +=09guard(mutex)(&kbdlight_mutex);
> +=09kbdlight_set_level(kbdlight_brightness);
>  }
> =20
>  static struct ibm_struct kbdlight_driver_data =3D {
>  =09.name =3D "kbdlight",
>  =09.read =3D kbdlight_read,
>  =09.write =3D kbdlight_write,
> -=09.suspend =3D kbdlight_suspend,
>  =09.resume =3D kbdlight_resume,
>  =09.exit =3D kbdlight_exit,
>  };
