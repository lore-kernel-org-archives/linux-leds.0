Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794730339;
	b=lL/JpKzXeMUFBanUIH4qD7aEORKS8ndYPxwF0pQRCqN/y9BnkitHvBw4BVq4zKTSsB3S
	 AK80dXTIXyKV//wOVBDmGRMD7fnrCzY4ixUfYcYrTmYA0/USoxYWRGtoL74Bm0srmMN88
	 jFqRebnbPOPiVDSwqhp5/ehVKwqXt27Kkh11yj/awKJjjqrPxBfM7u7lD9gJ6cadMiqIY
	 /OWxOKy8ui1aQkKiPyQCg2Ig/088AKptCXMKxsghIHqnqjE259Ia1nmMzt7MFv34CH1Mw
	 kDksuQkeAE62lMV05wHkJmeLLYhl5xbOq2m7m29jYy/R9YIBDF5xlAnItE6LmN5V/pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730339;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=HizMhLAwzr2oE3PHmBNR0t7Z/VtRGo3MTbH3tfzNnPA=;
	b=AUvGdzLogpq+M3249WhRvQdWulj8Z9utDelzI/fsm/2mOm/msvncWAA5UYREiYL1VIAe
	 swZw487+7cPvIGkFnhUy5P5jujc+CC1ca6bJOyj3d08zghjh3jE1oRgEVLGfWcp4ALZT6
	 KfSdyl3o4bF+z5AJcJIpQ7lwsYzAABxs1EN0befxGkilNaeyujevPFRgZCJD49ff/+EFx
	 JkBm5wQwlajFLvSZmUYjP6qUh8UGMdeHxWgHLY0JAzn9216rDHND58IDcJ9/dFCRv4VNP
	 L0ob9vuvNLZJ1CKUpOhKUP5OjY6i129ifWX7bRRJAi8SkVR3TVB/lt2v0wN6TYrCJPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lAJnaq1t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB2B606A31D;
	Sun, 15 Nov 2026 08:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB2B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=lAJnaq1t
ARC-Seal: i=1; a=rsa-sha256; t=1794730314; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RXq8A3eTRd3o/+JeVyU36seiDDmRhy9ZJQDqh7PlXiKfOqoKXKUQZNnBmiZPt9o3vBkfJIpZ2IR3NKYw3IJXj+Ep7WGhmP2VuxpJKEkibiM254/P9kWdAZuvik2W+S8f0HrA7JAQ072sNgmPm7oYvmsU7c1UpWUJKjvo/6OLmfg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794730314; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HizMhLAwzr2oE3PHmBNR0t7Z/VtRGo3MTbH3tfzNnPA=; 
	b=DO1TEesmSCrBmhB7ivp2UJFI1WwP/qkMXPfO9+NQIfHm0apmgkjBifVEd9t0iNRehysIp3dhOQMeUWJQU+wbwYt4XJR2LxRULTgz/5CVt276Ay/8UfSsJOT8mNct/plybyzbLgwGAcJ026cAvrwnMYpqVwxTP0fe0LX8EpKFdrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=lAJnaq1tg/pQJKlhRjTQyZbHdJzdpOdrC+FfyOIaG9QnzBkzGVBnTpN7iy4AM6ED6JAmO6yq+zYAg0btffpal3gS/9E29UaDVs5KdprUeS/5YNaornFXz8k1IACSIBZ0eHnTi2ECFG/Am6XVCTUxtxBimmINJlpMrNeVjra4jbK/2o5DK5tJ9dxLmAfeM+GYXgLxIHmcgzOI/LiQ0NUaaEYg6auJmv5S+ggQqS4FtnGaXqAYwFr07TCrMroHx6TF+g1mowyI4dUZarBjFmuM4h5k0BbLHbNsDfKIosF+GHlZzRmCYaCmJFi1tf9XxjLp320UeTthOSKdKT325IXvIQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=HizMhLAwzr2oE3PHmBNR0t7Z/VtRGo3MTbH3tfzNnPA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17947303125599.534593764973238;
	Sun, 15 Nov 2026 00:11:52 -0800 (PST)
Message-ID: <c50f805d8573d0b451f5abebcab042012f597d63.camel@rong.moe>
Subject: Re: [PATCH v3 4/7] platform/x86: thinkpad_acpi: Detect auto-mode
 capability via MLCG
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
In-Reply-To: <20261114174814.62153-5-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-5-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 16:05:40 +0800
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
> The upper bits of the MLCG return value carry capability information.
> Bit 20 indicates whether the EC supports the auto mode of the keyboard
> backlight (0 =3D manual levels only, 1 =3D auto mode available), as defin=
ed
> by the firmware.
>=20
> Record it in tp_features.kbdlight_auto, in preparation for using it to
> gate the auto-mode trigger registration and the LED suspend/resume
> skipping in subsequent changes.
>=20
> Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_=
42j4cXsXZQ@mail.gmail.com
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 657a19d11..681b340a1 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -363,6 +363,7 @@ static struct {
>  =09=09TP_HOTKEY_TABLET_USES_GMMS,
>  =09} hotkey_tablet;
>  =09u32 kbdlight:1;
> +=09u32 kbdlight_auto:1;
>  =09u32 light:1;
>  =09u32 light_status:1;
>  =09u32 bright_acpimode:1;
> @@ -5161,6 +5162,13 @@ static bool kbdlight_is_supported(void)
>  =09}
> =20
>  =09vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status)=
;
> +
> +=09/*
> +=09 * MLCG bit 20 indicates auto mode support: 0 =3D manual levels only,
> +=09 * 1 =3D auto mode available (per the firmware definition).
> +=09 */
> +=09tp_features.kbdlight_auto =3D !!(status & BIT(20));

Add a symbolic macro for 20.

With it fixed,

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> +
>  =09/*
>  =09 * Guessed test for keyboard backlight:
>  =09 *
