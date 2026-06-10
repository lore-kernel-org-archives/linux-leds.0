Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D8220F2A
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102742; cv=pass; b=rvpDMckVYft2I5cqldcDYoZ6h0AL+jFmYrgmzzENaBIVXBig5diZcM/6TuSpuErbT/r8XdVUSfJwV5pnZPBpDonvKBLITBf9oWSVssTBT+CXomLzzoJENcvB9C9Qle1lAJKARCj+4p9GJyYrsE2G5POxhg/9k2594wbu3ndc6MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102742; c=relaxed/simple;
	bh=GswxPypzPfEQ3WUnspGh8ax+2FMG/mXlBTk2AXjL34M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy8GvSYQqAslZWkNw/1ByHNWZEBlQ0ozArkdzsAU4yfMqCOiXDHSDBBQ6b0XPIc661utIUK8ohY3AWv9dwFldjIiSe9kra1Dq2AXiV7vhTU3FlVEmjerN6sPj5kL2v/yx5HULrRigCnPD99FZ3ugQ5Mr8cAN06BkU/E2fnubkLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS+V+z/l; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS+V+z/l"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso1752226eec.0
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 07:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102740; cv=none;
        d=google.com; s=arc-20240605;
        b=cjOtaKYp5nBGH99UN2s75UIaeIW/2QJ1/QQRvvAWtMSev7SLID2Fb0dq7A4yvPlwPL
         eb9O0xaFPQ50jEdvXZLC0KTFO4xte7dAAvSfcR8o+//GCVuUGnbeGUprtuQ0WC1zCuQC
         IeRFOo8PKebiptqGDcUIsEf3dn+cKrb2o2qJ0mrcQ6LHM9kArrrZbxlvzT3xkynaEULy
         EkhoaMyqD1HyoynW/OhBVtz3JDzuOGt4x/yERODfOe5QCcS/0AMG3Q63JOGB9HEi7RfI
         FJQ88Oje0Cixiwlwl/trqTuVH+G/ovJpurh1xPmV2My+5ohH04+gogd8IzuCRFVAakP9
         2luQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        fh=CBvdISTYb/7xacstn+XIxu1SFY0RzrcCcCw07/QDJ40=;
        b=EcHS+dnHUd4LOqwP3ZhWJh13PyOsWq7X/RpjG6qohUGF765LoJ9b6xYtHCaaoHAnEq
         p/pOQ95CklBgWF9Elk3q9gtggruzi3zL9FNClXeopLihPOJq1KwIXZmu7YeJq4nsm6Fp
         PC7Fv2/KpW3XesHCeKf+qjIz7tfKFczDrC+aEpGt8NYPqfbwLwla8P9f5NTH4Ht1erlR
         IS3JsDaGhDDOKst01LARXkxmO/xRDzbxW31VpZZB4OUxAbPr1OMXWZDujNfYAf2vgKrK
         tp063gKgHaAw5RNbUywF5qqbVwvhEX7wNyf+YvaFI4Y38CLVXb9zqFyk0TlUmfXXOM+K
         sjLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102740; x=1781707540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        b=PS+V+z/lvGHsNMiNLqAsuwXOJkGXmiJ7LdnOhP8LK5ZZ9ZfeboGuHxsVDIoBJsGeST
         qNCto5PN+wb7quOFQQdpV0kU4Hu+YaoYXZVqPMUurk6HluuoWyOPymeXxzolPkocYUDi
         EwsWfEFqo2XSpWWX6Cu3HFv3RqI2SdG0afwCDT3XMDVcNs6XGHQMbZZmqaCDuX5eWFrL
         N8ewC4XeYxBO9tSOG2FAnC2X43MxtriY0lh9PedRNcZ0ghV2JV4L2BiKDAq4fkJLKD57
         ghmcWTg4mfbxLje27RUG6Uu4P33Mr8oUt0b858zMNFeohBFYIPUxGY55huG86dzO6Thl
         ZSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102740; x=1781707540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        b=eOLo6L7Gf1n6BaTuAUFcQDB6cmJgSCgtrK1KmAoqZCoOYaUijchZUVp127XrQuYnek
         6/lL8fGz7sGuiVeMwD6VzVNqWN6DpUTcBpFsBBxVise78BBltaL/vJMFnYfivNGd7qt6
         xiiLpUWsly+ZzMXWWeG0/szdMBdKWO+Ktl5i3WiBMGicKvDZ1Lty+Bllj/mp2pz+Ek/+
         fOUkiry1DAr2JplmgzCyb10JfbTY8PmRp0oNGVvz6n7nUceWNwt9t3J/Z8OYy5zHmulj
         xJzgDNGD6+nlf0IFMWX4Nm8pqthFMlNLppSXuDKjlaInTk49G+EVOuv2LTs4taEs141o
         Fq8w==
X-Forwarded-Encrypted: i=1; AFNElJ+0cd17N/jYa2GoryD1m9BsMjOf7MvXsIeaZfmE+K7mxwE3OOERNpDMk5Nv+quJX8eCta/bxkD7sptw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhya6bG247FPiEyUnU8j1f0CMzCFHNGZ1AmbbUy/DwEQ4VMeNq
	zMb5npgGf+udgGzltBysGM2sIufBEjGlrgL3fwrdB1bmUJD29fJT8AvTCyPFUKA/1gKuX8VztrJ
	SQyVHu9qyYzth6LCYyAdZph9v8e6JTxA=
X-Gm-Gg: Acq92OEtICBf/7rZfuD1BFDd3xz8w5YliEZQIGnndU3/0IKX7t4fADL/+c9GVB/wxqC
	XA0gwG1qgm3KhtHjnQuLHwHt8/h7UtqqLI0zuiP+Z1lsDfo5EHSctd+MUI+HJwiNW6R3Kag8e2e
	vxaelOErqRwCO0DMZgKeI560CdThLvhlrUu/UKUDpYFTZ6gA/GbcbfhOIufRijKHFQ2ySc/w14S
	hJNC1n3Yeit6kIxmrTnSZL5uBwcvvsaG+hni0r4vme5nk/cFroq7Fk109RL3l0uaopeYSMgYfmd
	5UbPLg22GC0HVIUyKds=
X-Received: by 2002:a05:7300:4307:b0:2ce:3aa1:d39b with SMTP id
 5a478bee46e88-3077b1e1921mr16407205eec.20.1781102739833; Wed, 10 Jun 2026
 07:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-15-clamor95@gmail.com>
 <aihoH9Pmzufa9pnE@ashevche-desk.local>
In-Reply-To: <aihoH9Pmzufa9pnE@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:45:28 +0300
X-Gm-Features: AVVi8CdnB8ApS2xg5kxxnd98RqCsR1fmVPgPcGfJlrd3mQBMI1CAmZLqR9DFIrc
Message-ID: <CAPVz0n0m+i7wexfC0BWwvdOuJxDk_=x+EpxEbNmoHN1AsEmfNg@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] video: leds: backlight: lm3533: Support getting
 LED sources from DT
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:23=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:38AM +0300, Svyatoslav Ryhel wrote:
> > Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> > defined in the device tree.
>
> ...
>
> >  static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> > -     int ret;
> > +     u32 output_cfg_shift =3D 0;
>
> No need to assign the default to this.
>

This is a personal preference, compiler will optimize it if this is not nee=
ded.

> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> > +     int ret, i;
>
> No need to add 'i'.
>

This is personal preference as well. There is no strict rule that
iteration variable must be defined strictly in the for loop.

> > +     if (led->num_leds) {
> > +             for (i =3D 0; i < led->num_leds; i++) {
>
>                 for (unsigned int i =3D 0; i < led->num_leds; i++) {
>
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
>
> ...
>
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
> > +     }
>
> This and other pieces may benefit from local variable
>
>         struct device *dev =3D &pdev->dev;
>
> defined at the top of the function.
>

Yes, but this would require an additional patch, which I will not add
to this already overinflated series.

> ...
>
> >  static int lm3533_bl_setup(struct lm3533_bl *bl)
>
> As per above.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
