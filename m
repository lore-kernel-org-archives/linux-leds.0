Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696381;
	b=h3cK6yRH/+GPi772Wo9u+mPXQnoDQUgwnjJOzHl2NXaMpNttIoUDm8juQlNx4lN0J6iy
	 gIwDHDfNV6FF1X5STcTyp3+vIwNpP0kttA55mO+D3RjWzg7s3Mxhvr6wjL0Ro3kDYeY/z
	 Vg6Xrj02gxwQvvKLTNcJBTh0ruELi63D3VbvXjDcJb6UbztOLVTk3Hi/tqCzHjQ+mIwQS
	 nIbeLrlos1HcA7zIgmTKvhtIa7YLUe/XSLXFDP1D+OlyXtgPL/tsZ2yozdfWW/3Um1Yvr
	 ve/qxAmcTutJaSGwqQPWGBfsF4F4+8J3SNKd3HLbdouoFeMZzJ+pCEOh74s5jbHNhrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
	b=AH7iG1LPALlVhXJ0cGZvzhfnUL9CQEGijJl87oeURWq+sQMUmEvIGSl0vFWhnsXO0eYi
	 /emb0Ic9hqvLAC5wIt8UVCLmws/7LdIrejZ1t7iimnKNNTYg3o2wwjMOzIN4W0hBI5zj8
	 y/JmMFqXxcMadBhXXUtAfkEiapXkF4o91II4VFG7QGk7zElpZI/noHPkc1L4cv0DaYfQW
	 NO4xewblJ+Xj6xijBN5/QN/9uuv9++kwp9MBDrwjNdrSisAFou8fMEf3TlZID78BPAgfj
	 uenH9Tg8b16X9lwsqvSod6xiHw/e5hFxtONQsRla2cX13IVBGq32kdzGxPiWrv8q9Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kwuo52H8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FDF606A31C
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 12:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1FDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kwuo52H8
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38431138772so9021538eec.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 04:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795696380; cv=none;
        d=google.com; s=arc-20260327;
        b=O5WU4Szb/qNTMmCwzgAgPC2L3ASW7m+kN3aQtqdLik4/BpP99sk62SidPmrFImOLPA
         GU5fN26jZhM+Moa+HVWa/Hf1MLQQ8ON80JW/ZuE64G1ux/eHU74ZW/W71jucHrdpBsaG
         2IYs69gwxV/Ck1OtllTjX+elFO9eHQpq+HqWqyMN3n9p/q4u2VWqdZ56HHKOlaV4DgK4
         KsXVA/C33fqUK9lZNekCygXLCZYT+Xlt/80vG3/JZLPbqAWYZKncXS4C7fc2TU5e86yr
         jwfhGsvCNCOIv/2tDiX9fIhbah3mJWJVjR+Ux4maB+pR/jDlV4OmekGll0C30iDlaQK9
         GMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
        fh=PHXhe5mYh7ErO/hOUnBxbC8kbZob9RmS5y055ofUC68=;
        b=TgvYjDOozC1f+cqOCFxjiZVJuVK/9BLN9OssoYTvSdCduSPnVnZsvlfzRt17XXm4mU
         z7y9T2rB+blYtZ1v+xH4+3dOv5HDytRnTCWDwN5+G7Wr8XcmTnPYoE+w/yUkAGXwUdk2
         Ds4DNt+TGz5dAiv3FzMcpfeFLwOphm/rbg6GP4zFy+5Lz7YUjOme/JGI9KNHKEbVgZJ/
         1YFA0h8QEg4AUBQgEv53Dd+X7g13ZLJwl0oxlaS/A7aYG4mwAe/S2h9YdNUeXBxvrnrT
         jkxlb8dxg0RKtvKj+fpTnL1MFf2NoSZHH3BsqVZgJLz97GJWbRAjw++z5A/z76uQp0ZE
         1zTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696380; x=1796301180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
        b=Kwuo52H8cNDbabrZS0nn/S/hu+yvXnC3SCGPcZxUa8Xsij5I7NOdnPBXUGHY6YjxxN
         Wg3xNXgK+1JdpgOD1nL46zZ1EAMri/965h+nZMunr7BGuYBTsy9DURJNSwzwp9ykYoPv
         EZYNPLau0NmiudjSpE7oyysQo4OdGU8LeJXzUGGq1DIAARDXDrYMR3Qh5+feoMIfs9Kt
         3ve1XqcwsBs+ONpTs7FTKPO6rwfcYuycLKrASAkVu02WTHT4U4i32RvMYYzFHX2dNn14
         bAhjdgP/UIGvHInzSHKOP/6TwjYiPvOGTjWFBR42QJJWszYumxEDeWLZAkjvRivGnCMo
         8rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696380; x=1796301180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a82Xu3Ap01oB5zC1g+9yPaWAXUDVFqvsJpL5pn/9wt4=;
        b=Rn/2siqFeJpRM2xNYgbr0xykKvqSaav6k+3DMh03AHOo77kpuIwC/RsHWdfgXEvEEw
         1Gh6d4X2scWEKVbCL35+0PdxfuDwBFFi73nGNn3pZSCWDVm5/po0dHWr5yL0oP9UKGVl
         JUqXcdTU6zi7yTHcMLC+DOJSWB935HBxuAUcuvZND5PGAcOT3TAO3egfgehbvZ/1RGPU
         Ui2zb4exbdqIuLP4mbq1tyuVwrJSmlRMdSL5dfHsiHcMr/3/nO1q6OPQntEouPTYQ86f
         w4IIDLTG6kS1VL1dThNcWdJI0u3kA8sKrQ9w0Gp2usl7L9bHkb+oCHMQ/SwK+cRMENgF
         z6cQ==
X-Forwarded-Encrypted: i=1; AL+hErHiZUHsVThGaAZH1WcFuVmq6+ed1MarX7ZUOTsMuzcC/+aFzHbr9hBNTFV/m3Ab9//18NNkvQalLxam@vger.kernel.org
X-Gm-Message-State: APuU4Z8rShvZqQUz4BD35vgrKSILH9JVXQ+wXy9NrZHK/wjxvcHYU7mF
	iP91x2XpojMY5hUdQekMFFqpBVpl+qOXTAN6WSjUk5IZLwFgQWBN98uwcE5ZZDhjIQy+9TavwVI
	NQnKZM+HG7OP45Gw0p40+mni5PSuPDO0=
X-Gm-Gg: AZFdTZfcXDQAjmSkEoZWfO5Z1yS3pZL0nqT5cuQqzYHQY3+FPlk9MBCpjaEdIIV2C8C
	OscEO/kpeMrzx/AgF2ZstC0JpclVCtSOEHrki2MC12TfuJn4cCObJ5MoSsaDauxmxzEJpE6bCFv
	oC+ifhIyEqoVVesHVsRbyzdhEhOgqKujU+927iS/D4PyF8OPSocobXXQ4UpPZZV+OP07Ao+53sW
	isXfaBd69PuznQoYIxW7uFLMNZH1IJ1eDXXLzQd2iP7nv14d/2lDRFhr2BIAH8jOz9CEeu9Xo6h
	h+NUtLtBDl4p9Wfy5GGeQU+HwEesKLYkST3fcFUgSQ+VdJVgEraJb8wkILYX27yKclbAt6WX8BY
	KFau+Ap/g18wP08gsukg69BP8Uv2hwsVji6v+BKEy2VTjWfnY72pnf+SSvEOTPao1nNDM9lV1CC
	oOgnTVyyKXzbXS0AuiwEgRomn0T+KiK0g=
X-Received: by 2002:a05:693c:4143:10b0:36a:1f4f:3e9 with SMTP id
 5a478bee46e88-386b1067bf5mr14067545eec.20.1795696379819; Thu, 26 Nov 2026
 04:32:59 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115084347.70592-1-clamor95@gmail.com> <20261115084347.70592-3-clamor95@gmail.com>
 <179510281165.63755.6096974058338821986@kernel.org>
In-Reply-To: <179510281165.63755.6096974058338821986@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:32:46 +0200
X-Gm-Features: Aa3M54ooZHwa1yjqqwCLWy7pCcfJ2o9UO-Q8qrvTvCJeca418nn2atFKExuddxs
Message-ID: <CAPVz0n3abYU7BfjcXPb-tZOpw0UbsKS2WTVYqCZhrm_4biH3UA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] leds: lm3533: Support getting LED sources from DT
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
3 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > Add support for the standard `led-sources` device tree property to
> > configure the mapping between control banks and physical low-voltage LE=
D
> > (LVLED) outputs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/leds/leds-lm3533.c | 57 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> > index 7db1105bee5c2..ad8bc3751e3e5 100644
> > --- a/drivers/leds/leds-lm3533.c
> > +++ b/drivers/leds/leds-lm3533.c
> > @@ -26,6 +26,14 @@
> >  #define LM3533_ALS_CHANNEL_LV_MIN    1
> >  #define LM3533_ALS_CHANNEL_LV_MAX    2
> >
> > +#define LM3533_REG_OUTPUT_CONF1                      0x10
> > +#define   OUTPUT_CONF1_SHIFT                 2
> > +#define   OUTPUT_LVLED_MASK                  0x3
> > +#define   OUTPUT_CONF1_PREP(x)                       (((x) << OUTPUT_C=
ONF1_SHIFT) & 0xff)
> > +#define LM3533_REG_OUTPUT_CONF2                      0x11
> > +#define   OUTPUT_CONF2_SHIFT                 6
> > +#define   OUTPUT_CONF2_PREP(x)                       (((x) >> OUTPUT_C=
ONF2_SHIFT) & 0xff)
> > +
> >  #define LM3533_REG_CTRLBANK_BCONF_BASE               0x1b
> >  #define LM3533_REG_PATTERN_ENABLE            0x28
> >  #define LM3533_REG_PATTERN_LOW_TIME_BASE     0x71
> > @@ -54,6 +62,9 @@ struct lm3533_led {
> >       u32 max_current;
> >       u32 pwm;
> >
> > +     int num_leds;
> > +     u32 leds[LM3533_LVCTRLBANK_MAX];
>
> Since LM3533_LVCTRLBANK_MAX is 5 (matching the maximum control bank ID)
> and there are 4 low-voltage LEDs, shouldn't this array size and the
> bounds checks below use LM3533_LVCTRLBANK_COUNT (4) instead?
>

No, leds are referring to number of LVLED, and there are 5 of those.

> Also, are 'num_leds' and 'leds' used anywhere after probe()?  If they
> are only consumed by lm3533_led_setup(), could they live on the stack
> instead of here?
>

and in lm3533_led_setup() which means that I have to pass there leds,
num_leds and lm3533_led itself

> > +
> >       bool have_als;
> >  };
> >
> > @@ -622,8 +633,36 @@ static const struct attribute_group *lm3533_led_at=
tribute_groups[] =3D {
> >
> >  static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> > +     u32 output_cfg_shift =3D 0;
> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> >       int ret;
> >
> > +     for (int i =3D 0; i < led->num_leds; i++) {
> > +             if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > +                     continue;
>
> If an out-of-range source index is provided in DeviceTree, shouldn't we
> fail probe() with -EINVAL rather than silently ignoring it?  Note that
> with LM3533_LVCTRLBANK_MAX (5), an index of 4 would pass this check and
> corrupt bits 4:5 (HVLED2) of LM3533_REG_OUTPUT_CONF2.
>

How index 4 will corrupt bits 4:5?

> > +
> > +             output_cfg_shift =3D led->leds[i] * 2;
> > +             output_cfg_val |=3D led->id << output_cfg_shift;
> > +             output_cfg_mask |=3D OUTPUT_LVLED_MASK << output_cfg_shif=
t;
> > +     }
> > +
> > +     if (led->num_leds) {
> > +             /* LVLED1, LVLED2 and LVLED3 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF1,
> > +                                      OUTPUT_CONF1_PREP(output_cfg_mas=
k),
> > +                                      OUTPUT_CONF1_PREP(output_cfg_val=
));
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* LVLED4 and LVLED5 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF2,
> > +                                      OUTPUT_CONF2_PREP(output_cfg_mas=
k),
> > +                                      OUTPUT_CONF2_PREP(output_cfg_val=
));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >       ret =3D lm3533_ctrlbank_set_max_current(&led->cb, led->max_curren=
t);
> >       if (ret)
> >               return ret;
> > @@ -690,6 +729,24 @@ static int lm3533_led_probe(struct platform_device=
 *pdev)
> >
> >       device_property_read_u32(dev, "ti,pwm-config-mask", &led->pwm);
> >
> > +     /*
> > +      * If led-sources property is not set then either this Control Ba=
nk uses
> > +      * its default LVLED or is not linked to any LVLED at all.
> > +      */
> > +     led->num_leds =3D device_property_count_u32(dev, "led-sources");
> > +     if (led->num_leds > LM3533_LVCTRLBANK_MAX)
> > +             return dev_err_probe(dev, -EINVAL, "Number of LED sources=
 exceeds max %d: %d\n",
> > +                                  LM3533_LVCTRLBANK_MAX, led->num_leds=
);
> > +
> > +     if (led->num_leds < 0)
> > +             led->num_leds =3D 0;
> > +
> > +     if (led->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(dev, "led-sources"=
, led->leds, led->num_leds);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret, "Failed to get led=
-sources\n");
> > +     }
> > +
> >       ret =3D lm3533_led_setup(led);
> >       if (ret)
> >               return ret;
> > --
> > 2.53.0
> >
> >
>
> --
> Lee Jones
