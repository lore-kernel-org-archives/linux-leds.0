Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613028;
	b=Um5KQTXFV1Xp8wuq0W9D3bHuEyBJzQ+pT7Shhd24YkK27ntBHxdm/pPZd/yINOPGlO4T
	 M5DS8gM06AgsQ5SQVEpl97BuIrhhInhTRhtlAMjoNcs+KTrMG62cynA1YnQsf9f83yoqy
	 tZMmRGSpwHxLhmbRXDl+B+y1uxRWODCDWuTNjKiAtX+duFdHZInwzm1OVKoazJ+pcvAjs
	 lbOfJKNuAqGt2CdbIfeJdZUyy5mFtJu3RpcHue0YUKe5T2Si2o9J/Fvt95W82mcndYT5Y
	 McX5ou1rzwxeYy4tVDLGFa49zGgefF1DXaGHaw5WoXzyAZoOXZi7UPB4C93f/aTvjRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613028;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=rDIlJeLiW1UM0feLkzAHATTJDCWCHt9MGJP9CMm7LWU=;
	b=Yf/J+bSPEy+f1WvE2zC2ILCWyIynaI2iz2RG/k6/zVYbV/5WtzGGZ7Ix9BQnNlxwlCEb
	 fQKVDFnwaXWhDagofRMRh+zW0IzMB3g+cYH7rzjRZxV6Lc1BFBQj9Tdy/XyERIQaGHq3i
	 1tTUtb4MGNLlPNUJfkGYQJ5VPDsFNLMauc5SXJXGKyrRUJM83J5Uj2jf1JiaV8lGQnNvx
	 0tQNjDriQhV7iXY9AeUZO4/R88JvGZKsYKxXQmVNgl0WdzZEYTjZqRkKcJCw7BNZJY6s+
	 t9MrcUaE4sL0a+64cYg7jGOw3qoRa+R79MmnNBhdyl85rZIocfsicyU51YAoUyysSHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=OZEnA9vL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929F0606A32C;
	Wed, 25 Nov 2026 13:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929F0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=OZEnA9vL
ARC-Seal: i=1; a=rsa-sha256; t=1795612995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qsx5OVDVgo639ewVViD4Yk9sTWn5lMKBKUiKShF4HHyTOl7dtEzwZj6hDxtpTwI/1/KPpWq/d7LzDXug+92af8IP1XEtn7OD7TAwv9EDTX2FirfoscJVSZdsx2cwOkTZWDGRhym1MIkOXkMp+wwtSyh1pfKvDutG4xk3hoPsxcY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795612995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rDIlJeLiW1UM0feLkzAHATTJDCWCHt9MGJP9CMm7LWU=; 
	b=CLdeOlU47OAnXKrIhEOftcPJUPu58tR1E9HCfbhUKgkHpG2l5ou+ocSobcpdGbgcZ1fzlKjOZwWcOo4sr8s+vWqx9uSyfFm2BA5aoK7wrbOiRrUiI55Jsg0riD73fC44imAuaxldRM2hw43EK2nYW11aadvMLFcUX04+SSG8zkU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=OZEnA9vLUYhUow5p1G+oGZ5H/L0sxFuIfzr3P6OQhGbjFL6XksHUnx4rT1BxgIH6/qwPpJ9Xo32BUIQ7tEycM5/vzmLxuf2iWEeheETRo6ynkKo4lLuNLYtLZZS5i84p+dUjND2OZ2M4QZ+g06y+3vqttX7llIXDE0eBram2tt0HW4TMd27//zpCP/kosUFe6x79WLtsXxRqZu0S9RBuk6ussDC7k7LXuhdi8Hp4QAnZJK8ehai0D8LyxyD+NL42UlfG4ngdVgwIYieK0ePvww3mT+c0CFJfWVLzRmpTtnOdimoJuRVKOO3IOZkel6/WnNKy7F24zhTPr1w9LJmkcw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=rDIlJeLiW1UM0feLkzAHATTJDCWCHt9MGJP9CMm7LWU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795612992723857.8540790151453;
	Wed, 25 Nov 2026 05:23:12 -0800 (PST)
Message-ID: <bef9953c3e33e4ae38cce4464912088808240540.camel@rong.moe>
Subject: Re: [PATCH v4 5/6] platform/x86: thinkpad_acpi: Detect auto-mode
 capability via MLCG
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
In-Reply-To: <20261125084644.137506-6-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
	 <20261125084644.137506-6-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:17:04 +0800
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
> MLCG bit 20 indicates whether the EC supports the auto mode of the
> keyboard backlight (0 =3D manual levels only, 1 =3D auto mode available),=
 as
> defined by the firmware.
>=20
> Record it in tp_features.kbdlight_auto, for use when registering the
> auto-mode trigger in a subsequent change.
>=20
> Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_=
42j4cXsXZQ@mail.gmail.com
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> Reviewed-by: Rong Zhang <i@rong.moe>
>=20
> ---
> Mark Pearson's Reviewed-by was given on the v3 version of this patch,
> which tested BIT(20) directly.  The symbolic name was added at Rong's
> request, so the tag is not carried over.

Usually you don't need to drop a tag when your implementation doesn't
change a lot. Adding a symbolic macro is just a trivial change to improve
readability and maintainability.

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 764b1efa6..ee8f7429d 100644
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
> @@ -5105,6 +5106,9 @@ static struct ibm_struct video_driver_data =3D {
>  /* EC level that selects the auto mode for the keyboard backlight */
>  #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
> =20
> +/* MLCG bit that indicates whether the EC supports the auto mode */
> +#define TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT 20
> +
>  /*
>   * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
>   * tracking compares EC levels; the auto mode is translated to a
> @@ -5189,6 +5193,13 @@ static bool kbdlight_is_supported(void)
>  =09}
> =20
>  =09vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status)=
;
> +
> +=09/*
> +=09 * MLCG bit 20 indicates auto mode support: 0 =3D manual levels only,
> +=09 * 1 =3D auto mode available (per the firmware definition).
> +=09 */

Usually you don't need to repeat what has been expressed by the code and
symbolic name themselves, so this comment can be dropped in favor of the
comment of TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT.

Thanks,
Rong

> +=09tp_features.kbdlight_auto =3D !!(status & BIT(TPACPI_KBD_LIGHT_AUTO_C=
APABLE_BIT));
> +
>  =09/*
>  =09 * Guessed test for keyboard backlight:
>  =09 *
