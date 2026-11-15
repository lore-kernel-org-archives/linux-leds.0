Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794730506;
	b=FKnJWywUg5vCjk2UORJbp9l8SR72XR3KFm/z/26/z+n/HNAd6mO5t/Azk04ixcrEBxAl
	 1P5SBoWQEdjuYfRHVRPocPzNLKTaUwT9PaIpteVvUsoOYSzA5H3DWlydkppw3GwBr6n71
	 WgxuIyo+zMm9gJe7h1l42cmw7A13yb/1rG7hmpjDmuldFp38gtF2OMVT+I+WQv4FW/5wu
	 +00OHwWCjL7ilCU27klTVy5EhjrJQClKjVJRW2qWM2tV5gzDpd80oSaxV68Z8tgnDlIfh
	 y/Ob9cu33Q6Xb1+9SZvqa/cLsmzjW9d7oYCnE8zh4nG1in/MBU8hpaqeG1FuErg5C8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730506;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=uydEahiP1CgfQ+Qejg0zXzNqMoA+gS90z4vYszZCEJc=;
	b=HP1S1QtzTUEvZT6E5L6n/jEUct1f4PL5BBSqhyAaHsfEWKljgumo/+EB4lnkrwB5ej+H
	 9E6tKhZykg9r7e+2CsE9geKe4uF4hMecLgGaqyYyOuYhOt4bL61QfK6L4rg+0OJxSsUah
	 PFbS9G/YaINBptlzS8fj//DscLocaCag9P0vD5Ldzq6pncKR8ffySUm+RI/D2Ovma51eX
	 erY8nJ+5ER/6oLh1rBsmi7PNyUWYdhI2QvLaafTerg/vyRm9kR+fajGLFz74BDnzRrODi
	 RlbuDIJQ5pUeD/IWgYB5rQow2ITI+gm6ZsDw5TEEbGVhpnkLAz+iVFFaKvsaEW4uUaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=F3Z+ZEp4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7C606A323;
	Sun, 15 Nov 2026 08:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F7C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=F3Z+ZEp4
ARC-Seal: i=1; a=rsa-sha256; t=1794730480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mVAPIAGPCfYFNKv7rzOTzJh6W42C1ph1JEnYYLlqOt0v9rbKDJQDJ+Lo1Tmm0875rCGf2fw37uYlFC/d1MRZeakLJcueVGViG86rWAOFqurk48qL10sXtx81qZ7u8nhsJL9LDLE9TIRYQRVzCn3edn/brduV7xki89AheRel6cQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794730480; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uydEahiP1CgfQ+Qejg0zXzNqMoA+gS90z4vYszZCEJc=; 
	b=TcWfl7Xcq39T17TDkSk7tPHUGTYvubIwsDxG/KIYA6fH/6791l2k3jyHlUN07v02Fm5IxRWUCnvJSXcwgJZ//BDaQT7wwoM/k7HNbDQX/Z+2VQX5UUMUpJRRrezpy+JSMeQhq3ZU3Kw5kVNM55+iOP975GHYpQvp+WkWY0f2ufQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=F3Z+ZEp4FVzhCkMg3vufaWg1xO9AqZwDgy3Y0+TgHr3+14rtg+kdPgX5vrPT+S2I+DlshEajokVfAYiMFJu28JResyRM7cKXdI5CgrwOaYYGI2fqB3cKS3adwH7kuz8Maa4FhmGRgFwgfRHwVDWchqn8XVPMkKhp9g/G1IMD8KcInFnj45UhkT0GfsqXaMu+cDGpFRXv1PmGGuAf/51po3lQfeQo0KBvvwuOlZ7nKCxnNIKYG1fvMlmOLdpHlje2QJewHDw+BvkgxpaN5vh1AR7Pm4eYnUrYfvnA9UOpu3YzDWRor+93Szv9MJRVKarO5xuK66ytI4LZAQ9iNbmK4g==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=uydEahiP1CgfQ+Qejg0zXzNqMoA+gS90z4vYszZCEJc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179472957662614.658949649354213;
	Sat, 14 Nov 2026 23:59:36 -0800 (PST)
Message-ID: <64525e6fc8bd29dab836a5f6a4249523ef285012.camel@rong.moe>
Subject: Re: [PATCH v3 1/7] platform/x86: thinkpad_acpi: Report auto
 keyboard backlight mode as off
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
In-Reply-To: <20261114174814.62153-2-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-2-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 15:53:00 +0800
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
> The EC keyboard backlight level 3, which selects the auto mode, is
> passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
> then reports a brightness of 3 with max_brightness 2, both through the
> brightness sysfs attribute and through brightness_hw_changed
> notifications.
>=20
> This is not only cosmetic: UPower 1.91.x treats the out-of-range value as
> invalid and stops watching brightness_hw_changed altogether, so the deskt=
op
> stops following the Fn+Space hotkey once auto mode has been entered.
>=20
> The auto mode is not a brightness level.  Map it to 0, the value it is
> reported as most of the time anyway, in line with what ideapad-laptop
> already does for its auto mode.
>=20
> Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
> Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
> Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=3DkDSew7XtNJCSvyPiXPJ5faWd=
mCr5RGYFhpunCA@mail.gmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad..2c3f8cf32 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data =3D {
>   * Keyboard backlight subdriver
>   */
> =20
> +/* EC level that selects the auto mode for the keyboard backlight */
> +#define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
> +
>  static enum led_brightness kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
> =20
> @@ -5191,7 +5194,8 @@ static enum led_brightness kbdlight_sysfs_get(struc=
t led_classdev *led_cdev)
>  =09int level;
> =20
>  =09level =3D kbdlight_get_level();
> -=09if (level < 0)
> +=09/* Auto mode is not a brightness level; report it as off. */
> +=09if (level < 0 || level =3D=3D TPACPI_KBD_LIGHT_AUTO_LEVEL)
>  =09=09return 0;
> =20
>  =09return level;
