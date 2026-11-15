Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794729626;
	b=kaB09Gh78OfBS5LhASB/LrJA1OcD9eqwFN4bVIPCQC3Gvz6JzjXzYQ4cr7lpy6St1/Sf
	 ZnM8JBIDUrverZM3oZkjDWDe/xOHsL/hLVK2InpOVJMh2JSiXJSgS3Zz69QytK665Rdvv
	 5T9HkMjXq+TnC1DFAdRTmvW97HHCfbWh536z0AWY4wmqHWOnqOc3KWtxH+kphMob8q7Yu
	 Gyc7RcAl8JQ1Ob28FM4B1Ihb2sQkEHyIl6VGyekE7V8EP+bIs1tjiPEFl1wb2RXpvErPl
	 1oxeKwt5MbMY7NigVhUZJpZzgMR+zA9U0+w5I25dUUGd+iaVfgmXIqqs6BeWBc6eCrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729626;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=myjoLXazwLDRkDTG3hloKil1Y8hRKK3sJ0fuXOKFC4I=;
	b=aKaQe5wDqzrhPSuydSa3ojChNbsrpjz65ONjt2+DpWknM1236saSMbLbHoLhPTN4p9yO
	 zJsYhMt6xCGtAMMgjg0uJ2KcJ9HGZnIFfmYIrs5nj9Kso6USFpJelm2mgjpHuxfwSZUgV
	 1kowqMBA1NfI8Gx/i5f0hSxU3Yw8YMyYp855M3UOGVSKD/tFyVjClchqsaC+HLpMKxSfH
	 CL0bK1EBHwpbNdUJuKKIz15lUdhXkZ1+kASQI6OmNsheok6nriWN4vy6ew6+kPOnNtDl2
	 hf7coGHBpQk6pBLepJPZvFp7iTcntfIPwp1yiKTo9iYBwmpSjgj3izGC8HLxDeCQePg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=jBMuGrT6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325AC606A880;
	Sun, 15 Nov 2026 08:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 325AC606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=jBMuGrT6
ARC-Seal: i=1; a=rsa-sha256; t=1794729597; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zybz6GG/9n4CpLrvLN/T23j/kwqAi63vqgXhKFQxXalMBnUUs2XaULc1/atztLOEMrP5z7Ary2FhAJwse3XRiZfbi6LEaFomo+5qYpPhJLc1t07wmkibdyvWJzBmdam2DYzHR2jZrPOF5Qgy7jrnPxaC+aPVWWpZYZUt6KP1IHc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794729597; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=myjoLXazwLDRkDTG3hloKil1Y8hRKK3sJ0fuXOKFC4I=; 
	b=JaEfl/UZoUdZ8RoNvCpkVjjb+aWg0/HAv0faoP0K88YLnelsspOUir8PBXWZeMzBw+RaOhrrXM9y9sTklVP/ZKRP2x6Nbelp5qJGQR3oBbtsih9zWiBKKAjBj5Y8SYvFO32iNBxTyj08CftPMwJZba1dhbCmVUopzJ+87VN6/vU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=jBMuGrT6NDMeabv6H6M7VUvobawAYc6M9b3MtXULJmEHKnqTf+LK4/sZEvrUmRqkRFOAoZwKcPr785fKO0pQtajmZ2WF6xf31pHM6/06f5WkwflVsY2Net+MEZrws3JYJEQ8zaR+21YHywBA7OMx6axIa8kaiLWd4zZ8IcS82Jech0ZDPrRgVtfcikLh5VXsFXmb6+iu9lEH91sBXMAVM9tLPLEmVap2crFN1u25sSeGWZ1kSJLs+wHrg4KKx5Ww+0r3tkk1QRm982okc9Clrj/G2gGn69StO78XiKNTUOlP3VcqbHX8QOiblGQFkZl0wocwpOa+/FKJHelxrJjxjw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=myjoLXazwLDRkDTG3hloKil1Y8hRKK3sJ0fuXOKFC4I=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794729595779702.6758341281636;
	Sat, 14 Nov 2026 23:59:55 -0800 (PST)
Message-ID: <ac0a08c2f831dab0e08fe0097ddfa77a32b8b04d.camel@rong.moe>
Subject: Re: [PATCH v3 2/7] platform/x86: thinkpad_acpi: Extract
 kbdlight_notify_change() helpers
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
In-Reply-To: <20261114174814.62153-3-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-3-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 15:53:16 +0800
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

You are extracting two helpers with different names. Let's retitle:

   Extract kbdlight notify helpers

On Sun, 2026-11-15 at 01:48 +0800, Qiling Zhu wrote:
> TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the EC
> level, updates the cached brightness and notifies the LED core inline.
> Extract this block into separate kbdlight_notify_level() and
> kbdlight_notify_change() helpers, in preparation for reusing the former
> when writing a level through the proc interface in a subsequent change.
>=20
> kbdlight_notify_level() expects the caller to hold kbdlight_mutex;
> kbdlight_notify_change() queries the EC and notifies under the same
> mutex, like the original inline code did.
>=20
> No functional change intended.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 40 +++++++++++++--------
>  1 file changed, 26 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 2c3f8cf32..c8098f317 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5317,6 +5317,31 @@ static void kbdlight_resume(void)
>  =09led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
>  }
> =20
> +/*
> + * Caller must hold kbdlight_mutex.

Annotate it with lockdep instead of comments.

> + */
> +static void kbdlight_notify_level(int level)
> +{
> +=09struct led_classdev *led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +
> +=09/*
> +=09 * Check the brightness actually changed, setting the brightness
> +=09 * through kbdlight_set_level() also triggers this event.
> +=09 */
> +=09if (level =3D=3D kbdlight_brightness)
> +=09=09return;
> +
> +=09kbdlight_brightness =3D level;
> +=09led_classdev_notify_brightness_hw_changed(led_cdev, level);
> +}
> +
> +static void kbdlight_notify_change(void)
> +{
> +=09guard(mutex)(&kbdlight_mutex);
> +
> +=09kbdlight_notify_level(kbdlight_sysfs_get(NULL));
> +}
> +
>  static struct ibm_struct kbdlight_driver_data =3D {
>  =09.name =3D "kbdlight",
>  =09.read =3D kbdlight_read,
> @@ -11586,20 +11611,7 @@ static bool tpacpi_driver_event(const unsigned i=
nt hkey_event)
>  =09=09return false;
>  =09case TP_HKEY_EV_KBD_LIGHT:
>  =09=09if (tp_features.kbdlight) {
> -=09=09=09enum led_brightness brightness;
> -
> -=09=09=09guard(mutex)(&kbdlight_mutex);
> -
> -=09=09=09/*
> -=09=09=09 * Check the brightness actually changed, setting the brightnes=
s
> -=09=09=09 * through kbdlight_set_level() also triggers this event.
> -=09=09=09 */
> -=09=09=09brightness =3D kbdlight_sysfs_get(NULL);
> -=09=09=09if (kbdlight_brightness !=3D brightness) {
> -=09=09=09=09kbdlight_brightness =3D brightness;
> -=09=09=09=09led_classdev_notify_brightness_hw_changed(
> -=09=09=09=09=09&tpacpi_led_kbdlight.led_classdev, brightness);
> -=09=09=09}
> +=09=09=09kbdlight_notify_change();
>  =09=09}

Remove the {}.

With them fixed,

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

>  =09=09/* Key events are suppressed by default hotkey_user_mask */
>  =09=09return false;
