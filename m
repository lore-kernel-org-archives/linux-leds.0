Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680029;
	b=rmXKEbKiPbBy03Yv61LwrZ5Fl0j8cog3okmSg05JWREPfBC8IUs2woo1i5ZZEGuDEwQp
	 k9Ey8/KQDGAB2Sq24aenjhORaFJvUUSBPTPZcay7UStjbFLg1G75pNMgiemlwNzm8J8xk
	 R57HZz7lbzXzy8FgCnHbOlngx/W0xw7L0xZQcCF+F/0lR86ydKc92t+kawtgCMaOth+ky
	 H9CsonNENR55aBPHMSxCXNmUOchVZ17WN9Y3kyo1WaiCbuUxb5me/WwrrwznNIU43l8AW
	 nNcR59c26wyGhMBQ/v52qNKCdNV5loF/sr0EKDvf/SlHcA/I2GZYWXXYOkWQohNK2VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eP9re5R+clWGeEwiMuGem+TY1GUAtgioaiaD0Ei9DoM=;
	b=eF98AQEYCCm7y72nn3P1PS9LfA7H9t/LHNtNq5MwAj4+o7wIU9woeEhToesL1ZZT6myH
	 VXdKRn+t95XTM9WXXwfoqi6I242Pfqsrv4qIwlpzfKXPxPaCRlEWtKCQPGP7nCWuCBE4n
	 g46dsjcxrxEvnfXwJDae8HZT5n8cvDoBW7klBITD4rFNAVaNUiFD/j6+nnSV0NXOCVG/6
	 ajeKJ0YP5yxWg6LPQLJXHEiTUhH4oB5A8xnhXUq+TuQPf/Et5CNgKdc/azIIOCiUzEUiz
	 shUWc4pKXPzwTDitPOT5fVhdJYI3wvGCJYZAn1M1H6tCsTwp/kDvH+bgxD+wajahfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqv2KsYf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D61606A32D
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqv2KsYf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711561F000C4;
	Sat, 14 Nov 2026 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794680028;
	bh=eP9re5R+clWGeEwiMuGem+TY1GUAtgioaiaD0Ei9DoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gqv2KsYf6cXYtDH9Y5C6PYDK4aQmcSbm79TIYsA75M+89DN9kUotYB2HZsbfmyAwz
	 yS/g0XNnJxaUzyp/+ktZ/6FLpyCy/PSmhYYTOFxKEX6lMAoRfq2Qa8qbRrLoA44khW
	 9i7rpGzWKJ4byyBa+AlaGeCp6fvzZV8OP8Hrzum1yB181+dntBM0D/oHvnQRGrDalj
	 sc1Ivco1MNDqktHwEEuaWpY7V3gUCN2yAO231GWMOQ10fo3/wabFyBWuCVkhhV9N8C
	 GIZNgbi1KF+4wFSQL7gN2B63WhH20Hdp5PQvPjI8kUp+bA4letZ2JpJbt+j4+reaqx
	 +T7YWHKL5ErCg==
Message-ID: <sashiko-outbox-214892@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] platform/x86: thinkpad_acpi: Sync LED core state
 on level writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114174814.62153-4-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-4-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:13:48 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] platform/x86: thinkpad_acpi: kbdlight_sysfs_set() emits
  hw_changed events
- [Medium] platform/x86: thinkpad_acpi: kbdlight_notify_level() skips
  brightness sync
--

commit 4d5f231b5d9abb09805158db29463a1e6584f59d
Author: Qiling Zhu <kmatzkaczor244@gmail.com>

platform/x86: thinkpad_acpi: Sync LED core state on level writes

This commit routes both the sysfs and proc keyboard backlight write paths
through kbdlight_set_level_and_update(), moving kbdlight_mutex acquisition
and kbdlight_notify_level() there instead of directly updating
led_cdev->brightness.

> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index c8098f3175e51..657a19d11efd1 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5108,17 +5108,17 @@ static struct ibm_struct video_driver_data =3D {
>  static enum led_brightness kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
> =20
> +/*
> + * Caller must hold kbdlight_mutex.
> + */
>  static int kbdlight_set_level(int level)
>  {
>  	if (!hkey_handle)
>  		return -ENXIO;
> =20
> -	guard(mutex)(&kbdlight_mutex);
> -
>  	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
>  		return -EIO;
> =20
> -	kbdlight_brightness =3D level;
>  	return 0;
>  }
> =20
> @@ -5183,10 +5183,12 @@ static bool kbdlight_is_supported(void)
>  	return status & BIT(9);
>  }
> =20
> +static int kbdlight_set_level_and_update(int level);
> +
>  static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
>  			enum led_brightness brightness)
>  {
> -	return kbdlight_set_level(brightness);
> +	return kbdlight_set_level_and_update(brightness);
>  }
> =20
>  static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_c=
dev)

[Severity: Medium]
Does routing the LED class brightness_set_blocking callback
kbdlight_sysfs_set() through kbdlight_set_level_and_update() ->
kbdlight_notify_level() cause software-initiated brightness changes to
emit brightness_hw_changed notifications?

Per Documentation/ABI/testing/sysfs-class-led, brightness_hw_changed
reports only brightness changes initiated by hardware or firmware and must
return -ENODATA until a hardware change occurs.  Because the LED core
also invokes kbdlight_sysfs_set() during led_classdev_suspend() and
led_classdev_resume(), suspending with the keyboard backlight enabled now
updates kbdlight_brightness to 0 and wakes userspace poll() listeners on
both suspend and resume.

> @@ -5245,18 +5247,21 @@ static void kbdlight_exit(void)
>  	led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
>  }
> =20
> +static void kbdlight_notify_level(int level);
> +
>  static int kbdlight_set_level_and_update(int level)
>  {
>  	int ret;
> -	struct led_classdev *led_cdev;
> +
> +	guard(mutex)(&kbdlight_mutex);
> =20
>  	ret =3D kbdlight_set_level(level);
> -	led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +	if (ret)
> +		return ret;
> =20
> -	if (ret =3D=3D 0 && !(led_cdev->flags & LED_SUSPENDED))
> -		led_cdev->brightness =3D level;
> +	kbdlight_notify_level(level);
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static int kbdlight_read(struct seq_file *m)

[Severity: Medium]
Does replacing the led_cdev->brightness update with kbdlight_notify_level()
leave tpacpi_led_kbdlight.led_classdev.brightness stale after writes to
/proc/acpi/ibm/kbdlight?

kbdlight_notify_level() calls led_classdev_notify_brightness_hw_changed(),
which only sets led_cdev->brightness_hw_changed and never updates
led_cdev->brightness.  When kbdlight_write() changes the level via procfs,
in-kernel consumers that read led_cdev->brightness without calling
led_update_brightness(), such as led_set_software_blink(), will see the
old brightness value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114174814.6215=
3-1-kmatzkaczor244@gmail.com?part=3D3
