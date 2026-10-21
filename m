Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792548641;
	b=MBnC5t2guSO3he4Xk5dK0C/d0HaZU3lUNP1yvupnzz2pcJjWdsGYq2ZPe0Wgf3NqikxL
	 SRkJ9ShS3keT1CT7yddbpOU0tIHwFwQETw/3wTBFlLC8LrknjxoqCFdjRvOX7I/St4CRu
	 zD+D8Cex5ZBtKszk03j7PKbXVb1F2nrJ7WdvdWXYln4amOJSc0ULzGatzA8oxj7U9aM2B
	 RjJKm4kt1ol0GpvftKshf10rKG4D7cTS28PGH4SJKTlq12gUOTef49SY/RotLPzVIedJv
	 xTdsDeB25kw6dRnjrhJImxbXXiUD0KAYo/HmmDFqWhchYen4jKju5Jc5PDqDQe84iMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
	b=RbzxCHtlyP+ctzL1803GWrIXetndwvPmkQQCgkRFXpYLN72TD7GVVCuDc1E9dq+T8MBp
	 s3RrHGSsKp7ifnHEwjeynkntMT5qJmrxAj2aGBpWthBSeJoeuv08g5cjV+VANDiNfEgWc
	 9Juo/5q5pljiZ417/PfMy+cKZPOFCs1m8O25zbZhfv3S9jd2qFalsZudwmVS9u+z5+/rK
	 QzpHG9drakuGiqVj5lL4hFaXFbhB5VFBIfwhZcuNtQuoF0PwRWKQ1AkAadVRm3qv5kWKx
	 obB2Bdz83r4OJZBXFLwXzH4IZHUKHxl2hhLkXW1D5N/yh8fNZscX1DD08EpGpEvDBuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k21jsunw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B31606A31E
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 02:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k21jsunw
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e942864693so967845ad.1
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 19:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792548640; cv=none;
        d=google.com; s=arc-20260327;
        b=gAczxpJkO8J1+ytk8OYq3H3VRlhC6noNAw73L9Q+gK3b8kwKmqPU3xf0GXmgZ4uDRa
         xYLGrfpRC6RIAd/Pl/QNWCzV9Y3iCyAg5IFiJhiYg1xvZcPDopgrk7zSh3zJjNYj1J6x
         xCL9ZDrl7cBqQW2YhI0yzx24RlvGVWH8TZg9k02sL7haik4ZF7bzScZ0jjWJ2fN8XdkK
         mGsP6IWER7h+XvLJMbn2Hd5CySNktSnxSyIIM7dcruj5NMEbuSfoNFsdJsdsabb3DEDi
         ym4pyf59KIWu7oZfPm3cPQST5Wfxv5D5l6lhC+bfTEu5LrML+zscLyebARPISyu05ZUa
         qMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
        fh=nRd5UzIodst650lgC63VAxW4FCmIXisNsTWhr7joi58=;
        b=UOF5Bv6HnMLihzZPmBigcMPNwsauTLYNJqlU2itbNrX0aLJMOk9h6z2lVQPMVY4VPw
         MzwesybjDe8byOEEAQ3347JuraEXzdoGUsfB5UvFZYBwyKhWOZWxiNFXTkAJAJ6s8fF0
         3QiB+t2/4ow2z7oFUMTsyb5ZFzhWoVoz+Zg6tFd6hdAjaLjr0C7OIUAGLQrMRhG8+mvB
         0FPENms2n+Cgu6ZT9d7dY3bHeje5ExK7AWlM4BXiJ6AB+foc608mXOlRLZ+pj1sFue42
         B5A/sCsf1eyr8F2ZW5DED9LCUJ0ZtCHGW+VbZyFrTonAJH/Lilr/YkCgJ8fZ+i252YvA
         G37w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792548640; x=1793153440; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
        b=k21jsunw5FA7mnHUVYLeedQkj8UYKNVenSZnnh1eXEH1EsX7tjPIUNaZifwCaBfw6d
         PcPkt+oTAJLXQ432zivPjYLpP4F/PUFxak+TBWBzgJ63rjKS1PUZXWA4PZKnYjIE5wx/
         c1hPmfM90XFYPCm2xeeRne8jf0ju/slGc2/yUfSmY7AxrARPnxc1mxFTbrmkf35dSFK1
         JEw1NMSyllV4MiWhHPLXvlyTaTNpwOejn9ny4mxew6b4MZVyqWHrHZlSQZ3n3ndh0TIb
         N/fQf4BkWesqegMj3pRXjSiYt/xHJxj+UNjI5e7q7aaI/HzKskKh6OWBu+qJN80UXjNj
         pqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548640; x=1793153440;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bThVFHLiS6HkY2Um+tD6QQI3hy3lAMYKL5CvITPLN4M=;
        b=orzU0H3qYE1F19G6LLAVapd2L3DIopz0hNKT/4LtBpnTSHnsqzkubUo9IyUbgVttTS
         WkcodD0RiyyRXfppYKBVkVpR6W3izOgshBFBz0Qj1fVE+lzbKrAyNnGHTqyOgOTT0Ox8
         U/nSNLf3NcYLSW6aMSXYat6xmykx1ToMRFA6vGceK4S8yTzNYO0ruVeSTIgZ13Xdwpgm
         p5E2kq/6ZPIVDclsjZOby2w4JO1JjetKhmIU2SVGyRhRtYGjCz9nTmOZEf2hBilOAVoj
         yHyLKHNMc0Hw93QJCRWv4HQb86U3aDCyvaReHDWOVyL/tQZSFqACYLaqN7FdWvDBl8cO
         oByA==
X-Forwarded-Encrypted: i=1; AKwUvBxiYz9f5mC9No0DMFqr8+HlAa4lHgaHQpg3xIlLjC5zu42Px4WFB5FEvYaRzbg3d2Zi8ID/Cv5nxvhn@vger.kernel.org
X-Gm-Message-State: AFq9FYJqtwgGnyxuryuOFki8+6DPz1Ksm3T7B9Ns0YbX4GN/bVKoO7Xb
	ejVVtx9wGzn1pTuHtg0DER6rWYaE2IV45/Ot+fQ2SoHJFSvpV+cTp1OoZvgN6/1kQ7n3pVshXz9
	WD3pksegarjAukx05T8DAB/z5/rX22DM=
X-Gm-Gg: AYBFou1o7MOYq4AmzAJYjVJCV/Srf6N1MH2U7riERtZJ2Vi+bBdIDXG9/e6dS6d/a/I
	x8vwKbGJX7z5I7aL4yqB817Iow/Wq8CbQEPW4zY3Qg9nY/4nA81kJOaRSBMupszVfX0YbCgNbRV
	FeOs4j/uniWghqphgRy1VP1TJrkFtVMmNr8g4+UJui8qY3T1SSHWxvnO1N/IQ2m36v5zcI0vXsI
	+T6JWfcJKAz/s1j67GXTYFeYd91B3BYS4YYt1lD5ZHHNyrxK333FaFhgJQorbkuq+A1XDDMoqhn
	d3JHuGQdxgwa1L2FttDz2e/pBGU+zHe7ViZXckiyzsluar2llGQD3Sw7//aGIE/FVHHAVNzNYkJ
	+YodbZAaL1wNLL6ycrXKzpLM8lt/x74Gq2KbE9dggz2YHnYh3kB4nBuSZSEi8cQ0WPNbX4Ol8uR
	5Paw==
X-Received: by 2002:a17:902:e752:b0:2e9:776f:66b3 with SMTP id
 d9443c01a7336-2ea437a6f10mr6647685ad.2.1792548639485; Tue, 20 Oct 2026
 19:10:39 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009091059.25729-1-phucduc.bui@gmail.com> <20261009091059.25729-2-phucduc.bui@gmail.com>
 <179198414722.839288.1086260869798370727@kernel.org>
In-Reply-To: <179198414722.839288.1086260869798370727@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 21 Oct 2026 09:10:28 +0700
X-Gm-Features: AclHuK_ZwnrZGqk3WxBM5HXci-BcHIy_RgoL-sDL9QwBFlnpRBVJSLR94jrFEyg
Message-ID: <CAABR9nEMzYiBfEPKOfOuY3nScuX_kB69XKn=zvcZyjnBEjf3_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] leds: lm3532: Avoid duplicate error messages
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lee,


> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
>
> Please capitalise your name appropriately here and in the 'From:' line.
>

Dan and Cezary have discussed my name formatting before:
https://lore.kernel.org/all/ak-zMNq_gSa9g8nx@stanley.mountain/

I'd prefer to keep my current name formatting,
as I have done in my previous contributions.

> >               ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
> >               if (ret)
> > -                     return ret;
> > +                     return dev_err_probe(&priv->client->dev, ret,
> > +                                          "failed to add GPIO action\n");
>
> We do not usually print messages for '-ENOMEM' failures.
>
> It was better before.
>

Thanks for pointing this out.
The original code propagates the error to lm3532_probe(), where it is
already logged.
I'll keep the error propagation without adding a dev_err_probe()
message here and
return the error directly from devm_add_action() and lm3532_parse_node().

I'll send an updated version soon.

Best regards,
Phuc
