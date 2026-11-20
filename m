Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151708;
	b=4zfNygtIkwTMrpyrXoFtoTMcDukEbjJEj/IertSb7n58pULGC6zr67imJOZB7LwwSdc2
	 2KUOJbtvt8SRhmkGGXlX85EMkuI9CCk7reiMJOJxv0JRPYSKYNVrse/1so5Gp1NJe73uu
	 zcVwC2aYK6vDTvOJE9J5KmhRG+nT8mA5wJ+Tg4QiuqBd5O21QdM/yrthIsrH7nHEihfZy
	 jc6H6SVF3nvMofUABD0q3FL3jQsE46B8ForQv7FE5U/JdW4IJLZu2a6V/cF14grPJQsKr
	 gkiSKakKvyUtlQGCXFL5OxEdpEAbtlwn93mVNpwr3vV0KsttIA69MhVSe4x8N4qRPgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151708;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=1EFx4BBUnJL74M9wJJG1K5+Mkfotjm/Vr8HWMsecgf4=;
	b=gjDNct0o+/3408ww5E+2jmNpMKEjdNwenY+as3X/O1OfXFDTany8ixhGidgJQE+OYrVQ
	 OayV8mtkfw6NE9NukAoGLlgQwyPh+hDRB0BASYOYRydOolyM+R0MoCQFlxqSQjwGKJ4Bw
	 GYkhSU/wPmZ8fmBhzO8G41k/D+nvBIKGIwe/SNhOEze4VtClYfYjpP+qEuM/psbslQUIA
	 olQg3BlTQGbDouA6Nt9EWaiPV1/dvHsodkVXqzNbPEgaC83uFj+IEJijr7azoDzXilXE3
	 IQp4eA8tSxOYEFS9MSzFVGeEUwwB9TgvlB5KwRvjq0Ss8pDubHyCyiimjfaGXzoJygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA060A2606
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 05:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FA060A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b600fae14dso183232b3a.2
        for <linux-leds@vger.kernel.org>; Thu, 19 Nov 2026 21:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151707; x=1795756507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1EFx4BBUnJL74M9wJJG1K5+Mkfotjm/Vr8HWMsecgf4=;
        b=vFSsR5cCLZ9HJb8IBCOetlj3SL2UPOBboEBU67/lDruW0P3fklFbr5bpeqwSeAAtYw
         0ia5u9mBPd34pgHRrwgKQnLEij7PaWoIHqWD5hoVU805SYZNcM62i4l0+j0CO/QLT4dc
         5zmXxbdMpbPyjFRS45NsxEKjyespkDQ0GUiptNKUFcB+pjU2rtUmkM753hyuAn0tz5LD
         vmUa5pZCw5O8tNhu8CSrHcbn23eMS4z9gTlaxo2qx7T8vYJD7bmnPlskf2H0PiVf8YHa
         B4jriLn91C6apynP4M6WkEDQfb/gHHxU0M6qWHPOwt/ojaArsgWrJTvW2cEVy0yW3xiH
         NUJQ==
X-Gm-Message-State: APuU4Z/0CUa5stdpZTZvG+GuUQr18u2Lb9g5bP5WFOUogKcAZhhZTBkr
	iExpYZp1rqpkBFvR6MVWx0Bky42fL/WuwUPHr0MBt3yz4TQfiUsvKq8ZG8tMwJYg
X-Gm-Gg: AYBFou1/v8X0l6aWMioxOA6ConjHH967Wmznzo20AD9fe/Ip+XuCAg2/NSYCBiG6jjp
	+uYYXxyGTpAiMWUV6NQ6WAA/RwdU/7lZhehSLMzPj2e5tA5bf4fEAVRLcw4xP5aShGi39kjdmdn
	N6BUqvXkyhunE3NbfKocmUcP6qfsyi9rlUpdQMG+wTSj5/VVOMP04qoGSeQtyr1iNDXHO8WZrDX
	HZX2IsBL/Nbp1hzvnZSC7SGsnHa7w/lx/dHhPEoVzG9cw+tZIxohFaXFql5qG3/vxB3DtCVhuJk
	efepXol7cVgDmoLyr/eV/d5gVs6ghnkztN5MrPa/tBeMawymYeXN7vjPwkE6nqlh/VcFiOw3EL6
	f7vSqNFAp/DHzvfnaotx7kUjVsw+7d+X2Bl7SiAzzjjvKiBBw7XfrghDX9ESh70SrbQv/eWzSbx
	TwS3j41Ksj9vmNmBurf8n7F1xE80/2lVmKSfsfK/mGu/rBHtR+YHCPvBSdzUmU54APkDBhp71NQ
	tecfsH2pGAfDfxr7CsDjC8uF/hoCxRyBXNKVUR1ZgJnZc0pkJWFGpqpV4YXyYSESK/k+TLey7mi
	DN5Dwq7doJlQhjxkFbggqjgFVn3LL2RNxJsFPQEKN+BiSQ1W8NO5raTeoxJDtNHYgOvxvcHuam4
	TOzczerunuctmnqinYCHLpNufHpioyBqP+S8AjF3l
X-Received: by 2002:a05:6a21:7484:b0:3e1:e6ad:9ffd with SMTP id adf61e73a8af0-4014ce5e610mr1834378637.37.1795151707077;
        Thu, 19 Nov 2026 21:15:07 -0800 (PST)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0100ccsm709283a12.17.2026.11.19.21.15.06
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:15:06 -0800 (PST)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so1055763c88.1
        for <linux-leds@vger.kernel.org>; Thu, 19 Nov 2026 21:15:06 -0800 (PST)
X-Received: by 2002:a05:7301:4308:b0:385:496e:80d0 with SMTP id
 5a478bee46e88-3856f55636amr1795390eec.29.1795151705592; Thu, 19 Nov 2026
 21:15:05 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-11-98b836b1cddc@telaak.dev> <sashiko-outbox-224266@kernel.org>
In-Reply-To: <sashiko-outbox-224266@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Fri, 20 Nov 2026 00:14:54 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4yPRNjArxyCrPwM3xWXfYXvjSYbzQBOeKcvYaroJojxg@mail.gmail.com>
X-Gm-Features: Aa3M54rMy6uhn3gPkviQr_Npz2srk2_GgikoHxo3cCJaL2GCNpZ3uPftOnUi6pc
Message-ID: <CAPY4CJ4yPRNjArxyCrPwM3xWXfYXvjSYbzQBOeKcvYaroJojxg@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] leds: rgb: ktd202x: Don't let a blinking LED
 retime another one
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can a concurrent unlocked write to cdev->brightness in the LED core cause
> ktd202x_brightness_set() to disable the chip right before
> ktd202x_blink_set() or ktd202x_timer_set() programs the timer?

Yes. The race predates this series: ktd202x_chip_in_use() has read
cdev.brightness since the driver was added, and turning two LEDs off
together hits it on mainline too. The fix tracks whether each LED is lit
under the chip mutex. I'll send it as a separate fix on top of this
series, or fold it into v4 if one is needed.

Joseph
