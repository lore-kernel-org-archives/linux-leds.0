Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A74F393F
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412667; cv=none; b=UXGdueC/1sdaSsRkzbJq/h0tAD0jjrvslKXP7krEId25rHz3b0CVHQ7Cnz8iq3/4fg+I9PKddudRRgzi5vtfDrOWt9iOjStmafgVXObOr0JxgB2ecSH3cTkVzvZyUXII03YeeMG17fXSTIyRFwavHvCjRgjBXWgaX3kR4HshLpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412667; c=relaxed/simple;
	bh=wd28aU++NdtOMWUJjRpk6EgNkx6fD22f8iP3kR6CsIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPxTZe5BxQcG2E51gQBoHHaWgOGPGO5hSAxCDDtN0D0AJ0AJMvGzO7s9QrU6wT0lfdDBEFBcQsb7J0USvypzb73/rC79VY2Ba3+AFteRG3WYQTGQLZcwDgtt3xC1uE0b1RYqtfkdMDiiV6cD1k7w6jnvaS3RyPJFk/gYBrginBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JUXP5CJy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JUXP5CJy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso1507525e9.1
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792412662; x=1793017462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nCKEluHSWIFV51AHkRVTAd1QNSpPxxkrgvIjhQ5PXZk=;
        b=JUXP5CJyrMMjFmxa6xvURwQ3HJqNbCgVeoE9kApk/C3I8HLhyl6yflZvAtMPXTbAbq
         PZmVdIkjgqkqPo4RBL3iXj4+Gv2vfkhp8mEoTc33nuYx/hC6QXCdrRdFdxYQiAp6RAU7
         litVm9pJum2csacPR5Zeg6plHlt+ugelXA5+PbJRS63T3gFZ6csA36ec4bpqXebWJwBd
         /g8y/2cG9NKDw2mWEwo+Ctcx7a2skfoul49FHdgE2SthiXa/M1Rozb9lLYr8z9tqOtHB
         77rDdIM6UWUgYOc2WCdMXwRd4LIffiEiFux2eOgCF167Foas27W9/Py+bOht9IgfvYL7
         +EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412662; x=1793017462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCKEluHSWIFV51AHkRVTAd1QNSpPxxkrgvIjhQ5PXZk=;
        b=uNZUGqxZeulf1dGoaiZ9g32tv8/Cp0OvvQPaNwRmCRRp7hJ4o70xQtIM0LdJXOjgGf
         9stPW0wLvMdVJDhoZ/nuIHhbFrywuTEEyVgFfANZO2urPDGPEuanLnLOodAsv2l2Lxur
         ZAEhddehPFSFSeTG/FNmUNEF9D14gTy3nEAvbF5raeQ7zf3eDVo3HrU2fPq6iS+ZNJ61
         c4pzfHOckGRwph8Iu6j0TutonBZs7DGigICho0Iq+gciEuotmJIRHMXvmWqAWPzsU8wn
         /qLV3i7SvBjklMfXP6SNCeOToYP3TCAQkdYIIF6COpndlZrccGXdwdAeRdaDqIYKt5RG
         xe9Q==
X-Forwarded-Encrypted: i=1; AKwUvBztJoxwKaAnqQlezBSBVxydTJFgIxHnLZb24Oc/G2jx1jNKZvjtpgibYcwFkbcDim2Da66Kf0u0WTBh@vger.kernel.org
X-Gm-Message-State: AFq9FYLXWG9ZYt4jJn54k7fBoex09kxyvh9AlhYlZexKPUXx4O+Y4X9P
	boy366PNu3jePdvMWj+OxeAPKlz1u04ajFphY2aOFxa90cOhNEMQn0upnNyEE/IeuhQPEUfV5b+
	i0zv1
X-Gm-Gg: AYBFou1GSIVkFzJcxx8vY53i9fFatEUCAENub85+Fur7f/VL77JtFMut62j70jp2kCW
	X5IqQ5f5M19Wg+QijmhEwwu8k5H0GnTnn74LKCWSVhevR/GGsSFf1OTBn6XFTWEuesyjDY1J8SC
	Hr5dFHwRxBFyFzjezOInA09d+izfE3yVAFZQ+amiH64A3JuRMpVZe3RpBzqzPDabhe1aVQV885g
	OcwiXmQV7yGDyq7Q36cq77T1amocqMJWCLC5iRxPW2AeD1QN2Qhmr8CDvfIb9PzUp6DSYpBDEpm
	E7ralKRpGv8X/1ijp/5usFoSW342k1rSKZ62cJcfpAYWgYoIISBkuY5ukS1msGrHl6pzS3y18RV
	Wx6P2zB13ACd6T1Apn25JOtdUZh075+AElMEMdhJM4DSL006FA9lOxiqAZ9J3vttul/bRWjbwV/
	4iILEealAWAYIyLOnoiPlE7B0Az8cZ9tLnVZvx6OWobRTJWHH9MyAiYGqykZVqSPdHxlPeyphgg
	5dd02ju5L+FirFbMeS7j+I7UAHbQDV1gYF5s0KYpNm/bCSKXPM1TGCWshhBofDMwXZJ/JHETbWY
	jrUE6U4hHwXwOS8OmqyNuUYy62pTGGj464B85QqBNvWOcZVUuKp0e0oq8wc=
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr161218185e9.14.1792412661854;
        Mon, 19 Oct 2026 05:24:21 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc8ee409sm284385915e9.13.2026.10.19.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:24:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:24:18 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Luka Panio <lukapanio@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, deller@gmx.de, krzk@kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, junjie.cao@linux.dev,
	mitltlatltl@gmail.com
Subject: Re: [PATCH 0/2] backlight: Add Awinic AW99703 driver
Message-ID: <atYL8jLQmljt3ypQ@aspen.lan>
References: <20261016162912.64581-1-lukapanio@gmail.com>
 <CACi=Ov6Jg5eUxskBbmtWOS03jta90RK0nByhWf4EQs1PNhvuKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACi=Ov6Jg5eUxskBbmtWOS03jta90RK0nByhWf4EQs1PNhvuKQ@mail.gmail.com>

On Mon, Oct 19, 2026 at 01:26:21PM +0200, Luka Panio wrote:
> Hi Daniel, Krzysztof,
>
> Thanks for the reviews. Before reworking this for v2 I'd like to agree
> on the approach.
>
> Following Daniel's suggestion I'll add AW99703 support to the aw99706
> driver using per-chip data instead of adding a new driver. The register
> maps differ almost entirely, so most of the DT properties stay
> per-chip (dim-mode/UVLO/ramp-ctl on AW99706, OVP/OCP/inductor on
> AW99703).
>
> Following Krzysztof's review, the AW99703 binding will drop the
> ramp/transition timing and mapping properties and use the standard
> led-sources and led-max-microamp properties.
>
> That leaves the one common property, the maximum LED current,
> spelled differently in a single driver: awinic,iled-max-microamp for
> AW99706 and led-max-microamp for AW99703. To avoid that I'd like to:
>
>   - add led-max-microamp to awinic,aw99706.yaml and mark
>     awinic,iled-max-microamp as deprecated
>   - have the driver read led-max-microamp for both chips, falling back
>     to awinic,iled-max-microamp on AW99706 so existing DTs keep working
>
> Does that sound acceptable?

IIUC you plan to improve the binding for AW99706 before adding AW99703
support, and you will keep the old DT property working to that
existing DTBs continue to work?

Both sound good to me.


Daniel.
