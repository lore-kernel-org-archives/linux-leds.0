Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612646;
	b=1yDM1Z+wZK3qlnFJ2ZBsoj/ihT9/aFp4H4V6UnSaJkJRZRRHjVscbbgniLjJdr8yGxOx
	 S3QyXb316Hu4uPYHIQJllvjsn6W8mC4n3tgAfgGi1qPuxom/oVbJ1evH1tzPiNi+fuOwb
	 5B5AKkwG8FnaGaQAwW/qKxrpb17eXQNTmZi1gwnX3pv4H4RRRSxp+jYDamgDJzbJ/NQGI
	 OGDH0yEig+3GX8rpV5SKVME3rGhwuINJZiNeCG3jTB37wAmmXkGwULk5W2f29fsQHyktY
	 BX4IJfQfoplQlQk9os1PIQT0q8FiMbAWPj+XUpf7X6D+iyDchiTXUazE1GplyRzL6QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612646;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=n2qfnFgcRML/6LFgZHWe+yR+2O7d7zoHts7Ya454zxY=;
	b=kWj0qIonWjuphf4qQKqS9UJdDgEOS7o1vEgwNwDTPJAdrYxCFu0LBDFKJ8WsGSo3ukwB
	 8jXuTckYRP0fRUeiemKOd8YSz2wKTbuRp1JxvfUeRyZfkpsx+Thw/pdxwkkDp0+tU0ccH
	 SGFAPhgqFd1e+G5ccdaIY8/BId9VVXnfqXafxMFyLF3Ky5BvbQDEuNWJnj7zOEs2hzIxZ
	 4YMhz+prHbTh3RRHuaHFA0Is9s6jJBlXhCpxi9srHYnkeoVSZtlxmmB9qiwECLwaq/hcD
	 8X34NmLzt++SacLirjlU9KTqUp2DiLyKpXgww8lLqO3rbBq7ZWOZ7poF1fYNlKONxPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=edI1mFWG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A7606A32C;
	Wed, 25 Nov 2026 13:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13A7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=edI1mFWG
ARC-Seal: i=1; a=rsa-sha256; t=1795612613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oI/gx+xMVxFs1eS3Fs/zuTiGPYDVgecucp7XDo8MhQTfI3qQSuvg/O9jNEqzZaU+1RF9/1msXygCJX9vOIbnMg1w0xP4jk4hNj+HFsPw1mCXOt/ClFe+VAeYqyGcp3v7jIa+L6i+CY9SCM+eKa5vaHRnTsa0YQXjeQaTrr7kjFQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795612613; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n2qfnFgcRML/6LFgZHWe+yR+2O7d7zoHts7Ya454zxY=; 
	b=O07PmW2TXrq0862b+swlgzCYepRgF5b9aWpUu9f1kxGtUMTp576NWB9KELUBDJFrf1lrZ1tXOCIsbWEg6nOvaK4Ex1ZLAbUTHMfgCXhveFR6DfUVcfCDmrdejsr0wfjwlrcTW7X1cofP6l/xtsonRFpftLhDgHsv6cywJLNdJwM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=edI1mFWGytB6KEFV+N7lOh/NSgdsvwDzz/EM9KRpLVZSgv1HWQAyTcSsmuDe0KqWfcvqqAiFojmk/MFT0p1grZZszcB3PaqIzxtTA1u96fusL1HL48xBJMWHOFojO7e4b79Ij3AzYsJNREt95zzvpDzO5T27op9Gr9erEYu3EAVZFDz7bWuATXboOFb1Bm8vs7mhh0Ag1qtXpzVUdWNCofHIX8Pf7E8vGKFqSGalw/sILeWw+YbqNIkQriDC11GX26UVRWNTl0HvBS+WAHeikzEsUDT3aiT34bTvj1OqTIHwyHgE0t5jJdp2XPDnp/lb8H4janyHQMtCZNKBIBQVpg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=n2qfnFgcRML/6LFgZHWe+yR+2O7d7zoHts7Ya454zxY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17956126103241020.4936667106859;
	Wed, 25 Nov 2026 05:16:50 -0800 (PST)
Message-ID: <a365235036093cb3e96ba66808afbb1c0a52a0e2.camel@rong.moe>
Subject: Re: [PATCH v4 3/6] platform/x86: thinkpad_acpi: Don't poke
 keyboard backlight's LED core brightness
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
In-Reply-To: <20261125084644.137506-4-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
	 <20261125084644.137506-4-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:11:44 +0800
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
> A write to /proc/acpi/ibm/kbdlight writes the EC level and updates the
> cached level under kbdlight_mutex, but then assigns led_cdev->brightness
> directly after releasing the lock, without telling the LED core.
> Commit 06da5325d02e ("platform/x86: thinkpad_acpi: Stop setting
> led_classdev brightness directly") already removed this pattern from the
> sysfs path but had to keep it for the proc interface, which has no LED
> core path of its own.
>=20
> Stop writing to that cache.  kbdlight_set_level_and_update() now only
> writes the EC level and updates the cached level, under kbdlight_mutex;
> the sysfs path uses it, as a write that already goes through the LED core
> does not need to be reported back to it.  The proc write path instead
> calls kbdlight_notify_level(), which updates the cached level and reports
> the new one through brightness_hw_changed, like commit 07f48f668fac
> ("platform/x86: ideapad-laptop: add FnLock LED class device") did for
> the ideapad FnLock LED.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

>=20
> ---
> After a procfs write, led_cdev->brightness can retain its previous
> value.  This is acceptable:
>=20
> - Reading the brightness attribute calls brightness_get(), which reads
>   the level back from the EC and refreshes the cache.
> - At this point in the series, kbdlight_suspend() also refreshes the
>   cache before suspend, so led_classdev_resume() does not write a stale
>   value back.
> - Software blinking may pick up the old value as its "on" level, as it
>   can after a Fn+Space change.
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 44 ++++++++++++---------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index b4b3d7dcc..16bf2267d 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5113,12 +5113,11 @@ static int kbdlight_set_level(int level)
>  =09if (!hkey_handle)
>  =09=09return -ENXIO;
> =20
> -=09guard(mutex)(&kbdlight_mutex);
> +=09lockdep_assert_held(&kbdlight_mutex);
> =20
>  =09if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
>  =09=09return -EIO;
> =20
> -=09kbdlight_brightness =3D level;
>  =09return 0;
>  }
> =20
> @@ -5147,6 +5146,21 @@ static int kbdlight_level_to_brightness(int level)
>  =09return level;
>  }
> =20
> +static int kbdlight_set_level_and_update(int level)
> +{
> +=09int ret;
> +
> +=09guard(mutex)(&kbdlight_mutex);
> +
> +=09ret =3D kbdlight_set_level(level);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09kbdlight_brightness =3D level;
> +
> +=09return 0;
> +}
> +
>  static bool kbdlight_is_supported(void)
>  {
>  =09int status =3D 0;
> @@ -5195,7 +5209,7 @@ static bool kbdlight_is_supported(void)
>  static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
>  =09=09=09enum led_brightness brightness)
>  {
> -=09return kbdlight_set_level(brightness);
> +=09return kbdlight_set_level_and_update(brightness);
>  }
> =20
>  static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_c=
dev)
> @@ -5253,20 +5267,6 @@ static void kbdlight_exit(void)
>  =09led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
>  }
> =20
> -static int kbdlight_set_level_and_update(int level)
> -{
> -=09int ret;
> -=09struct led_classdev *led_cdev;
> -
> -=09ret =3D kbdlight_set_level(level);
> -=09led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> -
> -=09if (ret =3D=3D 0 && !(led_cdev->flags & LED_SUSPENDED))
> -=09=09led_cdev->brightness =3D level;
> -
> -=09return ret;
> -}
> -
>  static void kbdlight_notify_level(int level)
>  {
>  =09struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> @@ -5326,7 +5326,15 @@ static int kbdlight_write(char *buf)
>  =09if (level >=3D 3 || level < 0)
>  =09=09return -EINVAL;
> =20
> -=09return kbdlight_set_level_and_update(level);
> +=09guard(mutex)(&kbdlight_mutex);
> +
> +=09res =3D kbdlight_set_level(level);
> +=09if (res)
> +=09=09return res;
> +
> +=09kbdlight_notify_level(level);
> +
> +=09return 0;
>  }
> =20
>  static void kbdlight_suspend(void)
