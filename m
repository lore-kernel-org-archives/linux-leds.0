Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499885;
	b=z4pxDAB01H+M87dSNNeDsdeeXnBXMK0STM581DAJA/UfK7Zw/7w1gn05kMtoSWtYgGdF
	 mK76qbjLFx+H0lHH2mBoXHQizAp7/FQv8Y0xKyuEhhQSB7d0ndKiOhlnNSqS27ko20SXs
	 Tqio3yhqBnxBPpzfF6BC3J2zb2xRSOFyMFtwkqXB1MMNfmNFS6buNhOJ9vPHp3RuUVKmS
	 X9QObsCteinep2gMkcW34d2S6zvk1dqC/pDnnQxwK22zu9bwLvdDjzR8tMdXxvpUXEvH7
	 z4J9DtK9mk55VBwStP4TQQeOOIZCjkaRm6KpqJaE2EWWElOLCQiwAqCZIyF/D6E2GNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
	b=wquoD6ggjb5ayh/nzr5/wC6HmmXirbsvolcvM29sniEwQEh1vOnao6Kh2dd8R7cSzbee
	 JTKRtPnmcoIvnM9+SNzHuM27YiO32n/xeiLnPgIdrDcKxf6igImWDYgOqR2Mduu9tV4U3
	 gZn3oDDdkNOYQXQ2J7Uk/TKblh7ejo8G8bduRuVNBA8jcg1Cep6SIKj0abEPoEagGOr7l
	 yXnctEQEyp1Ef+Vfeu55yEDwBA+ZLmOOtpX3CS1S0DJME9PXHdUvZF3sjzPTg16Uqr66c
	 awIQOvqpejqCwuh5owggwwsiAsF8125miyU+9nNmaj5QHCCfIb6CD7fteZItyxMXMMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmwbXUqD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E42606A31E
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 12:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jmwbXUqD
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so5743670eec.0
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 05:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499884; cv=none;
        d=google.com; s=arc-20260327;
        b=lbQ6V8j/0LqSMk1shNP+ZRN5yVqKCxvRru8aFFggdpkcY28g2+fa37DElxiA3R19vf
         ExhKWZEXd5Oq/14oPdmIPedCZKLCW8JToT2SNlBxygcIYlDU0w2nSwZjy964odxgU1tE
         LrcHvomh7mdMOnAtTclZH0d5CHciS9Ypsoe4KOCzn5rXsUNiwzbw4iHermFtBDJ2rWJg
         /kGN024M4LLHQPYlsiJa5YSF8Xo7kMwYMWR2dpm6ELMM8+SU/iUnctKZXV6FENpoqO3z
         boqyV17AhcCwDR9wYnSJxAsnOv4cggmCOvCmKvckc7SI2xBGHQKHyzLHn8R6OX+gq2UK
         zEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        fh=wXBrAcq5mEl7+o722JF+AV3gcg5xPg3JAa/knCSVxOo=;
        b=QBhmiBa3Eki5cCzD48Ybv5gLhZbs918MpNUiXIAiEB+qsP54F4OXW0lA0mbEg6p9gC
         m2aYV8Z9htYNGXMgQxefjXQhBU82KB6Jwh8ZwlGo0rAePIc3/u4G4aRsinbmRJqrkoaW
         3Ie6sNhVQXIxhzj2E6+eVOz12/O3DCBNpZ8l+WnCDWyH9Ge2Omuaho+8aaFo4BOtKqny
         WT1QPyFnbICo/dWfocDFy4+BAdK9+n5BsU++FKz1kf5ktGn+cA8ygupzprTMxH4OUXfA
         ctcDR/vYFpypS+kA6hVzH0MvFrZaLEADAWtJe2nwIWZrWX+xD2EXkJaCtQ/ljmSDbGoD
         93HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499884; x=1793104684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=jmwbXUqDvmKk+mts4P8S4Qs0OykPCvL+ZlHj6qhWGIspF7//gQi87Ih8CsHjx/61yv
         wGlS2HpVAHZ3Lu2ZAPezB2Da+qfjRMgwpyxguCAQwdLYXpBwUdJpC53SL8i1C3AluBoz
         PqzIWp7iFtQ3nWEao5a48mvkJxBlgXCvnVIAufBOZw5diHqP7Uv+RTsrse9gVOp2u64n
         nYOWDbEr9XRZ0rVc7jU4+prj4inZNvasO8f+AIGIc9AouBH/JWrRm+lojVGH3yZn6mxl
         TAusewpHXJcE6mPh1y6HGwM6WdkqGXkCVqe0uVPsAZzpnXchYt+hz8SjLjcXT3/ExGSX
         1D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499884; x=1793104684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZckKNDFk7eaeqWm4nESk5tiNU0gn2sWrHYvs3EKsEOU=;
        b=2V4PD7p31ejOgGll0TQIn2utfT6n9RrCOBPmhG65saMXGHVna8f+jShmHl7F8w+9XZ
         u3EjzJ0QYV3JFqtTrfnfdBpOq+crStFYmiCfub2wBftnQxkYpezbZjuhE2kCNhq76ICM
         9CAothFg+6XrcSVEpyCW8EBUIIttARhlxUrZIr/LZZ+ZL15LWWa+lfHvlgh/Pi4xAsld
         RdlKMcKPkDmcuKFxhQ/ySxyP09jbTcJrPHwPkZtwIlqwpxH9vYzfY3liRvwUwNqFNkMl
         +frQS0W3YTmxG8t+oiiaEo21h/0ZZmMZuD4o9Lc4wCT9GDk1ujoAWT2epcxY9owxkaY6
         /GqQ==
X-Forwarded-Encrypted: i=1; AKwUvByqQL0PL8bnIFpEDNoe5hViiZZ+/IpILgMUDVwTsrqw7t/P3rRK4RyulqFmPEGSspcTGUKA+CdpgGIZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIrEdC66KAE3R1wDLLAk4RGCir1xwHQgU3ke3RjG2ewbqHGg0yQ
	+fIHofeIVly3Uupm8kv3rhTAR45NNY0HAts4DxBvqxKBwp7VcYD9k+KIdgPvHcFKc9FTsGQbi2X
	BzgiLZiIMPFIq6YZCO1GRdqcpwJvTVGk=
X-Gm-Gg: AYBFou0bStJybCRsEACE/GRcdwYU968phTQ+rh22g7lNiS+XJeEm9YpHOnnk5Ypbfhx
	O9lKwXMeDhDfNBdVXoA/zC0u50jvNxDZefOGFb0L6fPPilBrCEwk4ahPtNSSUtWD3MAiSz4HdmV
	KDSMT0awzBLBWVZtlTFXSQ7cwV/Yxwdsyfx0XHISNg7WzTDLps4S2f3X5Nu+mbdIUTiVCX0E2yu
	iwpy1DqYyp7Jl328PX1ZFF3eQwUH7kGNwfRcyEnyk1QNXzDIHXzsJ7QT36k6yxcHOQFqof7FRhy
	+E75VhGVJbVNyPrJGIhjsBqblOVeEHtJ9x9bSLULWkwvDVM/EHar4y/gE/LMYwkf2yzLaPQ3xvA
	i9lpu7SQyQWLXLqRZCgmYloo=
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id
 5a478bee46e88-361a341c8e6mr20929064eec.37.1792499883433; Tue, 20 Oct 2026
 05:38:03 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 20 Oct 2026 15:37:50 +0300
X-Gm-Features: AclHuK-m87BDNsd06OZo9qyUn54gIAUFrBH_nvo3N4yUY0ynQqrl04tZBGoSFNc
Message-ID: <CAPVz0n2qqMzhbMt+dTaGv1gmrp1xmxJP8ZdQV1EcSpKkneFALA@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Florian Krischer <florian.krischer@fkr.dev>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add input driver for ASUS Transformer dock keyboard and touchpad.
>
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/serio/Kconfig                   |  15 +
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
>

Hello Dmitry!

Would you mind to add your ACK/Review to input patches so this
patchset could be finally picked.

Thank you!

Best regards,
Svyatoslav R.
