Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803277;
	b=V8G+fVsW7gb9jBTEQy0KU6NZIVJW6zB4uRqzt79Me3fx/kCfVx+1YS3Aw2Yo31fn2zJw
	 WPMrA917BNO3jMPRD0LzMnUvYWDNhVX62T1kPjmF4YOqIG6PGDloat6Xv7Qi12GGdmSYQ
	 DkEL3nXLmt5XaufOYUa6ZA8zRwaiBBo4kbvDg++3shcEcQfEV4nxHAYshbwgGQxUKNii8
	 Nh/p0p9fU6gXWf6XJRNYfwSo7M/YZ2e+F+aGjw1z3AnUF6dxLPR2JcLrvUA2sW/lT/d95
	 ghr6Kme2jTpcjP3tuN//dipKMNbFlGkpeLXLBKS5PMrl+512SMq7J7MRVoMvhM/F+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=rSZAK9NmnDM1rECR+UKs+1THSvEe21uePbgMyS7RFuQ=;
	b=YMGnm/4qFuUFrYhAVJ0hAXjG+ZbUg6H9egelSuZrdq0Qhd/m6CVg12oJuxIbhNGyiOXe
	 T3LTW/rehnB1FPaerP2Wq8nSQjCNGufVpuWbDr7/USV89/tvcTIOlunRZo0to6ZvzZLJZ
	 N+c1Zznob31OWGF8sO3WknEOA2oV5JgX2SMp07AyC6Zn3uCmDXHoREh9QGXWiWy4PmQam
	 CINELVjqcJwpSDSxtqCPQfY86B1NcXwwv0KWjKrOJZN3jHbBayiGYtlhu6FH9OoPiKQU9
	 FMVK0hu9rBBnSEDFGxTvrNx+yumWemFZj5dNy595tjQ20rOI0sz9pRUwK7zCiGte7fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YE/AgrTU";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329A606A328
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 14:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0329A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YE/AgrTU
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070781f63so418284b3a.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793803276; x=1794408076; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSZAK9NmnDM1rECR+UKs+1THSvEe21uePbgMyS7RFuQ=;
        b=YE/AgrTUfqMTobpDoNRIRlkX2TJ9KiqZq1Yc8/u4kUWjTvi4BbIvYfDpEHAwbXM/9k
         4ha0QDd0M8aJWuvczzS1kQ5ewmagQTCS2T7Q+0i+ORTeBWZ1zL/AqI7wm+L97kVXpstq
         No3ZWY3FAG/yTYpbcL/hX5hPwm58piOR5IH9dCmUBsCjAEUxAj1BEcIn2KKKNY4wBsfc
         KXSsK9iD225+GBj6c03EEMK2JGakdcRFEAoOXaizVjaWK8ISAVbpH9FfhRpQ29+ZqGoY
         R+I+JunmlbRCH9IFfupFTT7kgb0qwDQvhMN+kEHJ1ViwKtdLWy+MLL+V+BijfcF4VecP
         WyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803276; x=1794408076;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSZAK9NmnDM1rECR+UKs+1THSvEe21uePbgMyS7RFuQ=;
        b=P0tr+3L+nUo28T5QT6QCJhG3DlvBp/hSzv5GzKwUDOELqsDosf7LKzc6UhmTZTBxft
         EtvNhipJc5HzIVLCDY1MXGNyhGoqrejH3ZZMBm8Qg9ZrAJZrz3BTePBzj4j26erOjZDS
         lqVu4jU8kFQlGS19C4WNkQFqOSGG5RKqxZgLKN6+Nq6Wi6xQe+MJ9CrXiFjbJ9jd0S7l
         l0NxpCDR/YRSGwrC8+cRh0DRfVEi/K5rkM52aTvglI6+aTEoZm9u7AVpuYcciGOplBC0
         ZWV3E+mTQjNAgkmzjhVTKBeMkhBVIG/fscyS7h+asvQ2EJPwGjEJkO8OK8/t+R0BMvz3
         cnqQ==
X-Forwarded-Encrypted: i=1; AKwUvBziABXlegfTMH1OgQOZ/rucpiPlb8eG1aku8MbbD4Q2am6RAf4Jejo+2TVN4ZzM935eSskNGA+PvOln@vger.kernel.org
X-Gm-Message-State: APuU4Z+0q1v9Rh3JYXaHjoE+yKC12/0c7MN0Q1f+3DPsyivnpvnqWwnz
	+EZeYl3+aZgED8HEzWEZtyYiWVOfvyafqbbrTAQb1rtv9NZ3pSRTg4p/
X-Gm-Gg: AYBFou0kWDi7+wqGc9rRXSYQ2PzUA8M24sl2AbJ+1ytROxTmk8XwhQ00pnxqZMZ/nqp
	Ms1vF9/k7v3wFXXd3+1pvucMClRPqiMou74YCNa2wKlu6oonwN3iYWJ5qmXJ/KIeWmC4/6loP7P
	hraHL52bpc6X7vPqLGPR0FOWCqZvbsb5Sk7MUHw5VNhzN7FUPU9+sVARFm8R3Q1tEyyj9lbhgE0
	ErEjfyWkFHiIrT0RIRPg3XX1R262hTtz/Rz7Ada1D1Z+4syMHiL+ElC8UFaomZGAmoqkIBr3cA4
	RmukiX1XkQWaleVFomZ1h9nI0T4ehgT2XVcQAScC1KEemSo8sD3NXN6BliEokpJhmcFUkQJdG2L
	l3b75vwvJVyLMwr4b8/k8/cn/xK3bG+pn62wKzfMPc5wpS1zKDTZU5VlYOblW7n6d1Psw6YBttp
	qSUTHnbU3HPxUulObLRAFtwn+ax/6KlxCxB6mddr1YVFPXpW7nsPrsOpWVYXeL7+gjJGNFAJ+tl
	SLjwceKymyFzhzYB2oQyEZVWTVjPPHbqfqUiL7lXxPut9xCX4jy4GA=
X-Received: by 2002:a05:6a00:4148:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8a9ba7039admr14010835b3a.2.1793803275461;
        Wed, 04 Nov 2026 06:41:15 -0800 (PST)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe0dc0sm1107862b3a.1.2026.11.04.06.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:41:14 -0800 (PST)
Message-ID: <6aeb440a.36144473.14076b.5da3@mx.google.com>
Date: Wed, 04 Nov 2026 06:41:14 -0800 (PST)
From: Liang Haowen <nbg2974@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Griffin Kroah-Hartman <griffin@kroah.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: asus-aura-scsi: add CONFIG_SCSI_DH dependency
In-Reply-To: <20261104142415.676757-1-arnd@kernel.org>
References: <20261104142415.676757-1-arnd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 4 Nov 2026, Arnd Bergmann wrote:

> Without the device handler support, the driver fails to link:
>
> ERROR: modpost: drivers/leds/rgb/leds-asus-aura-scsi.ko: symbol 'scsi_regis=
ter_device_handler' undefined!
>
> Add a Kconfig dependency to only show the symbol if it can
> be enabled.

Correct, the handler registration lives under SCSI_DH, so the driver
cannot link without it. My Kconfig entry missed the dependency.

Acked-by: Liang Haowen <nbg2974@gmail.com>
