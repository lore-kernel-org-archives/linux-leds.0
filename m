Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695862;
	b=4p1vCsX8L8Rxee35fI3BrPJxLf5yLG7IPW2RpojTDYmW+uM34u0PyeY+FEJI4NhYPd1E
	 1qjRQ2jeA8t0TvMtU2CR1HVdFOZNgcBrDMp7IwzjDUwmmI8Dze/AXRCHu6uAFSaBpgL/g
	 c9Zbvfjk/gjvorZiLgjee1Bua+1TCyjkCcq9N2+izVIvKNDLA4gQ2NQDy/hOMXxkBMxp9
	 Rx16eJ3jlEd3RKwHLBlpOSohWK21z2CxbKyUaNuWdeC5JBqxX7fwuscaE1f8N5heQsw7U
	 wy0FQkmbqxRd7CLxXmbM/0EbqyKi6gYSH5jHQn6ZZL5hzs8QNX75eZDxN7Q+bmQJXOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YtqjK/iYvndUAMyH0MTMEzCV8QCxNEuN/r6l1Yb1jts=;
	b=nv0iXGLQVM0/WHAQpUmiwMx9TGgcugvOrdF4J8jcKULUG3DSVa30D+gmPfvaOCWqJD/5
	 LwIuD98j+Bmpt1xQpTUFf3vi3ZcSnnvfJTNtnpYj65egaXgmPWH6yOHKsTn3lqGSamCcG
	 G+EckNkZ4iB5YnbYFHSvtXrS4YE+S6vh3KhU05SHYz9tj52k0WK3aiYsR9ROfJT8Suce+
	 X9Zo2BsxCmNuFHmsccLedEnRq50kV5zQ9iMHOC7p3kRW7wpSRC8PhcpttEvPPYati1Kh1
	 L1nBUVoEseRrK1fwj0cfdR8SnpAcMVS+jUqmIXpDcrb83UdM47/AmfMlgfFXdU+4xtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7qOjHko;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F69606A338
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F69606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e7qOjHko
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4630680eec.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 04:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695859; cv=none;
        d=google.com; s=arc-20260327;
        b=NrwkCOQxyz1kdRFp0WSloMRzvWO+D1q214KAR29YRGAUzCUtkJI5W7+dfWC3lrJN/L
         fARbQ13OiFWAx/ndF7dILdH8YuUbldlQd/9YGxfw3AXNx/rp7i6sRnu+z74xxW8G1PxY
         Sn2NbM3IKHAFy6oYNTCamyGRnUNB0CrItDSHya1xjyGpq1StfST2cgX25k45qAA1mA72
         /n+VkYGIv2uwVkUiReR7uzqvqZ/3FZqD66Lc3gk1YfzaaB9xLuA6PZ1XvMI30d/MLUZy
         FYKKtZ2kmatnMEGr+1VxAplkYItTlyl3ksQpjcUhBQYKMdHGTpttkz9fRGLhyIoog1Lc
         XLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtqjK/iYvndUAMyH0MTMEzCV8QCxNEuN/r6l1Yb1jts=;
        fh=kOIHupwyPKuOQ4bzQhrO61ha6z24Q+JZ2yaevSPHVbI=;
        b=kSJ5KLzTacsGHrryacPNyjm7R5Qja+zblrZd/WK0b6iDCBlXeQsMsObb8WNuk9dC2j
         01Wc+VUYG0++i8E/o885Kh85TDzpON+YxZN8oLYGWEe0zhWKFSA2jy30oaFexJEFY5IW
         jwQ5hFWULs85W8Jf6/IVtcrzhfZYnfYZooBv7b6ePMzIAZvdlS2esscuBoJPIE1FGMOG
         p4GqZaI4A1w5e31cTmVhVuhAoRAutuiD+1e6C/gbtcyY4C6fj8NiSLFbNqRbzonASjML
         yqumL3ET6Y1sKJdor+5BVlLXg2ouoQ2dRgnXEEB2FxHbXSMBPN9pcxHocXHLOaJOqAYp
         E2/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695859; x=1796300659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtqjK/iYvndUAMyH0MTMEzCV8QCxNEuN/r6l1Yb1jts=;
        b=e7qOjHko7HRU/+2bJwcc0O0DILmbrYqTiBltcS35EswFq5nek+3rorJFkIGdvgSjxq
         VgZaF4aaMAx/ASXc9aWKaZAa+x8ww0LxbgpYpMGA4t2+bih2JVcjkYjIzd2LsPoDd2ar
         L0w/jHixPZvFjhYM9CDnHWX+y6BYQ4hyAcD1EAwJ0pi9+JwBdpfTMENf1/0k2AEZimjE
         GzVKmRRfJtHSP30PkiZgZnOQj52/LBZibqNrM9QQk0G6d/EmvSosSIu8IR4WH9tkyszh
         k8QSEs4VXvnVv0JlUizHg+iZZl+9GpE1Kg2+qrCx/yw1bYikxlFgXmUychwCbJ6/FtgL
         Tctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695859; x=1796300659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtqjK/iYvndUAMyH0MTMEzCV8QCxNEuN/r6l1Yb1jts=;
        b=2n2Dm/ImXO+QkkltrsmsrwUFKHGFSEzpEtb+LwERwCVYCgjL4XD3n/bOeEX/bzW+TQ
         fMUP95SmqRIS34rqJJhiIL5xCoyiqlApzW5q16p3dHzTJZW/oX1vd84TJ87LOhREDF3c
         VPwfBT7M6RlFfvcls31nn39TFJoeg0+rnt5Yv0p+qJVL3loIgHFMSHQvsHh6YxwLmuWv
         spu5r4x+jFn6DKNRsV4FLrF0SurRgVnVIA/HcFBtX0jVrrUmazlusPSXxOXORC1EyjGW
         tJvtAoxymOQMiHmYpjapfn8PmnYCkqspBpVL54HJlZuBTsKSLADLU8L2rYGFVss1OqwM
         BMaw==
X-Forwarded-Encrypted: i=1; AL+hErHkoJxDdRKdLZOA0M5UwfDrb+kVeDrgYfYv/C7SfJI+rV37wtO+TC9Dfng9eYzV+e1rjHHolrFgdHV2@vger.kernel.org
X-Gm-Message-State: APuU4Z9d2SX4zpjumwoI9H29+m97D8uUazbgApvMHViD1WzQPkxcEkKV
	dISoMGsvlCvWDtvlU9I/2fHhEIUWwg35K5KoPA6yQGIHxv58wONDIlpE6/Nocc3Uxp3+wG13070
	HTVCDDY7MHsaRn95kufV2PYrDk1Kax8U=
X-Gm-Gg: AZFdTZdPft8wcXKPTZwWD7Ks0u8kqTJRyrqLu7N8Tdf6HFTvOyp5AS8vbzLyPOKHU+6
	MaOqtLuK0zQhGb9TLL1C3mChBsxt7XpKHNRSpoFWdH3yKtGP2YJlVYjO67qFqDi4vUi05OtCl2k
	3r+PX2eWoDP9wczo10SakG93MvX2OrQx+NgqzWIO0DB1wY2vn8/a/6M4epveVm1bHnLqu3BHwea
	gI3k14ss8+4KNk+pOKAHtW+JMpwkaSMfYjd2ZOv8/hu4VC/qQmWkyRa64lHhhCDlO/c2PIi4K/O
	uMzGfq1Dpd8zd2LNgUqvOlC1LQeQoVyk0p+JKiEmvOW+yl9s82f+hrajVg23Exdq1o39p3QjwZz
	jka9DBaAgY5Ypc85CbS47oGEsqd/a7VgSamnys3EGJk73v8KABwltZ+gpOuSEXLmyFiENsf33Ih
	u56LvveLHgYBnuy1i+Iw86rUrJpR+uMQ==
X-Received: by 2002:a05:693c:8209:b0:36a:4a68:84e5 with SMTP id
 5a478bee46e88-3856f14bcfbmr22760673eec.8.1795695859086; Thu, 26 Nov 2026
 04:24:19 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115084347.70592-1-clamor95@gmail.com> <20261115084347.70592-2-clamor95@gmail.com>
 <179510287166.63755.11402400428284590628@kernel.org>
In-Reply-To: <179510287166.63755.11402400428284590628@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:24:06 +0200
X-Gm-Features: Aa3M54pX3yC7WLzWXqK1Mr8LmeQyipRGbJO0TjFLqtF3KEykvS7rBecD5wQACwI
Message-ID: <CAPVz0n32D79qTnhpVmMD5AHfVG+BRMKCkdDx1eDBLJQogr3bcw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] leds: lm3533: Clean up probe and use managed helpers
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
1 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > Clean up the lm3533 LED driver probe and remove routines by adopting
> > managed device helpers and modernizing error handling:
> >
> > - Introduce a local `struct device *dev` variable to clean up repeated
> >   `&pdev->dev` references.
> > - Use `dev_err_probe()` for cleaner error handling on invalid IDs and
> >   LED class registration failures.
> > - Switch to `devm_led_classdev_register()` to automatically handle LED
> >   class device unregistration, removing the need for manual cleanup in
> >   error paths and the `remove` hook.
> > - Remove redundant `dev_dbg()` statements and cleanup unused cleanup
> >   labels.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/leds/leds-lm3533.c | 48 +++++++++++---------------------------
> >  1 file changed, 14 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > index d5997cbd88dfc..7db1105bee5c2 100644
> > --- a/drivers/leds/leds-lm3533.c
> > +++ b/drivers/leds/leds-lm3533.c
> > @@ -633,22 +633,19 @@ static int lm3533_led_setup(struct lm3533_led *le=
d)
> >
> >  static int lm3533_led_probe(struct platform_device *pdev)
> >  {
> > +     struct device *dev =3D &pdev->dev;
> >       struct lm3533 *lm3533;
> >       struct lm3533_led *led;
> >       int ret;
> >
> > -     dev_dbg(&pdev->dev, "%s\n", __func__);
> > -
> > -     lm3533 =3D dev_get_drvdata(pdev->dev.parent);
> > +     lm3533 =3D dev_get_drvdata(dev->parent);
> >       if (!lm3533)
> >               return -EINVAL;
> >
> > -     if (pdev->id < 0 || pdev->id >=3D LM3533_LVCTRLBANK_COUNT) {
> > -             dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
> > -             return -EINVAL;
> > -     }
> > +     if (pdev->id < 0 || pdev->id >=3D LM3533_LVCTRLBANK_COUNT)
> > +             return dev_err_probe(dev, -EINVAL, "Illegal LED id %d\n",=
 pdev->id);
> >
> > -     led =3D devm_kzalloc_obj(&pdev->dev, *led);
> > +     led =3D devm_kzalloc_obj(dev, *led);
> >       if (!led)
> >               return -ENOMEM;
> >
> > @@ -662,14 +659,12 @@ static int lm3533_led_probe(struct platform_devic=
e *pdev)
> >       led->cdev.groups =3D lm3533_led_attribute_groups;
> >       led->id =3D pdev->id;
> >
> > -     led->cdev.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d"=
,
> > -                                     pdev->name, led->id);
> > +     led->cdev.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%d", pdev-=
>name, led->id);
> >       if (!led->cdev.name)
> >               return -ENOMEM;
> >
> >       led->cdev.default_trigger =3D "none";
> > -     device_property_read_string(&pdev->dev, "linux,default-trigger",
> > -                                 &led->cdev.default_trigger);
> > +     device_property_read_string(dev, "linux,default-trigger", &led->c=
dev.default_trigger);
> >
> >       mutex_init(&led->mutex);
> >
> > @@ -683,45 +678,30 @@ static int lm3533_led_probe(struct platform_devic=
e *pdev)
> >
> >       platform_set_drvdata(pdev, led);
> >
> > -     ret =3D led_classdev_register(&pdev->dev, &led->cdev);
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "failed to register LED %d\n", pdev->=
id);
> > -             return ret;
> > -     }
> > +     ret =3D devm_led_classdev_register(dev, &led->cdev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to register LED %d=
\n", pdev->id);
>
> Using devm_led_classdev_register() here while keeping lm3533_ctrlbank_dis=
able()
> in remove() reverses the teardown order: on unbind, the control bank will=
 now be
> disabled before the LED class device and its active triggers/sysfs attrib=
utes
> are unregistered.
>

This is exactly the order which originally was: disable bank >
unregister dev. I did not change it with this adjustment.

> Also, shouldn't the hardware setup and lm3533_ctrlbank_enable() happen
> before registering the LED class device (or be wrapped with
> devm_add_action_or_reset() prior to registration) so that the teardown
> order remains symmetric and the LED is ready as soon as it is exposed to
> userspace?
>

lm3533_ctrlbank_enable() requires led device to be passed to it so no.

> --
> Lee Jones
