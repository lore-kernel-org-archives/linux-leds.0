Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781884;
	b=RG0H3xnBg/iGFAEjOGeQVq6u1sruzgL1Q7HCCv2mK6XLmOLO/ciNRoNBD6WVbUP+qTib
	 HyD8CQlI38pURZYMvNZF8Equq1MAu/c/RfB88WipGqOexRCpgCiXSOSc9UUlMep4H5Zy9
	 zLSd3l/O+NQk8uqTn/epuaC99KgdBiBHDZKAh0pSRh+yDpKpKValMiBUAtAP5j1FNZJAi
	 Fat9T9CjswBqL7qAexhHp+O6e9fJ/Tc2gVEDvAYeIbohCbv2QVlF9n0+TklQK/gOUscA5
	 16l4iIVIi9Q3RGkiRBo8tmeL9+wEAltUXZxPcd1oOWlyAqroXfNEipf21r0cvPqQrNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
	b=Xu+8js2GDHD/0nrFNLU2vExFOG1SDkGumyEqbfPPTMj2YsShEUM4SmxtSFhzFaTs+d7G
	 DdkYZXLUnScUCC/ZtHKIe1hjX8Sc4AXFvohzCpRgjEj8gKkNl7VgPIs3ZUDiFH6TNr15M
	 YAfHgA6oEEtZSilh637K89ZPMcpZAHkAkMBbGnW+4Um3+ZGmUQpTCwIlzxbF+WsZtdOJk
	 wfCH43nzMTq0ryfFSoSYRRmc3X+I64cGCzNfnFBIEDgS4F8Xyo8IO4rNmCe20W3eTpUBj
	 mbo5BGgV3ej2USqrgf02mJDGOC6ARaboiAoYp3a4xqsf6VFC9YHaOc7uPoYGf01f5Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC2606A332
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 08:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CC2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd3310348d2so719428a12.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 00:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781883; x=1794386683;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
        b=aEkSQZuP7sLx71wsHNCnlBQ1y1shrSR/snnJpM9q9kDa4IsFNBbyWfx1TAodaLdeug
         OD9yB1rTsJOWNlSMq1JhAkHW7ZqK61Lgpxq8SpaBnNYoBHlC9DH28FRpLPIVFqt3528K
         BpzEnL7zlJJvfH2SEwWD6mcJEITyyeYK8xpNOp99nOOTNdHauvIiM2tf16IIUmmBB9Uz
         VN6loYWdviPF6sEGcyUJDmWjUKrCiFPNNu7PZE3Hk/Z4zR+CIAC+0b7ML9vmg0bSzwN4
         NYBYm0pW/gYis5oGEQA0oAAf7wy8t5sn4G7q7AYtsdx6Ujj88+Fn4iBDhxKXq+qNuQuX
         p2mw==
X-Forwarded-Encrypted: i=1; AKwUvBzQ5/r4WnMFb8ekRHzS4yLv6wHBZz+dxvgSH1e25Fmt3IlP3JL4m3BFyXv+FsdN7X+aOXBl/afemURm@vger.kernel.org
X-Gm-Message-State: APuU4Z8DUYBbqKbIR4OR45YBU5mszt1koBofdh91bzY88+P/Z6bInOwD
	i9/LCsk4jgHo5JvGSlT2xQ7rlgcnlaFMmTKsceEBHcNUtnggMpHsGvYClBVXfXYe
X-Gm-Gg: AYBFou15+58mHOq8Urq7lum8ELkgpK+wRxWDbTkvLSPUO5P8+0ME7JP7gUvfYEE/Een
	QCm/JQloLvIZjGsUYVPHDHWlkh5I92fWwwnAOxKK8d8ANqawjJOQLdS8kT84hi2pnqGBLFT+aTb
	s/yiGkhvbeLTJfz8mCW5/lfqTYQluL+PkCCzR7iDmnsF7bvg1Ig8cJNy09JNXkM5rPO4r4xDJSF
	cqJ2Tl2KrhiSPZcQzpF1V7O8CAt8qZHfyGf2vqUqj155FQxjMMLvQc8H+yYKhPYClGLGRMdEP3t
	U8pl9BkMNNN8lOnH3bqwVTOU1P9Su7z5TxeOjQ2sxckoHf7H7PS0Ph7nPlfRJv6nUdfZqOw8hhA
	zhnESIBhW572ZKZVB3r5qZsn3M/gVRhcvoc6pOZfGOycG4xesncPrPY8BKH8vJKgrUBZrb2ce82
	D86GSBxpPYK4mW33+jlY4j5M4eFHYonEYzdyvZqXjSEBgXkc76yuAUMUTPWMiZoMUgCCLsSP7Un
	N41Kv6AVxNKrG08doLcjWN48URr9dgpWicnjcZAuuwybKq1mUK9xCyMj0XEBY58fjxf/xIifg/n
	vSQHKBFMGTco6XgIEHRePv/gR2WfReqsCsHRlKM5M2Y18bmBSijqIZQ1oXw5w7qHpkeftaoN2c5
	ikkd6yGkI6PMGJ0fOlwy/kEf8FHjt2iU7rGNJMg4TuHE=
X-Received: by 2002:a17:90b:4fc5:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ae8979c4e1mr7298973a91.33.1793781883230;
        Wed, 04 Nov 2026 00:44:43 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944a0ff7sm3060856a91.10.2026.11.04.00.44.42
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:44:42 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36cedf1bd63so407845eec.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 00:44:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw6OyBOwX7j3mjpu1T1lNCbJ4qFJbIq6C0WX4ONdQd7nuCqjKYSfYbyhNsg7zCP+IpBG/ntgCnhlBtH@vger.kernel.org
X-Received: by 2002:a05:7300:c5a7:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36ca1bc68a8mr2873501eec.0.1793781881630; Wed, 04 Nov 2026
 00:44:41 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
In-Reply-To: <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:44:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
X-Gm-Features: AclHuK9nnsy6U4khk5cNnlQ4F7O21MbUU3fY_2pf7x3dkjkCudC-yc-EGP9flSY
Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Drop.
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings.

Thanks, v2 drops it, and the series is clean with checkpatch and
checkpatch --strict.
