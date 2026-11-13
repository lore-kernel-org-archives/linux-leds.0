Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794584486;
	b=G1TRciRMBYpyUv9Modbxp+7G0kTqGmiQopyiTpDy9fBRRoQXbsRz0SU0bE71s0Sz7Xo2
	 B00+Ggkk3aSa/8FkCxYrLBZPx8QZAPLmyMWZ6oIeUE2U4V0eZC5L9yNwmTafWwiouh25/
	 qAdxDryM/TTPHmBwK+tpNUvnUGKHsgN9nb/ixCzjXKdxnFxe1XByChjtP+xvAaXJ0SYaN
	 BTzpcEVi126lyDrch6Tu+AsJT0n7y7WU4bXO1KAdzfmkmcVeFqVUm+jORu87QSzAEayy7
	 u/FIwlZjr0KjagA3pPRClkYV0VuiUKG0ZpzPUPAvcHi1yiN4lgU2tueeD0KXrP2Gn+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
	b=WIgaQevQ/TtQJ91R/aEuL2wQG2GosFbmXMzLUl5ZMErnNmmNAnzRUPAuDtW19YPVmrC9
	 D1HMj86+LWSl+46wWguacDRm4PlrraKIs3I8Kzw63q5MRnBsFs6QVopfdB2W6z95htLqQ
	 gyTEwakWikBz7RwEcngfBVF8l8DT47mPymD/BQ9StyV9yFjWfAxvQIiFEZ1LRpDOSNjsn
	 vkdaYXGZ5p7wQ+yornBB/PyaoT4a4lu80w82BuYvbZxLMuTtJokZ08xfP7nxFmv1VLyVY
	 FlyDhuGlOpS2OjEvDi+JqzryMygsP+g8S3KjCnQx3cqVHSVE3yXptKJa9aEFbHSdarA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNOq1xRc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CC6606A327
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 15:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CC6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sNOq1xRc
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc758830601so1743294a12.2
        for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 07:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794584485; cv=none;
        d=google.com; s=arc-20260327;
        b=fA9edqJvXt5f30Amhoapu/4JWiMvkcwf4suxVUitQp5OWMI9ySPCtLhi5aW3hKQXNP
         tymi+bpL/qVB4sVXxRxcRjQTLR+JiYc8TjCCUN/mSGytJyrOOJoe+6vyOZwiUe9q1KuA
         KPokBryq5EkE7C+Za4VJwrue8QXTjlcGaHoThRlyLLhNsrqf+8smu0juda1jdGRdzTqi
         9bU4czCwUjBsP2tXUO47Ur1OB9NeCVIL3wn3ICiUo1u2Y0H7Mx1/0acybnWqttonR/Su
         5wFSLc5OXzvgYPcRUloOk2++8X718umItrJkc7tGeFR3aiqRrhpcQYkUDuuQDyzTixuE
         FCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
        fh=Un7/+HjbKWQZ6V0TqJhwQVBURGwV+P/AExM3gu/aol4=;
        b=b5rAxkq8/G6taLalfiL5rIGUFvgTZPcJrUIFgxouBpI8w8VYRxmETEwf0B0H9AnI+H
         N+UmZnRyboPM0GwpkaqlldOxzxO03DCbIvCIjDKlrk23NW4X6h0H5DsVQpA4QftOHfNE
         izPhJ40xW46PBWidp+gdPD6qd0C9Vkavb5Xgd5zpMDmRp9M6Pve6nnNUzhudrvo2Op5p
         MZnmft4k7knsym1iJ60PMJF831qvhCYm8nw5jVkE7RQmT/SMgHuaFVRrNWtIkMCUmwZC
         s7mjA178NRNCzvAofyWlJ0PxcZOJC7sewSNAs7s1oh7XCCWfvuUKrOnXlrDPMetX31Ho
         iPmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584485; x=1795189285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
        b=sNOq1xRcDaTvk+7CO2nvBE8Z92YdcWOwAoUU2WsLmQXn3aRQTdsouN+A+17mIBHvyv
         ek9nmlKYRePtkM1jqWVqyCzZ5e7REGB2jIA7RZ4Po0puoAl2kSpjjb4/bbmbcHlZilv+
         Yfuda8kgiIMAMySNkVFkwfpUHPgt0r7IDghT6TDt8M8KbAIsJZqjFhkcF8r+RioqqUDM
         JSimh3r9KFgmbJeytjGT/bSUshkZnDfw1LTJBTiHV2bTC/plBs5uoBTWFDRTReQii3uS
         0iC/+gpNBuZmhUXjLrazSfR7YqwPWZovxpMMPUa4F0dekmeMPx377iM8QFf1tcV134ld
         prdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584485; x=1795189285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ictCGGMxgCgpUNAPmSmusxCn54ZLVwNtSFzM9e1649k=;
        b=t60YPSnmbRA9v+WO9E1s4Qrni6ZwDXnv1iA2THvnyURBz6qNyhCVuZlzmhuas+SN99
         ui4hDLCRauCULxqo/lWRTlPEnAtzAzGLQq9UgGcWMSLYxkIDOG7Hi5Xcu902Z1PM0IsQ
         zyHrmnnE5JQSujdnS9x98CCWl4GLtb/DPTMZQ4JZSWs5gwhZJAE/eSfOfbwcpSL06xpz
         DM/XqmF2cVZOGc4WZGn0lfHX0GLMAQGcPRBR5LMo8EEAGku7kyIIBlXpIl+jKfEnsQVA
         bseRgYy1Ir7ZpsJZbknGRlggWbOVKTlI2g/8t5wLukIq59WONMfmkgvcE0V8ZiIi55p2
         8V9Q==
X-Forwarded-Encrypted: i=1; AL+hErFbCvjazF5ZPCet1rr59Z2UW+Titta2jOsCA7oJ4A8QYBiSPJe0TJuKRhhdLAas5934mIOZmc7ZpKNd@vger.kernel.org
X-Gm-Message-State: APuU4Z+FV9JenCa6vAM6OWXC+jL4gZ3G11Ja45+rm15cyD6U/Gxf5s/T
	AFCbf50SNLNnGZg3TPIjaE8H+lFtvjvuJgFF6sG0dYV49jGc/QrPgbv+QU98lY8e7HMHGsdYUp+
	CuDVMWtMA1+Ov1kYgF2dYV5c2reL7IVk=
X-Gm-Gg: AYBFou2GwXp9QyVDIC3K+jbVGoJUiR4G99F3Ak/Ppp2Ks3pgIVIzlAloPXgIK1oz1tK
	4mWtZ95G8Oorg9gkAKc54zSubPFwCiblSL+17J2/UKBTVwpGKpq4JcZcX5/jjIzLz2O2xspoJTG
	o7pf0B8khAP8NRET0kCOfYU29QuKVZsWfWN2tUDNnX32rU/DL5xzr2fv/JboSQl5GKamV2wuUxC
	a8476+qlCzhjlwzaebgAJUAjcgP23qc2D4p1loMhKd1ncpjrbkx4SY6oXgQM2zbBws1Z9HXeeHZ
	/WlXsWC1jZfLLe0tcjCw0FYp/ksp7SyPt5rnTaJ/bRTuVeEXjUHkpVBLPYgymDY1BPbc0BZRK2t
	y0+Lrx8YOjC4ovk2wTFC8ir7LDBjRVqtXhpTyyjiJyGjDQKDU9ACzkBE1R+sBckjeY0wuAtavpv
	GkwrLnzgl1lwf045dngf2vpy3q/diF5A==
X-Received: by 2002:a05:7022:3c87:b0:16c:4eef:a526 with SMTP id
 a92af1059eb24-1b5030e2ee9mr2671578c88.15.1794584484844; Fri, 13 Nov 2026
 07:41:24 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101142435.130520-1-clamor95@gmail.com> <179370032880.793788.4424159880220279586@kernel.org>
In-Reply-To: <179370032880.793788.4424159880220279586@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 13 Nov 2026 17:41:12 +0200
X-Gm-Features: AclHuK_BgAPnek8SSBsS7xD29UnkVImGVLvK3G9PVowz-sB26JLAqdiA-Cf1RLY
Message-ID: <CAPVz0n1E2bLOzKEC6_2iiPM5ZZ6-NOXuOkwx+jQYn8BRvPXwSw@mail.gmail.com>
Subject: Re: [PATCH v1] video: leds: backlight: lm3533: Support getting LED
 sources from DT
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 13 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
3 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Drop the 'video: ' part of the subject line.
>
> Please review, explain or fix the Sashiko review(s).
>
> > Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> > defined in the device tree.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> > ---
> > This was part of the original LM3533 controller DT/OF conversion patchs=
et,
> > but it appears to have been accidentally separated during the final ite=
ration.
> > Therefore, I am sending it as a follow-up.
> > ---
> >  drivers/leds/leds-lm3533.c          | 60 +++++++++++++++++++++++++++++
> >  drivers/video/backlight/lm3533_bl.c | 45 ++++++++++++++++++++++
>
> Why are these being bundled up?
>
> What is the dependency?  If none, please separate.
>
> >  2 files changed, 105 insertions(+)
> >
> > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > index 7259097bd6a71..a1aeff70a90fc 100644
> > --- a/drivers/leds/leds-lm3533.c
> > +++ b/drivers/leds/leds-lm3533.c
> > @@ -26,6 +26,11 @@
> >  #define LM3533_ALS_CHANNEL_LV_MIN    1
> >  #define LM3533_ALS_CHANNEL_LV_MAX    2
> >
> > +#define LM3533_REG_OUTPUT_CONF1                      0x10
> > +#define   OUTPUT_CONF1_SHIFT                 2
> > +#define   OUTPUT_LVLED_MASK                  0x3
> > +#define LM3533_REG_OUTPUT_CONF2                      0x11
> > +#define   OUTPUT_CONF2_SHIFT                 6
> >  #define LM3533_REG_CTRLBANK_BCONF_BASE               0x1b
> >  #define LM3533_REG_PATTERN_ENABLE            0x28
> >  #define LM3533_REG_PATTERN_LOW_TIME_BASE     0x71
> > @@ -54,6 +59,9 @@ struct lm3533_led {
> >       u32 max_current;
> >       u32 pwm;
> >
> > +     int num_leds;
> > +     u32 leds[LM3533_LVCTRLBANK_MAX];
> > +
> >       bool have_als;
> >  };
> >
> > @@ -622,8 +630,36 @@ static const struct attribute_group *lm3533_led_at=
tribute_groups[] =3D {
> >
> >  static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> > +     u32 output_cfg_shift =3D 0;
> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> >       int ret;
> >
> > +     if (led->num_leds) {
> > +             for (int i =3D 0; i < led->num_leds; i++) {
> > +                     if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > +                             continue;
> > +
> > +                     output_cfg_shift =3D led->leds[i] * 2;
> > +                     output_cfg_val |=3D led->id << output_cfg_shift;
> > +                     output_cfg_mask |=3D OUTPUT_LVLED_MASK << output_=
cfg_shift;
> > +             }
> > +
> > +             /* LVLED1, LVLED2 and LVLED3 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF1,
> > +                                      output_cfg_mask << OUTPUT_CONF1_=
SHIFT,
> > +                                      output_cfg_val << OUTPUT_CONF1_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* LVLED4 and LVLED5 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF2,
> > +                                      output_cfg_mask >> OUTPUT_CONF2_=
SHIFT,
> > +                                      output_cfg_val >> OUTPUT_CONF2_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       ret =3D lm3533_ctrlbank_set_max_current(&led->cb, led->max_curren=
t);
> >       if (ret)
> >               return ret;
> > @@ -698,6 +734,30 @@ static int lm3533_led_probe(struct platform_device=
 *pdev)
> >
> >       device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->=
pwm);
> >
> > +     /*
> > +      * If led-sources property is not set then either this Control Ba=
nk uses
> > +      * its default LVLED or is not linked to any LVLED at all.
> > +      */
> > +     led->num_leds =3D device_property_count_u32(&pdev->dev, "led-sour=
ces");
> > +     if (led->num_leds > LM3533_LVCTRLBANK_MAX) {
> > +             dev_err(&pdev->dev, "num of LED sources exceeds max %d: %=
d\n",
>
> "Number "
>
> > +                     LM3533_LVCTRLBANK_MAX, led->num_leds);
> > +             ret =3D -EINVAL;
> > +             goto err_deregister;
> > +     }
>
> Could we move the 'led-sources' parsing above led_classdev_register(),
> or convert the driver to devm_led_classdev_register() and use 'return
> dev_err_probe()' here?
>

I will convert to devm_led_classdev_register() as precursor to this patch.

> > +     if (led->num_leds < 0)
> > +             led->num_leds =3D 0;
> > +
> > +     if (led->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(&pdev->dev, "led-s=
ources",
> > +                                                  led->leds, led->num_=
leds);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to get led-sources\n"=
);
> > +                     goto err_deregister;
> > +             }
>
> dev_err_probe()
>
> > +     }
> > +
> >       ret =3D lm3533_led_setup(led);
> >       if (ret)
> >               goto err_deregister;
> > diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backli=
ght/lm3533_bl.c
> > index adcd6ac7cf229..e8164c8528577 100644
> > --- a/drivers/video/backlight/lm3533_bl.c
> > +++ b/drivers/video/backlight/lm3533_bl.c
> > @@ -7,6 +7,7 @@
> >   * Author: Johan Hovold <jhovold@gmail.com>
> >   */
> >
> > +#include <linux/bits.h>
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/platform_device.h>
> > @@ -21,6 +22,7 @@
> >  #define LM3533_HVCTRLBANK_COUNT              2
> >  #define LM3533_BL_MAX_BRIGHTNESS     255
> >
> > +#define LM3533_REG_OUTPUT_CONF1              0x10
> >  #define LM3533_REG_CTRLBANK_AB_BCONF 0x1a
> >  #define   CTRLBANK_AB_BCONF_ALS(n)   BIT(2 * (n))
> >  #define   CTRLBANK_AB_BCONF_MODE(n)  BIT(2 * (n) + 1)
> > @@ -35,6 +37,9 @@ struct lm3533_bl {
> >       u32 max_current;
> >       u32 pwm;
> >
> > +     int num_leds;
> > +     u32 led_strings[LM3533_HVCTRLBANK_COUNT];
> > +
> >       bool have_als;
> >       bool linear;
> >  };
> > @@ -236,6 +241,8 @@ static const struct attribute_group *lm3533_bl_attr=
ibute_groups[] =3D {
> >  static int lm3533_bl_setup(struct lm3533_bl *bl)
> >  {
> >       int ctrlbank =3D lm3533_bl_get_ctrlbank_id(bl);
> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> >       int ret;
> >
> >       ret =3D regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCO=
NF,
> > @@ -243,6 +250,21 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
> >       if (ret)
> >               return ret;
> >
> > +     if (bl->num_leds) {
> > +             for (int i =3D 0; i < bl->num_leds; i++) {
> > +                     if (bl->led_strings[i] >=3D LM3533_HVCTRLBANK_COU=
NT)
> > +                             continue;
> > +
> > +                     output_cfg_val |=3D ctrlbank << bl->led_strings[i=
];
> > +                     output_cfg_mask |=3D BIT(bl->led_strings[i]);
> > +             }
>
> This for loop doesn't need to be in the if statement.
>

It is in if statement because if node has no "led-sources"
LM3533_REG_OUTPUT_CONF1 should not be touched and must be left in its
default state.

> > +             ret =3D regmap_update_bits(bl->regmap, LM3533_REG_OUTPUT_=
CONF1,
> > +                                      output_cfg_mask, output_cfg_val)=
;
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       ret =3D lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current)=
;
> >       if (ret)
> >               return ret;
> > @@ -320,6 +342,29 @@ static int lm3533_bl_probe(struct platform_device =
*pdev)
> >
> >       device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->p=
wm);
> >
> > +     /*
> > +      * If led-sources property is not set then either this Control Ba=
nk uses
> > +      * its default HVLED or is not linked to any HVLED at all.
> > +      */
> > +     bl->num_leds =3D device_property_count_u32(&pdev->dev, "led-sourc=
es");
> > +     if (bl->num_leds > LM3533_HVCTRLBANK_COUNT) {
> > +             dev_err(&pdev->dev, "num of LED sources %d exceeds max %d=
\n",
> > +                     bl->num_leds, LM3533_HVCTRLBANK_COUNT);
> > +             return -EINVAL;
> > +     }
>
> dev_err_probe()
>
> > +
> > +     if (bl->num_leds < 0)
> > +             bl->num_leds =3D 0;
> > +
> > +     if (bl->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(&pdev->dev, "led-s=
ources",
> > +                                                  bl->led_strings,
> > +                                                  bl->num_leds);
> > +             if (ret)
> > +                     return dev_err_probe(&pdev->dev, ret,
> > +                                          "failed to get led-sources\n=
");
> > +     }
> > +
> >       ret =3D lm3533_bl_setup(bl);
> >       if (ret)
> >               return ret;
> > --
> > 2.53.0
> >
>

Other suggestions are valid, I will apply them in v3

> --
> Lee Jones
