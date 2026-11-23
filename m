Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795451066;
	b=f2lYo5vSB9iNaYY++PcpnW+TwLOvmLcwtDTDS3yksMdnZMZoRyzdB/PrsHozoMBOPEAP
	 MuRRU0Dy1Z0BWoR3Z0DwWVhVuWsgoIW1EoGz+9XXCxC6TzXQBESoT9aCSpZ5YoUyXNpf9
	 Q1Rdeg1rb5VyzKTMPa0pT2Xw72Fy5/g9RFqEqZA00gMEYiH1pRuLe1ZyrqsyYMwvXz6Y5
	 BmJd49Bx9r3343+GUQJh08g2O7Y8X9TFxRQmcCxn7pfy983iRVLRSoxO+P7mKvvMAws5K
	 o3x32cc/+VTgnn7Ki0jF+UubgqRch3H1Jx85mZzJifXwUKzJdRcQgRcC+H1Ds0rYfJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
	b=vbEhCnTzuVcv53p1hQikOhP+HmqzcGVmNI2m9AVIkgvh2JVBJYdGDFfMwi1oy+OCqa+a
	 jRs1aZAceSqx0AY47Had78A8QjbniKFtoJiqgg5gLuak/VfVYX2EdxZ48CFTn8N23s8w/
	 190aqI51T9Pj01S89x7TN73SZSDj/2O+q2w4xQyUVQACzgjmsKRX/hgBKSeDs/TqrpjuZ
	 5txBp+NodhL8fErWvVMzpvDpiwTFKbvnQbYLMpWbCESKPPnoJsJoBUvCmFEgu2e8PiImf
	 +LbzBDX18FWsWrWtfjec8ZQeCLJbq0F12mX0bX0saetCDct9RcLbc5hSDIWnS96Tm/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGG61wye;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C5606A31E
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 778C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGG61wye
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5118deebcfso512447366b.1
        for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 08:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795451064; cv=none;
        d=google.com; s=arc-20260327;
        b=L7HyUZ7ELA53smElHMFaQJ0onFueTJTkn56PGJX5J23NqHDkD+lizLodLGo1d2cV1c
         KBFZMkPXrm8Tj0QmfQGwHIcHqNCWWKKmPgzL8sV1jM9WGWQARAY204Rqyqw95PpAW7K9
         cULvq2UNXx4piu2QrrOqpGUoIL+iLqnySbnKMHNGXHXvy4R3yN21GSBPm4BWnDcAGmnQ
         mteFs9HuTwDMlC1opuVPbNk5pSYbBboC/WgZl3Py/bTIT0XqixkicenooaHABD6NZ+gq
         7lsebRlAPsJXwEvkbtvVJIsDBVy1vRWNZX0ZrfuKw5/qik+qAutUjSvQLaCQJA3+Mtii
         7OfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        fh=UciDZBLTCeO5MpiJo+Kjjn7WnULwRdmeMONlCc54BWI=;
        b=fFUHWHqMTX95aUBlJ5ETJ60kK1J3ZpBMhlQMWwFl85ESUH2KBFt3wgEuvKHIwjfI7K
         3sxXkSg1iwhd83HYTj/DO4zgARdwi2zOSGpnQ36lVSlXxVgiddWv210p1eL5twEgj0TS
         /Ve2C5ETATU09RErXh+83MH7c5kzLVV4uNcm2a/GYn7GxkoYtc3LizU8QRfupC/pPXmw
         9fSJCi2F+3fMq/voYPJaXlu72qJXfxbMWhOQfteWwTs3Iapo3KK9zQFpWns6DsgRWmb3
         cTWP/48Tunf0oQcFk29undBhzUswq1B19jcCnRZREzwbqg5PLamGFrAvXq74oFOBprHC
         +BOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451064; x=1796055864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        b=kGG61wye3HV3NP7BQ17KP5dlch87le463+NAUdJ0Azg5wUYimKiAXVX7T+vAKgW4n4
         USmVJ6ccq1JiCOBFkF238YbF4N9Al3OehytGod9mVZIrZDCu8bHXwPxRDjfQgB/x1z4S
         dG37hmDbqD1JMdGkG1LnHRi44iWi199K6o3DAbckMhYBQRRZb2X7RzPY1yIFuQ2nrFL+
         xwLWYkuR8i2t4oLid/D0xml/jOJL9hY+et8bBtzEkPqj9JXq1XxiW3yn4r+SFuAmmJfe
         thBHf/UcvioFJlCVfIwSXNxW6mzt9E7sOVMxo03V5lZZZh/KAq2Dfgx06TI7XBA0z2Zw
         G++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451064; x=1796055864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        b=WvFlneEGaxfcm4gg9DSqHBTtmzz26awgQuAN8IBs0/Lu9OuMIYxjc6lhaB963WYkpR
         E67Fzo+d2CK01YbVYqStIKaShrUi7LuxtDiqNO7PEsJHJNR+z9/GqKuxIkTAe+QC7e1p
         U5fnlxXMp1XbhbGQ4Fs+HV1MtEzyz+ZkHTV3YANGIwz95hvFTKrmQqg4BsB2LZWdyX1K
         NGwA+7YVKPd2A2byQ1Y6BS7nsIHHLM0AnIXMuMPP+KBnxUYZevQ/Liu3ElFMcmQbATTG
         MyxJgwNuSmc7Lk0Q/ed1DXx4xGA7QeyiSmxOwNpPMaPqj+0GlezQ9UIv5XWuybdcY6ML
         MZjg==
X-Forwarded-Encrypted: i=1; AL+hErHWN057TfehVX/xogx7067deQqCv5jdxMMJQNkhMxCBMHuShA6tlaUrl2uJlrYOm9VrbMelgIjR5iht@vger.kernel.org
X-Gm-Message-State: APuU4Z/+q0GgvNEa83MmECak1WnamDcSaVIEMtuT4Qqtlg3LVnt3oPIn
	Gz2W/tubwhFNA2mG2gl1Fcv/mpR0W7pyKi3MPmXoU/LRnnSp7NCkRajCvRTlCkoKdfO0bmNpuSG
	ZFhBDH8gedb/MXRbGe/3Hl6Z+yP11F2BMD+zJ
X-Gm-Gg: AZFdTZdQqFLVTLhR/RygqxvOTFEt93CnhrFSnLaUjXd4nu62eqG7IXl9CsxAQhegXqz
	Xdsl9w1pVQujUy2rw3ZA7MXN+ogi34rkFxktduAH+fMuCT7PfeJC2U5m2/jUaxs4AIr3cdKvezZ
	0CjZYe6UAN7ZZbpEfnLVPfB9oXlDjzJT2wNnG4Pl8SCHJT5QcDhirVOfid0NpcPHjP3uu6rz8OJ
	Czf+ITaRMGRpaBarAxEWcACsqLuvYVPDr06eHTaGV5AGvHwwBz/v88fL+fA05SogvYJNysm84uK
	CTXKFHDdpVF3s1bx9RkcFrca2BCfJNkB176P+D3yZ6S4TRaEKUZI0h5D/KtKG0mVikshlDRZ7YC
	QkldtRfJnFE7jmxZ0zcNN5VqESD67hqZyyBzS5g==
X-Received: by 2002:a17:906:231a:b0:c42:4750:8d49 with SMTP id
 a640c23a62f3a-c513aad2400mr684425566b.25.1795451063824; Mon, 23 Nov 2026
 08:24:23 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122131900.2951586-4-a.shimko.dev@gmail.com> <179543998366.3135.8537500779592480863@kernel.org>
In-Reply-To: <179543998366.3135.8537500779592480863@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 23 Nov 2026 19:24:12 +0300
X-Gm-Features: Aa3M54pFMGCEqfrknuxTm9QQEvcIIV5arWsj3tZLkp59n888HFnWQSHbf7MxHro
Message-ID: <CAOPX747Whtrpa-aP=AhtaFfqMpqHHYVMJ7jNZWCdgmMc1_GYag@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: phy: dap8211r: add PHY LED control support
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In drivers/net/phy/dap8211r.c, dap8211r_led_hw_control_get()
>   (lines 312-351) does not undo what dap8211r_led_hw_control_set()=E2=80=
=A6
> - [Low] dap8211r_led_hw_control_set() in drivers/net/phy/dap8211r.c first
>   clears FORCE_EN(index) in LED_COMCON (0xA00B) with=E2=80=A6
>
> --
>
> net: phy: dap8211r: add PHY LED control support
>
> This adds PHY LED support for the three LEDs on the DAP8211R. It adds a
> dap8211r_write_ext() helper for indirect extended register writes. It als=
o
> implements the led_brightness_set, led_hw_is_supported, led_hw_control_se=
t
> and led_hw_control_get callbacks, using force mode for brightness and the
> LED_x_CON registers for hardware triggers.
>
> > diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> > index 1fe20efd394d7..b0fb3cf89b55a 100644
> > --- a/drivers/net/phy/dap8211r.c
> > +++ b/drivers/net/phy/dap8211r.c
>
> [ ... ]
>
> > +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 i=
ndex, unsigned long rules)
> > +{
> > +     u16 led_mode =3D 0, led_reg;
> > +     int ret;
> > +
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
> > +             led_reg =3D DAP8211R_LED_0_CON + index;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret =3D dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, DAP8211R=
_LED_FORCE_EN(index), 0);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Low]
>
> Force mode is cleared in LED_COMCON here, but the new rules are only
> written to LED_x_CON later by a separate dap8211r_write_ext() call. Each
> helper takes and drops the MDIO bus lock on its own. In between, won't th=
e
> LED follow whatever LED_x_CON held before (power-on, bootloader, or
> previous trigger rules)?
>
> If the final dap8211r_write_ext() fails, the function returns an error bu=
t
> leaves force mode off and the stale rules active. set_baseline_state() in
> drivers/leds/trigger/ledtrig-netdev.c ignores the return value:
>
>     led_cdev->hw_control_set(led_cdev, trigger_data->mode);
>
> so the trigger would assume the new mode is in effect.
>
> Would it work to write LED_x_CON first and clear FORCE_EN afterwards? The
> rule register has no visible effect while force mode is on.

Agreed. mxl86110_led_hw_control_set() does exactly this. I'll reorder the c=
alls
in dap8211r_led_hw_control_set() the same way in v5,

> [Severity: Medium]
>
> Does dap8211r_led_hw_control_get() return the same rules that
> dap8211r_led_hw_control_set() writes? I see three mismatches.
>
> First, hw_control_set() turns TRIGGER_NETDEV_LINK into LINK_10 | LINK_100=
 |
> LINK_1000. This function only reports the three speed bits and never
> reports TRIGGER_NETDEV_LINK.

i'll add it, thanks

> Second, hw_control_set() always sets DAP8211R_LED_ACT_BLINK along with
> TX/RX, but bit 13 is never checked here. The kernel-doc on hw_control_set=
()
> says the LED does not blink on traffic without ACT_BLINK unless another
> rule is active. A register with TX/RX set, ACT_BLINK clear and no
> link/duplex bit would still be reported as tx/rx offload.

i.e., if ACT_BLINK =3D=3D 0 but txrx are active (by some reason), then
-EOPNOTSUPP should be
returned, because the register state does not correspond to an
operational state. Oh, that's
important i think. Yes, it should be fixed.

> Third, any other LED_x_CON bits are silently ignored, and 0 is returned
> anyway.
>

ok

> rtl8211f_led_hw_control_get() in the realtek driver reports
> TRIGGER_NETDEV_LINK when all three speed bits are set. Could the same
> approach be used here?

Yes, i think so

--
Best regards,
artem

pw-bot: cr
