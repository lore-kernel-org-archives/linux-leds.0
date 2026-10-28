Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191936;
	b=sBdIvyMbtisqeM8CNgEj32POHX+XbvUhpi8Qa0U9uVV9jiVTkjnigrHP5ifAhD7tk9eY
	 ON/Wz2FxeiRJIidrR4u50DwlQY8so/KVkygluXx+QK2O2pZHRuam8r1S3FhtI+74zJOiE
	 4AGsCYBT2FDe9ejbdsYPb+kQW1styL5pMtloGrQi3+7QXQ2DI1IUDj+lG47wiO7Mnd4fh
	 zogoXjCiM3axHptm+im9JGP5yL/VE/XA5VzVCQEiAK3DiyhgqJkH3LIRtRD9OQIJDpStv
	 ld0HmabXa99Um2R8y9CaEwXvdbr7tUgk9Ckcrf28IGHjUj91Ep/r8iiZ/4AjrJIm7Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
	b=nctmwdj2LtqmYT6XNg9pRs2Si2KSXbwGilv79Awdri8dC0SqfJBnNUoYLUg1kH2lEWz5
	 4DqpAd7mlKa9bDJ+dE8bhmhWUnpNGXrDltlQdsbNMff5ywd++7yFJNUpodATITk53HCLS
	 SmbW/gV1KhmOyquuvgAabnNerM5IKJyYGD6gC9eMgUsFrYVSEjMnsiQLoDeQ+BzGr9SeW
	 uMHads4HUBuOJ0SsNc8u1eSvQPLOLywAhx8oZu+oCIm7uSH7VM0nM5eY76X52TPXZD0p8
	 EUect/7vANkSzdCLzt1x6L5ii+LKjHXccvxNLZMPw6Z3X1s8l6tsYt4V1naUKpcBdNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKnwUVbT;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80494606A322
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 12:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80494606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKnwUVbT
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so675279b3a.3
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191935; x=1793796735; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
        b=ZKnwUVbTIEGSp3YRgh3c5uKjT02PZpb8VjznUtGAmlyaZaegMduYT+jTcMWxiWUnpW
         ZA4rCNqIZLDv97TYXn/nyqIe67U8TFasmoaaub/5wikT/0QXhdo4aLEzUifNj26SgGbI
         +3Uxb9Whc4EmPZomkH3zEcCJg2MKSC0fTCHCk9M3E08VZbjjLcDUcD5sgejKUoU/xOaE
         QF8lP4uGpqnkxU/4i6A2h64zncOHnLPFid4GRNhKvGOeIJSs6vQA07i7fj6axZfAjsL0
         6HRACEo1ufoTcN5ln4SxVcuwkCZQKfSYlqmaYRLZtS5/rUE2O7sGCqyLiGTAhdTBxZT5
         5Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191935; x=1793796735;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
        b=RKote9G3Jie9iPTkBosKoIufvCx7/+ACq4W/XAyftUtqqCqCkaJJ8GZkcx0WOfW6WE
         pEHrNyTMjGrpCr4YV9V7Ny6WzpuDRfe2fCq2xcGT7/Is/RRJeH95ytPtmdhDL7WBd633
         28ON354yeZYdMow4lmkTmshzH+oPskVg8rQjhHI92ywSxAa+t6uD70Egzu952mZNwJEo
         A2ApD8Em5D5ZUzZFpSF8GkK2V+ehhCiRGSEoC0NBqfBpBxgrGxPDCvTd+ao0krX63MFg
         36nWEgSQybVh5jkriE00bFUmupa7EeeS7y9Hgsa+GDxx0yrDLclofX/nwgruwIIlC4Lf
         ouIA==
X-Gm-Message-State: AFq9FYL5BOXvo3E2r4IxCITa9TOCWguUKmabFInxrnSc1k0ArffWx+Zc
	IaX+NRLUN8UmB03D5+Yd/psLInQdKvTbcv9syD6bU/bop0Is8M7UsWjE
X-Gm-Gg: AYBFou11JjMoziMfaXWzHeta2VeqNjlleAGfy2OFdKaI2300mMQsdTMzCPussLDsF8Z
	zoYwgqV4w80KIJqDtUonUcMOr6Z1dZeSCqQJrjEALCaxp5gq44MAL9EzmoETs3sQn1SqbN52Y0t
	vu4Ob/Wqf/uBmbmgGTeA7l6N+LClZsi3SaANZZojX767jKk0jiHhkz59RQAzN7YC0Fy2u8goCla
	x9yrzgEWs3UFPnLHs71aQQObSzBJ1L87b3wnwO4D1NxWKQjjnkyJTVTEYjOU15NXNt2nc05R1RD
	JeAdfZ2akpKwxXxLECkqn2djeEwIjYVQuGkAvVb6sXNCXkLcu1qvlZ8Qqn/OJ3bK1hVjJ8DP60r
	2O0q5cJMmILPNtT1qpTtYF1YGDmPjOF1tGW6tcHTMyclV+zG6sx0tbDXI3W6fiEPVnSjIEDSv7U
	FvMoay1UfyR09IrYeYvK1G0NysuA77Up2t36CEoEf8xyFMxN4VxkPY6D5xKDpV/tqWyO0BwVxlU
	hT2p1gHzUqKBPar01AJUSFwisC1bufeN9gvzjDNcjDOoRBgI1Nj1KOkCg==
X-Received: by 2002:a05:6a00:3a0e:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8a6e6a17a2fmr1919876b3a.22.1793191934270;
        Wed, 28 Oct 2026 05:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([240e:46c:8910:7739:c024:4f7e:9059:99de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm751438b3a.20.2026.10.28.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:52:13 -0700 (PDT)
Message-ID: <6ae1effd.d3aa34e6.c46b1.441f@mx.google.com>
Date: Wed, 28 Oct 2026 05:52:13 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 Martin K . Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Marco Scardovi <scardracs@disroot.org>
Subject: Re: (subset) [RFC v10 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB
 LED driver for ROG NVMe enclosures
In-Reply-To: <179319085271.3664457.8130606663267466619.b4-ty@b4>
References: <20261015140051.1159817-1-nbg2974@gmail.com>
 <20261015140051.1159817-2-nbg2974@gmail.com>
 <179319085271.3664457.8130606663267466619.b4-ty@b4>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks, Lee. Your reviews along the way made the driver much
better, and I'm glad to see it land.

Liang
