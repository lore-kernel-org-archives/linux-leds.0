Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794730261;
	b=UZZU/ajjru+nQ12QbZYEEA3N8a+n8VW4MyfD8QTjYaisPZbyKfNeW5N49IaR/7PTqfvu
	 D3HsJeMdreYMfpfBLTzZDGjiL3ht6/PyxmCqqLu2mZEyRI7er/oP8NOloyUQzjhR+oVrf
	 Mmdj8aR8AgeDXgLlCZeGtaEl1fPB5+iTS8AtZoAg9WzyxkBUNUWR5qkO0ePvwTfZK0blJ
	 3HF1BS811TVVbr0SZXYv/LuktzeFbD/U0yXjT0i7TjuMwb4IhKA17jnt+SCWmLVHQMVtT
	 WKQU6P8pYvuouyjW9wntA2dj/jAJJqNHUBChPd3w5W3X7PitnRNac6rfvZJ8yKdhocg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730261;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=kJT09pvCBTtbQI/0vVu9v6aSrAM1U/36HarANVoKMKE=;
	b=ZQ1d7psmTe4WU8kVG+Gm57gqUERChwEgg7dcZfS/gHKz/YzL+YGnJACM3qmk4/tdrBrq
	 pBlEktBd/ETBUfmHLBCuFuzUK5eZdHXHFABTNtqvUmNzmoIN7duWpGRbKCNuP587nBhnl
	 9Fm/cDEwnySAnrW61FSJw1XklxaQJNXj4UYuNMf7YOuLJmLe8xiWOZfKJjJcBliXKJh6V
	 IUqCbevPKC/+i+ABw9wBd9QXzipPMHpogDuuyID804Me2ooem3d7s3HwUYWL0s6mNbW/U
	 T6YaDB664nn77r90gKpPmFq1peYX6H3RmAEfiNhtxxFb5/BwMEu8mREqRoGufVsuffw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=m6kLPRvs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C327606A323;
	Sun, 15 Nov 2026 08:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C327606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=m6kLPRvs
ARC-Seal: i=1; a=rsa-sha256; t=1794730238; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S8O6ACBvgk8lyymsZPCQ6B5RqHncVpm0pywJpoIg7dNxM7IsLsOMG/JJ1z+NN4oQp3jAakSlB+mrn7fVCYXo3vF8cZz3b1m2sTThbM9E2wg3x1DAtfTZy4l9acI27qBc6F6wBirE7Fqi1ka9aN8qZuglNpG58ntZNv2d5utcrnc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794730238; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kJT09pvCBTtbQI/0vVu9v6aSrAM1U/36HarANVoKMKE=; 
	b=N3A7GYh7l1D3AskD2q2MnQyPLbjlWTPzvCZBqz45ZJA17il2qygNMxXtTlwpYyLZdW4vdhfgH7gzdBEFxs0P6OJGAZ0WJ04lOaq8duVWT2ztHad0odB07lJ8W0ZYV29JC8kPZ4YGM7pd9ED21MVdaOlraXa9erSl8+lrkBm8N1U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=m6kLPRvspjp2kNNNBVZ0hmRUbfF4Mne4mjn4gbu4XGkk6jwCxkcoyqbvMNyR4n461xx518zGFLH+Z/pwG5S9zuPFfjgGpM9TE9wKeWpjeIAhY1Fc838MMWOO6KKz2svObFzHl3DjBJ1zCG2jmdSBGrnBEI/znB9W1Ck/P3YBXO6qCuZZv9+aPwfCJ/p4Y+K/eBkqLRaDZ+MZznT3dAh+H2cmZa9INAtBgbAKaRvS9SNHBXbhngUOzs90Vm5KdejgMPtIRcxR3QxDx3EM6IpK70z5MzZu7wnv6UpFttv0UJRU3tHobjUEcfOLSZJora8eMEM7//1txGCiGR2DLW2isA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=kJT09pvCBTtbQI/0vVu9v6aSrAM1U/36HarANVoKMKE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794730235830887.3843527419489;
	Sun, 15 Nov 2026 00:10:35 -0800 (PST)
Message-ID: <34d2115e347e5c33df2027ac26cfa259fc47091a.camel@rong.moe>
Subject: Re: [PATCH v3 3/7] platform/x86: thinkpad_acpi: Sync LED core
 state on level writes
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
In-Reply-To: <20261114174814.62153-4-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-4-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 16:05:28 +0800
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

The title is confusing. How about:

   Don't poke keyboard backlight's LED core brightness

On Sun, 2026-11-15 at 01:48 +0800, Qiling Zhu wrote:
> kbdlight_set_level_and_update() pokes the led_classdev brightness cache
> directly after writing the new EC level, without notifying userspace and
> without any locking.  Commit 06da5325d02e ("platform/x86: thinkpad_acpi:
> Stop setting led_classdev brightness directly") already removed this
> pattern from the sysfs path but had to keep it for the proc interface,
> which has no LED core path of its own.
>=20
> Move the LED core state update into kbdlight_notify_level(): stop
> updating the cached level in kbdlight_set_level() and have both the
> sysfs and the proc write paths go through kbdlight_set_level_and_update()=
,
> which writes the EC level and updates the cache under kbdlight_mutex,
> and reports the new level through the LED core, like commit
> 07f48f668fac ("platform/x86: ideapad-laptop: add FnLock LED class
> device") did for the ideapad FnLock LED.
>=20
> As a result, writing a level through either interface now emits a
> brightness_hw_changed notification, so userspace listeners see level
> changes from both of them.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Sashiko complains:

   Does replacing the led_cdev->brightness update with
   kbdlight_notify_level() leave tpacpi_led_kbdlight.led_classdev.brightnes=
s
   stale after writes to /proc/acpi/ibm/kbdlight?
  =20
   kbdlight_notify_level() calls
   led_classdev_notify_brightness_hw_changed(), which only sets led_cdev-
   >brightness_hw_changed and never updates led_cdev->brightness.  When
   kbdlight_write() changes the level via procfs, in-kernel consumers that
   read led_cdev->brightness without calling led_update_brightness(), such
   as led_set_software_blink(), will see the old brightness value.

IMO this is acceptable. Please add a section separated with `---' after
your Signed-off-by, explaining why this is acceptable.

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 23 +++++++++++++--------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index c8098f317..657a19d11 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5108,17 +5108,17 @@ static struct ibm_struct video_driver_data =3D {
>  static enum led_brightness kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
> =20
> +/*
> + * Caller must hold kbdlight_mutex.
> + */

Annotate it with lockdep.

>  static int kbdlight_set_level(int level)
>  {
>  =09if (!hkey_handle)
>  =09=09return -ENXIO;
> =20
> -=09guard(mutex)(&kbdlight_mutex);
> -
>  =09if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
>  =09=09return -EIO;
> =20
> -=09kbdlight_brightness =3D level;
>  =09return 0;
>  }
> =20
> @@ -5183,10 +5183,12 @@ static bool kbdlight_is_supported(void)
>  =09return status & BIT(9);
>  }
> =20
> +static int kbdlight_set_level_and_update(int level);

The function is modified a lot. Let's simply move it.

> +
>  static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
>  =09=09=09enum led_brightness brightness)
>  {
> -=09return kbdlight_set_level(brightness);
> +=09return kbdlight_set_level_and_update(brightness);
>  }
> =20
>  static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_c=
dev)
> @@ -5245,18 +5247,21 @@ static void kbdlight_exit(void)
>  =09led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
>  }
> =20
> +static void kbdlight_notify_level(int level);

What not add it to the right position in PATCH 2?

> +
>  static int kbdlight_set_level_and_update(int level)
>  {
>  =09int ret;
> -=09struct led_classdev *led_cdev;
> +
> +=09guard(mutex)(&kbdlight_mutex);
> =20
>  =09ret =3D kbdlight_set_level(level);
> -=09led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +=09if (ret)
> +=09=09return ret;
> =20
> -=09if (ret =3D=3D 0 && !(led_cdev->flags & LED_SUSPENDED))
> -=09=09led_cdev->brightness =3D level;
> +=09kbdlight_notify_level(level);

Nah. I didn't mean this. We only want to notify brightness_hw_changed on
procfs kbdlight writes, but you are notifying it on sysfs LEDs writes.

Please call kbdlight_notify_level() in kbdlight_write() instead of
messing up with this function.

This function should only update kbdlight_brightness (when
!LED_SUSPENDED).

Thanks,
Rong

> =20
> -=09return ret;
> +=09return 0;
>  }
> =20
>  static int kbdlight_read(struct seq_file *m)
