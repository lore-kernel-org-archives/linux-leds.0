Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551543;
	b=KIAb5hFTrmcwcTiO/j5mpI4LnLjcloZ9KJ+cxebR029fSuzezRuoBkZ2tej6IWRt1hyl
	 PseVm4Htx2Hs4S1CcjIdOhKTOPS9sd6e9sEzKr4nLciwLQM7sPED9kES6lTrm+VDTINpb
	 izzdzTE/Xr+dfW3IwlrcxYhz1dX9fBrgS1PhTdZPxvOEfGw64JtoPTjV0qtgw4wPXYTRZ
	 VrFgCyJuWlPHGYI1EKn+lt6TgH4c/2lfokjv51e59yINyYTy95FjSmMya+nr+yRX6Z9rY
	 TMIlCGkHVgDlHOKrWuxMuAWMJUL/qGeECv/6SEpc4/mmHYo3dXKfdQ01+LNkNC3jGNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551543;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id;
	bh=9irHhHnCujc5RAVXrKbQ14J5j6Rz+ul2vccLXkSCxdk=;
	b=vKcgvAYRekFH8BSP4F4zULAO4SB/NUbXOn0XLL3b2OLWMFA8MlgmIxbKJqzuCXAN13Hc
	 UpN6Jg9ulFIRJX/xrSzZ4UDmUAD7h5h0x7F+312q+ZEbgWW9PfmTvT9tOQi6yO/yvoxGF
	 vOtHLVwdwmJrXsRL2KTa+fJlhhBigP73e26IAcsWYGrurA8oi38QH8zpupBxnqOjUfM7T
	 TAgtAp5J7wrV3+8r4x73FICJWPdgzAnDoU8lbQhBTyWeTuJ9F9N9CdUQGeng2244FDg/I
	 JBOqSEZmr1LDFt0A8YkplV053LM6bA9X57DfgrIeFek7/FZx86Emx4bHwk/vLrgCLtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=Nd5xfZ8K;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE438606A319;
	Wed, 21 Oct 2026 02:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE438606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=Nd5xfZ8K
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j8Yrr5TXfz8vb3;
	Wed, 21 Oct 2026 04:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1792551532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9irHhHnCujc5RAVXrKbQ14J5j6Rz+ul2vccLXkSCxdk=;
	b=Nd5xfZ8KAPJN00NYRGcHUve+BpneGqZBqKfhUD/yUWiA45/6aWyleEc6OsAD3cve8YcXMN
	gsBSbIFZeuW7cCDeI4J2aC1pBBfoWw1Pu8/7ovh4tFtn15naIK5G12RL3IVnKx1nPevO/a
	px2PfjNT2SmbSGl4bQNgcV6Zb/h47BFbzKV33LKYDPQfCFCU3tDL9wPx+CVJ2c6Gjsh3A/
	fNiMCVJBF4liQhE3WJyXC7xQDgkm5LDYTT10SKg53i1g0OQ2uvkm515nT1lWYscIvBlVGi
	+y1BP8hhEdHgWQPItIADYnyYeoym8liouca59AkhG8M1h1GMkoa5stx3YTW6mg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: =?utf-8?Q?Fl=C3=A1vio?= Amieiro <flavio@amieiro.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: is31f132xx: Add support for is31fl3206
In-Reply-To: <179198370454.839288.5327794631276643738@kernel.org>
References: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
 <20261013-add-is31fl3206-support-v3-2-66a762a3c12f@amieiro.net>
 <179198370454.839288.5327794631276643738@kernel.org>
Date: Tue, 20 Oct 2026 23:58:38 -0300
Message-ID: <87bj8noj35.fsf@berlin>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4j8Yrr5TXfz8vb3

Lee Jones <lee@kernel.org> writes:

> --- checkpatch.pl (1 issue) ---
> Line 172: WARNING: DT compatible string "issi,is31fl3206" appears un-documented -- check ./Documentation/devicetree/bindings/
>
> This true, or is it documented in this set?
>

It is documented in the first patch in the series[1].


>
> New for() loops should initiate the variable.
>
>   for (int i = 0; ...
>

I will make sure to initialize the variable in the loop for any new code
I add in v4. Some of this code, though, was old code that simply moved
around (and by changing the approach in v4 it might not move anymore).

Should I add a patch to the series to fix this in portions of the code I
move to another place?

If it is helpful, I can also change this in the entire file, just let me
know if this is welcome as a patch in this series or if it better to
send it in a different one.

>
> Spaces around '+' please.
>

This is the same as the for loops: I'll make sure to take this into
consideration for code added in v4.

>
> I detest pointers to functions at the device driver level.
>
> Please find another way to do this.
>

I'll find another approach for this but, since this is my first patch,
maybe it's better to align on it before sending in a new version
unnecessarily to the list.

One option that comes to mind is to use the approach taken in the driver
for the is31fl319x[2]: have a boolean flag named is_is31fl3206 in the
chipdef, which means this is a special case, and we should initialize
the LED Control Register specifically for it. This has the added benefit
of still alowing us to set the current in the future (even if it's not
supported now). Does that sound like a good approach?

There are, of course, a few other ways I could do this if that doesn't
sound good.

Also, if it is preferable to discuss over actual patches, please let me
know and I will implement this and send over a new version of this
series.


[1]: https://lore.kernel.org/linux-leds/20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net/T/#meb963e4bcc9943bde08cbe679a59f553c2184bcf
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/tree/drivers/leds/leds-is31fl319x.c?h=for-leds-next#n112

