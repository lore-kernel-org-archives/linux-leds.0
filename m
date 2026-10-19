Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEB48662D
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396331; cv=pass; b=dnykyHzzW+EGjHK+3lQjkTuu6pzBo55Cg5ZBijOTZjWo9qtH5zWSQwpekleSECr4sopIxOtMUyKTJh9EXNAzrS/Nm56CZsBvlBYo4MbPacfq6m9yiUk46GgOzN0Y1qwCDVRpGrARV0swKcQFBJcka1+RIqyQK4YvlL/ikMQkS34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396331; c=relaxed/simple;
	bh=kNfL/Hla6UKgQQwI6Gv8t1MIM+Kmznse6S3d1b1fzrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeMAn25DJb8k0kmprV9EXWR1v2tSusu5bGtLwNL8MGnlX0JH1QtBGZhx0B6StML4sKGg+rx+PhRymioYXCPmGnADPL6dCiromATyiw11JxltAWDNWS2ZUzTiO8/c8mbTp+x8Sfifh1mN5olnKEoDYS9QAMtrK6l4tLlfBjY5ttE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slNSKdhz; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slNSKdhz"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1752716d50.1
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 00:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792396329; cv=none;
        d=google.com; s=arc-20260327;
        b=r/A3M1KdWL2zPfAAfMb+pebEIPD07PJbrpJ2cyWYUeR4ZERaQPVfR/vjWQ75oVigtx
         QGzVRwTTlp5YhdTZFxeYiyC6Ji1p8lkCiS1UXzsoefn2T0pWUHE+7gztr4npbBTyGPfJ
         te3iwQp49NJsm6viNa0neMyTwgFznG3BJ6oOmXcxKrBu+mzz2LqQwTHuTN1/Mj3Odtzi
         Z13m3gCO8qMJ6OMi9qervL8Xv1vef6WxqxCgfylYccNbsxEF8V/xr4jdPyvOPr/vvqxj
         5KrTN7xX1ALUPPSYG45EN/65rw+6ZQr+KLt4EYdSRqsDA2ZiMXHP0iVsIeqJNDyXOjrO
         JdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        fh=hASzGq9LJpQHyfxUOQjcrBbf3FNFjzdkHtEmXLdqMKo=;
        b=FHhi6Cu1NbOhZP7lMXxgN9J+o+FJS3XyNSXVMZPMYvOK/2oeyn/RDKJV3YnBA2eeQ2
         gUIqQmc5RdyADry/fmbJzAyfrWwhfft5+ETuRGARlcI+r6g4FXvmP85zB5tP6E93PA4M
         Zt45/K7Zl6We4v77S0sBQgKRfgQ4P4fz/C5ph9fpEUrr7YoXZKt6rMOecySaWPL1Hp0X
         TLUaqQjO8Ue7/tePTNTjWgqsJaWbv39J8DcjrN1A1CN21Oa0qUwto150PzVh9hn1564s
         aAbVByEqSu5vjY0fQMZN6M9VmMj8O9CqFXmSkA8VWTgeGfBDPvtRdGWvcmCC7nDHYa86
         6V3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396329; x=1793001129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        b=slNSKdhzQDufNI/CyemCuLFkbABnOforDaBTNQIcdaxAv+mxfH28l5VPAToHuJOMMk
         RpQ+aWioG4md3ZFfkeWgnCBx0TlHwrM/kVh1CfaTqXWDlDpQTHPdra4NflzVqS9YtnEw
         eM/N3W4Ci3CrGgQj9RltcSNe6UI5Zct7+a57xSNQdmE0vxqtjuSVWec2qncPFa1UCWXH
         K8Xr+DnZQyqpRpr0WBdboItoqpJLaiJbifWCB0iTPTtgyuqAKxXX6QjcZdpKA2tLlhPL
         B6KPw5idkZqLk/XooROxf1J4fuvvVsqFEk/aT3axrz70RosIljgrqdFQmbLHI3TE/KGg
         EOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396329; x=1793001129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        b=vXGcQW5YJtF9U4CddiJ+03QjDLFIVGka/jvL6Uav9dByknNl50o4+6/iouC+jVAx3w
         3ZoAvxN1UR7M0goBlu8D7/roEZ9QwvCXFDrjI8ihe3qf2wIeIfxrgY/XI/s/Nm5h0p1S
         yQQ61lOsanRaLyzzUdJY56T/WSE5HmHCyuA43Qkasuu+59rULMLhJRdNnCKam5qzbliu
         rVIYaWfq9ubcsCnY4vhJvb5UX1vvwwcBqYBPtHNjh3PZTO+KqKsCR2PxjmhNzNHqLA8n
         XNFGEyd+nhukVvU8sr7EGQ+//b1iU4MLccJv/Z4Ox0lKJr6aDHFZpVWKfmQBK841Eyl5
         5gLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+WuvEN8ANKRwdPSENKBaOPxTpO16z98Jq3ynX7ebMSglK9L2brlt7GW94GJPVHQkyHT9pkdOrydF/@vger.kernel.org
X-Gm-Message-State: AFq9FYLPoxQgyMMXMHAn+vwjlcU02D4BbLgQRC8dFhnqcXi7YX9+myqn
	PVe51oz/xVoVvlzdptd4sgn7bAlazi/zixhF0Aa+N2BtgfjXQdB4SQMm4E1aSYj8BxXQFFZ5Pn3
	0Ew/FSLC/R4KnZcZznXB6/iZreV3SAMA=
X-Gm-Gg: AYBFou0ZZxgVdQVnx0YyaHHx/n/djjL9csDJfMO/bVOYVotpRLzX36qrn5zPnXEEdFY
	GFXj0y4+6RyRy+IRn/a+dEx37FsYDtrvZ4OieJ71oGfbxRwSnUFM1/fjxILEN2BOShRH+sD1cG2
	hCt1BzJHRAFO9kr1m3Hu/McjuwymcrTYh/sVFRTPJKfvxcAsJDSZlA9W8iisJbfYHGENGMAtHJr
	nVuz8gcy2fdNfVLKU07nEW9ssTh3BHrygP04oAtCGkjjywCYoEIxJUzsgjDhTwqsVyh6ixAHdUa
	vhu2cOwYPOwyVvwO+jbk+ue0cuAPjf0VFQW8SdKopQblLp/RztyLoAZkQtRtZ9IGAd6ByaPj/Dc
	gt4I97VEjPFClG+hUbGYu2rHijmmCQPqfDr0FegEvZbmAmXhFI90DCHT2gnY0ZEJ7sknk+RmSV1
	++T3jPZg==
X-Received: by 2002:a05:690e:12c4:b0:677:cccf:445f with SMTP id
 956f58d0204a3-679ca7ca9e3mr2034762d50.46.1792396328411; Mon, 19 Oct 2026
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com> <20261016162912.64581-2-lukapanio@gmail.com>
 <20261019-yak-of-subtle-protection-8ed0da@quoll>
In-Reply-To: <20261019-yak-of-subtle-protection-8ed0da@quoll>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 09:51:57 +0200
X-Gm-Features: AclHuK_A1TQjZsCV3MVlGkJ8tdfOzXTmuHWmMEHG7bKSsC6HnztuOLMJSgs52SY
Message-ID: <CACi=Ov5C9xuFvaYTcPapc=DzCFqrKng-V53voFHGWptvvs8c1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99703 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Oct 19, 2026 at 9:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 16, 2026 at 06:29:11PM +0200, Luka Panio wrote:
> > +  awinic,iled-max-microamp:
> > +    description:
> > +      Full-scale current of each LED string, reached at the maximum
> > +      brightness code (and 100% PWM duty cycle if PWM dimming is used)=
.
> > +    minimum: 4800
> > +    maximum: 29600
> > +    multipleOf: 800
> > +    default: 20000
> > +
> > +  awinic,ramp-on-time-us:
> > +    description: Current sink ramp-up time when leaving standby.
> > +    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
> > +           256000, 512000, 1024000, 2048000, 4096000, 8192000, 1638400=
0]
> > +    default: 8000
> > +
> > +  awinic,ramp-off-time-us:
> > +    description: Current sink ramp-down time when entering standby.
> > +    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
> > +           256000, 512000, 1024000, 2048000, 4096000, 8192000, 1638400=
0]
> > +    default: 8000
> > +
> > +  awinic,pwm-trans-time-ms:
> > +    description:
> > +      Transition time between brightness levels set by the PWM input,
> > +      for a change over the full duty cycle range.
> > +    enum: [2, 4, 8, 16, 32, 64, 128, 256]
> > +    default: 2
>
> Feels like you are re-implementing triggers. Several properties actually
> feel duplicating standard LED ones.
>
Thanks for the review. Agreed, the ramp/transition timings and the
mapping mode are not really hardware descriptions. In v2
I'll drop them and leave the chip defaults, and switch to the standard
led-sources and led-max-microamp properties instead of
awinic,led-strings and awinic,iled-max-microamp.

> > +
> > +  awinic,i2c-trans-time-ms:
> > +    description:
> > +      Fixed transition time between brightness levels set over I2C,
> > +      independent of the size of the change. When absent the brightnes=
s
> > +      ramps with a fixed slope of 1 us per brightness code instead.
> > +    enum: [128, 192, 256, 320, 384, 448, 512, 576, 640, 768, 1024, 128=
0,
> > +           1536, 2560, 4096]
>
> Best regards,
> Krzysztof
>
Thanks,
Luka
