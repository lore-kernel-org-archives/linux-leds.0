Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794731195;
	b=5EUFd+HkQrYe+J9yMUzLReuPEeeNYFzm2x+99amcqVm4hCJbxOtvOltWcLOjdgrMpV/2
	 Z8m3/2afigRYtYMHGipeMJSSwGoEtbdRu2Wp3YWT950SQuPWtdNtyxKn2DMEPsbyM3A6g
	 xYAPsWhBm23AIZ8NcjXs64Vo8eWMcBNT0zGiLthhiRTQ846Zuh8Ok9/m8atrtfG0LCMt/
	 IxKVFLVPXfvS5lRSm+RjvNEJQODGVBlQAUuTSsWG4/cVY01RVngBVKi0KsTFUDRPz/82i
	 FhfSqdYxdHc2sxcNaOnZ7MINezSnlyyuoF61GjYG3WhlY7tfdkwzCFjU7NLcayZUIog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731195;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=bqhgq5wgpsZTAQIJD91RVYXFvuwe4khAK7zeI7fgGbs=;
	b=5mZIOYoK8YFJJIQHx0/SlyxAA0nIdfGeQAN7t2dj70eax2KnMtlBl2IppFkZbUiXi90p
	 pbkXH9EOYgCHbE6co2SNKgpeM4A0ewoDfh7+MY+y/ecWf9Gh+zxOWYqz+9RxpT85YM5lJ
	 HQKJC84u5fxkO/eAbEzGNEd+q/VfWr3wmRq9cKiJ4jV5Z1f7aUjDEhXROISQgnM3nlICW
	 gktCUS9/Meduc3wf3Vq+0NpaiL79VDwKwuLxbe8viZg7wnW4546rFtWY+0CMeFdumUo6Z
	 Wsi/0w7+KmnpA0TDilB9lJD3StQM9LcaTfBjRzNwNwODDpLqfE8L1ZyCg4/HzIE0gYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=U41VuVMn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB37606A327;
	Sun, 15 Nov 2026 08:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB37606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=U41VuVMn
ARC-Seal: i=1; a=rsa-sha256; t=1794731165; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hTH/P/QFMyqDRwe5Jzy3eXT9o0qW14c64MGsds8FEF63Bwh2yE3fcR4hPTx9X/G6B73dkwow7gtIHn/2KiUwbXLfA4yl12I8WU1C7QhZ6KRJeY+wYdZX4C1HK3AYpQ8dSM0sgonqdWy5KvTmJ57hVo9OCwhMbPkfSAoiLjFVVyw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794731165; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bqhgq5wgpsZTAQIJD91RVYXFvuwe4khAK7zeI7fgGbs=; 
	b=dnbQf580mrbz2955cWS9Mh26MMf3s/5esL4XO2ny0u0EDRe9pTSPaSeHc4DnIieEwvK9kT87n6Wgf11Cl6OZ7cq/Jm6YVKCfA1tcgNCURjQW+RNmVUa061H+AfiOa8+hCa/+FUrBfs2EaMvKsmQwRESQ2FZuWShhrEHWxRXCyjg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=U41VuVMn3WPQYqltS6gfMBow8da21GCORUCobqJGKvVtz8dzzm7mYIYsI3MYy4TXWgzKbLefZi5N+tXJStpuYQEcXzpy/kH7lgFZ1Yezy/2JBJDyFFtW1nAYwmzqIUG945nAEwpGw4z31Hk2mxAUmWRU6dy7GcQuiShyxDhzbS6nzHMQ1xp1ERrvwamEw1Nbm+I5Z0bqLvEv3bRSaSgJosK8ehD359TVgCKZYW/3KetJWRmSygVqnb5Mp2oqOyLkDxHNa9kQhx+hssAumQf0kei1JDlHB5ETb2bHYQsl5zmdbY9xAfoYH3H+s6vIzqF9P1cNAUz2oDRfi7n9xqQjlw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=bqhgq5wgpsZTAQIJD91RVYXFvuwe4khAK7zeI7fgGbs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794731163268839.7845382068406;
	Sun, 15 Nov 2026 00:26:03 -0800 (PST)
Message-ID: <0cd54ba6673168ed2f6542d31c03a02f467a416a.camel@rong.moe>
Subject: Re: [PATCH v3 7/7] platform/x86: thinkpad_acpi: Reconcile EC level
 on resume
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
In-Reply-To: <20261114174814.62153-8-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
	 <20261114174814.62153-8-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 16:20:39 +0800
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
> The firmware does not always restore the keyboard backlight level across
> sleep: after hibernation from auto mode the EC comes back with the
> backlight off, without emitting a notification.  The cached level and a
> possibly still-active auto trigger then desynchronize from the hardware
> until the next user action.
>=20
> Check the EC level on resume on auto-mode machines and route it through
> the regular notification path, which also deactivates the auto trigger
> if the firmware left auto mode.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index f11e61417..802e0d53b 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5395,13 +5395,22 @@ static void kbdlight_suspend(void)
>  =09led_classdev_suspend(led_cdev);
>  }
> =20
> +static void kbdlight_notify_change(void);

Nooooo. Add it to the right position in PATCH 2.

> +
>  static void kbdlight_resume(void)
>  {
>  =09if (!tp_features.kbdlight)
>  =09=09return;
> =20
> -=09if (tp_features.kbdlight_auto)
> +=09if (tp_features.kbdlight_auto) {
> +=09=09/*
> +=09=09 * The firmware may not restore auto mode: after hibernation
> +=09=09 * from level 3 it comes back with the backlight off.  Check
> +=09=09 * the EC level and reconcile.
> +=09=09 */
> +=09=09kbdlight_notify_change();

If the LED core doesn't detach the trigger before hibernation, please
restore the last hw brightness instead of notifying any change.

If using led_classdev_{suspend,resume}() causes pain when it comes to hw
control trigger, we can get rid of them completely (i.e., on all models)
by tracking the suspend status and restoring hw brightness properly
ourselves. With your previous changes to kbdlight_brightness, doing so
should be easy.

I am also thinking about enhancing the LED core to properly handle hw
control trigger on resume. As said in my reply to PATCH 6, please go
ahead without my enhancement in this cycle.

Thanks,
Rong

>  =09=09return;
> +=09}
> =20
>  =09led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
>  }
