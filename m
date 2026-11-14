Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794664097;
	b=JCQgFrWtmmdBGKxrRp3WyhkccaZm0Q6sJnudjWP95WGHYsch48DVYiSx/MMiANNr6Sij
	 63+je9UPm6FirALtlagVdbSbPSYRP4XImPGtdnBonZUVh4KOHbntkZay31ZmZTPUE+c6n
	 KBU+9J/1MN0PRjO8QU855OnNdl0bK9tG+WUovjBJueoCkEYSMbf8W+GPUjVXevKF2njPl
	 Dt4nUGZsee+hBeOlY5Qm530bwvMTa6T1xp+AipMutX+huFI7L/wfCpuVOepX1pFvfrzI2
	 3ABhKLxJnOv4Bsj5qJCooK7Sgm+m8vpIVuCY7C+uVD1WWeNNemkp6LBoVmlNTYUgqyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
	b=kvrxMr1lQufZrE1SCWoJ7cfliFJCwXVIZhZHdW1H0aU/PTdsovhCsvALOZSVkueiwGGI
	 9Ff6ddByTgGbj0QlYmPZKLjWyvtsQHUlhsOSAPOqhbqcIjRJaHaINAsEsfC5j+Bo9TutL
	 AE+GN+R63S6Y1kExAOY+sCbYb4exONXQmIVoZy+JG81pVoZvAgwY7YkQtBn1shggaHzhf
	 dIXd6mau33kRUltkPUAvx04GDyFlqS0Bacti0j1m2sZ1bMjmV5IAssMUVh8tLVFFQgoCf
	 TxmF+nAaF2nMEX78snakLwpeZbfYsVJhvmzwcNeiZ0qhddDKYF2bibfAoE7VLitM50A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1lZRvJK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F77606A32E
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 13:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F77606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1lZRvJK
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso138318566b.1
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 05:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794664095; cv=none;
        d=google.com; s=arc-20260327;
        b=X0zv3ncfhktiXRysypSevp9uVk9zXwUmEeNwbmvaMasX5ulhHu3pmw2im4n+fsmSqr
         /cJDn2Of4Mddnfu2uCi7B54UkKz5FdkJgII0FF9cMbkACymGka39DnJMz8x2mFTIh4r8
         yEf/vKZ//Ml+mGuaeCrhmCI4vJhJAP117eO3H1bEc9H7YfFzqihzJK3Nxhwaapt8C3Mg
         aNpNZD7j60MalJeUOxTxkZshB4K5MyZtE75anM22NhB5S7vp6nnw4aiL/2z5P5cHjwZ/
         wZ8I2beiSZzFsV7HkvuOepz8YZrqllB6dKOjb8ECvtGX67GIUdWl2E1tRLvZrtvDFeGt
         kODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        fh=ntEwppHzuPGz203uwLVm7x3jQTmvPTsoVaZylUJni1g=;
        b=p9NjyseyVaFkgtjldC9/jrmrCqT8q83TMswDJzALsQqUpuPsri95Nvy3XOEXXsq8S0
         rVx4VVSyumsgwh57XSpzgy8C482Aimx6bco+m70/ePf+un8w/jxmi6CORXwVRfY9ylBN
         rPEpBDtiSQPikt9TQdrzxMxQXFHwh0OkLcNHm6pHR2a1T4JtFOMGY+BWC9Eyy8crZJST
         7635nitf1lh4qwf6IAjiOnbaouI73wCdElaRrX2ekYfwDZ+gIqHou8E7e39h6jLDdCD3
         pX68wqxejQhIHpgQW3z5PJUHt5Dt7we3siVXeCfVCdTjUS+Xd57B0RHyfF4rQVMAB72n
         gpPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664095; x=1795268895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        b=i1lZRvJKI4pxHI/KEdEuK/CRwqVzQapKRUGOfPtVjMvx4zhIWjT+w33rNSJeqmvXlo
         8XpnZS5ORoj1BzxD47pEaEpJvTnlYATebqClXpn6sdm8qF9gfzCNzJVnMkdCT7ESZZuS
         VsYzkkaxeHMVlAZVdjqDP3smlo9CHctLUcByBQQT/T/XuEanH5/RNOpbr1uavF8GfUTE
         rUht9LK1bkXx+Cv4YR0A5nq/89lX14A4KTDDiq3FS9DuNTsjjZ6JvwMjOqu49UhwOkM1
         8tChAF6M9Xnq8sA/DjxVY73Lo9MvIuvm1DRZvCeFXRv1qaZlpm7exLUsbKHlUyAqHT0v
         Gw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664095; x=1795268895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV9w4XdeJBMVabGCuGulxAnon3qiDUPy4KI5C/5BU4A=;
        b=gEkd4XXJH7OmtRVwpRoABITqHaXL9EQm5FgMuU3y9zOeZ50NTaI5hMuVuzqHNx/d+0
         wQZbcr+YI8ot5mFqA71xIrMmjebD1Ak/7cIj8azwSqdOmIh5ReaaMyBU+vc0Pm+KNV8y
         bp0AYU+SqHEjuripYsxq/Bq+hNm36jdvTMQNbsJ5RdUtFoWqOirjusAmuyiOJPcrbmi2
         NRBBqzML7H6Grx/twVk/H0PAjs9vQfbeliDJLEno9eITu9x/tT/LQvMUZ93S6sBKHw4V
         GXQeFSA/FLSnchN2F9p3P26caMQHW6c0Sh099RRH50j0+PA2I/yukHj+0G2gYLC+5TDx
         fQFg==
X-Forwarded-Encrypted: i=1; AL+hErEgNFrRatV06Lz4rHfi8oeYCKenw8bncUUTrMrvmtz8Y+6ZgiAry0PE9L+gyNJEuAAOheKH7pXv0Q7p@vger.kernel.org
X-Gm-Message-State: APuU4Z9EFjiMDRGtMIvEeIhj+/FqMJ74KbRUWqYU/UzqeAYNoglw+9Gv
	jIOPSElM6P/tAhBkY1H6eGalTY4B23ph+qtPiqv6HIxX3oaTnNPIE1qpQ7npfi1MZTY8AD2g5H4
	I/tVwKnb/cdiXBs8A42+3wzth2pdVaLo=
X-Gm-Gg: AYBFou05yi98IJfuz/R/UhLypb1M/gbciTMc/WT0xj2BH9/qRZSVNQWC17cUMFdVjAi
	BTEj1wj23f1isXKkc+VM+AU6oqD6mglPVyR9lkuebF2lKBc3DxBMkPOB0zQMHBj9geH/4qinHXG
	ktHYYaOOl3oarMj5JGme1EDqEtg3V5VYTqOhM5aasqyDjJjfbMzHXJevkh+RO01MRqe2JTvPKEQ
	85najN+/WZfoMAmLPt+6MDWCUvEMkt6hdFG2+LEToukdnNowva+zUNwi5ZbLo6NxwxqHM2RuQUy
	oqWHFKJFcFeAawyXA1FrZkOZdpQIkUotVeM37E7N29N9ZK/FtFK86FErkFZHF3Qx4ZUhiLt29yx
	e7BefCr04lmkQro27nMMFgaB9UEmBOXibEYcFjE4=
X-Received: by 2002:a17:907:2d1e:b0:c4d:28c7:eb21 with SMTP id
 a640c23a62f3a-c50963967fcmr464257666b.29.1794664094926; Sat, 14 Nov 2026
 05:48:14 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <sashiko-outbox-214383@kernel.org>
In-Reply-To: <sashiko-outbox-214383@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:48:03 +0300
X-Gm-Features: AclHuK9MsmyVhAUhfYgzoV6y_gIsPjRJJ1_oeWNNQdGoTcpp9jpoFerTmOwCi6c
Message-ID: <CAOPX745DWr_y5VfuCGoyJDKj=mXOpxWsA8TyzETwpVjeOjPEHg@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] net: phy: dap8211r: link trigger rejected in
>   dap8211r_led_hw_is_supported()
> - [Medium] net: phy: dap8211r: LED register not cleared in
>   dap8211r_led_hw_control_set()
> --
>
> commit 7e5f0824bef63e117be29a9ce8d9c67d5c813bfa
> Author: Artem Shimko <a.shimko.dev@gmail.com>
>
> net: phy: dap8211r: add led hardware control support
>
> This commit adds hardware LED control support to the DAP8211R PHY driver =
by
> implementing the led_hw_is_supported(), led_hw_control_set(), and
> led_hw_control_get() callbacks.
>
> > diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> > index 4eb50c26397fb..2e371c231d32c 100644
> > --- a/drivers/net/phy/dap8211r.c
> > +++ b/drivers/net/phy/dap8211r.c
> [ ... ]
> > @@ -57,6 +58,33 @@
> >   */
> >  #define DAP8211R_DEFAULT_DEL_SEL     0xD
> >
> > +#define DAP8211R_LED_ID_0            0
> > +#define DAP8211R_LED_ID_1            1
> > +#define DAP8211R_LED_ID_2            2
> > +#define DAP8211R_LED_0                       0xA00C
> > +#define DAP8211R_LED_1                       0xA00D
> > +#define DAP8211R_LED_2                       0xA00E
> > +#define DAP8211R_LED_ACT_BLINK               BIT(13)
> > +#define DAP8211R_LED_FULL_DUPLEX     BIT(12)
> > +#define DAP8211R_LED_HALF_DUPLEX     BIT(11)
> > +#define DAP8211R_LED_TX                      BIT(10)
> > +#define DAP8211R_LED_RX                      BIT(9)
> > +#define DAP8211R_LED_LINK_1000               BIT(6)
> > +#define DAP8211R_LED_LINK_100                BIT(5)
> > +#define DAP8211R_LED_LINK_10         BIT(4)
> > +
> > +#define DAP8211R_LED_LINK            (DAP8211R_LED_LINK_10   | \
> > +                                     DAP8211R_LED_LINK_100   | \
> > +                                     DAP8211R_LED_LINK_1000)
> > +
> > +#define DAP8211R_LED_SUPPORTED_TRG   (BIT(TRIGGER_NETDEV_LINK_10)    |=
 \
> > +                                     BIT(TRIGGER_NETDEV_LINK_100)    |=
 \
> > +                                     BIT(TRIGGER_NETDEV_LINK_1000)   |=
 \
> > +                                     BIT(TRIGGER_NETDEV_TX)          |=
 \
> > +                                     BIT(TRIGGER_NETDEV_RX)          |=
 \
> > +                                     BIT(TRIGGER_NETDEV_HALF_DUPLEX) |=
 \
> > +                                     BIT(TRIGGER_NETDEV_FULL_DUPLEX))
>
> [Severity: Medium]
> Should DAP8211R_LED_SUPPORTED_TRG include BIT(TRIGGER_NETDEV_LINK)?
>
> Without it, dap8211r_led_hw_is_supported() returns -EOPNOTSUPP whenever
> TRIGGER_NETDEV_LINK is requested, so enabling the netdev link trigger on =
a
> DAP8211R LED fails and the TRIGGER_NETDEV_LINK handling in
> dap8211r_led_hw_control_set() is never reached.

agreed

>
> > @@ -142,6 +170,156 @@ static int dap8211r_modify_ext(struct phy_device =
*phydev, u16 reg, u16 mask, u16
> [ ... ]
> > +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 i=
ndex, unsigned long rules)
> > +{
> > +     u16 led_mode =3D 0, led_reg;
> > +
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0:
> > +             led_reg =3D DAP8211R_LED_0;
> > +             break;
> > +     case DAP8211R_LED_ID_1:
> > +             led_reg =3D DAP8211R_LED_1;
> > +             break;
> > +     case DAP8211R_LED_ID_2:
> > +             led_reg =3D DAP8211R_LED_2;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_10;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_100;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
> > +             led_mode |=3D DAP8211R_LED_LINK_1000;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_RX, &rules))
> > +             led_mode |=3D DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_TX, &rules))
> > +             led_mode |=3D DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
> > +             led_mode |=3D DAP8211R_LED_HALF_DUPLEX;
> > +
> > +     if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
> > +             led_mode |=3D DAP8211R_LED_FULL_DUPLEX;
> > +
> > +     if (!led_mode)
> > +             return -EOPNOTSUPP;
> > +
> > +     return dap8211r_write_ext(phydev, led_reg, led_mode);
> > +}
>
> [Severity: Medium]
> Does returning -EOPNOTSUPP when led_mode is 0 leave the previous trigger =
bits
> enabled in the PHY register when all trigger rules are cleared?
>
> When the last active netdev trigger rule is disabled (rules =3D=3D 0),
> dap8211r_led_hw_is_supported() returns 0, so set_baseline_state() in
> drivers/leds/trigger/ledtrig-netdev.c calls hw_control_set() with mode =
=3D=3D 0
> to turn off the hardware triggers.  Returning -EOPNOTSUPP here skips
> dap8211r_write_ext(), leaving the old configuration active in led_reg.

yeah, this check is no need and causes issues with rules =3D=3D 0 case.

I'll fix in v2. Thanks.
