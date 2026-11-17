Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920408;
	b=D0x4ZXJjSXgWBLMCjF7SKj8QmGjKbhZPNOfvEgtdLuJE5nB+DjEpl7qrEdb/SsC3VaZr
	 fEY507njfvZb7W0fafDS+gg3XwgUlwetUPjKxZr1dVfy5BNIk1548k5mUv0WjOhb74Fn+
	 3AAqQnnOKJlecd3Kk5OnegKSpgBjDztX6tc0EGnUqpyk6noJ5+VISEvPi/p5T62ujZe36
	 89GL7oQP2PAEF72NBxPlCH2zQssMGHk8/21DGQIGgKUhkSTL7UVUjywqADy4L0INRxO1n
	 fN50pmV5hSWO/STGn+GdbqI0f2UNmVlzXLee+OZ8YKHqVi0SmE7ZvjUmS1pAhUUHW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920408;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FbeKDoV6eECqsQ8IE0/LumHaHBERp7BdCgLu1NobmM4=;
	b=4m/Tanv97kNWHNZ1ATt5jWTEfHJtL5q0EEZ8uatUGN8IuJu7JstuX2bsuG4cdPanfxgX
	 EIUKK5V1cb9FILu6XCofmY0Ys45AIA2+NANRQlSXK8enrE53MuQJ22iBPU+fqQ78wiiIK
	 NIFX0hDQn9gIRCI/KyRjAxneUYOUsdGMF9rZxtV/QC3rad6wqCzMwDyvEjH9P5Yt0CpxS
	 1TIKuYVTjS7J68vDPftWEiISZ/7EiWEqzW+Vv11WWFUZHcPZYZQngJX8JGeKkfw4KIygE
	 zdy4ue4k5SOx3rkV5sGfUBHh/SOICe0a71EMpmAIacy4xpniQ3xyyTkky+4w1xe4JCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=nN6+6iUi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j94VP86c;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610B606A89F
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 13:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E610B606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=nN6+6iUi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j94VP86c
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 13D1F140019C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 08:00:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 17 Nov 2026 08:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1794920405;
	 x=1795006805; bh=FbeKDoV6eECqsQ8IE0/LumHaHBERp7BdCgLu1NobmM4=; b=
	nN6+6iUiE+ogweokvaOGrAyAGzEEv7BoTofq30Z55Vijuuprfs6vW2PPjOeI27xk
	Uz0XQXgZbM//9GLNVQjTKVlsHIBdfLTkXhICcVOlcklD7gbwk/grzYbdkPoiTLtm
	8NcKKIlQawwLA0uxgH6pJf0M/+JVfnlrFByBzfr0ts0vFSQn88hgjrUtbzVZpPLN
	Oeq8O0abwGHDNBud1YhqPonxAbY+pM3/pcKC6OJrldmgrbzCL6EWKMJgzVvX/Hpt
	soNICC4JsxzLryIE/J7Ckzm82TAv5FFfMpWMFUh/9RNs7sY4tKtTFdIcq1DKD2S3
	nIT02toX3yU0BehQAXakSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794920405; x=
	1795006805; bh=FbeKDoV6eECqsQ8IE0/LumHaHBERp7BdCgLu1NobmM4=; b=j
	94VP86cX65JexO2DozZg12tkq1E12KvbVjexHgHf7wQJTA87H66x0TwX6uzc4J0c
	uXWPjXEN3Qyi/pTaBvBBv7x7Tl8Ucax1VaEGIFBJQTLkPMMCiWfvYgw9793Ueid+
	KiYs2Xc0TIIrVDuq0aOwGyFljCk2FYPr4nv9+cwTDpmqKZ/VRLlujdUtSWEiEKhP
	ap/fwb5H5Z4vBE4LYo6/ZYPzWJL/CqQ4rwu1hh9SlL50qXUPWCaUQz5fSSR2L8WH
	N1/DO7bpewI/LMFdg8rO5R6O0jTR4zxKbSz0YBlbfNsuMhsI2gNZuHXbH3JugN6/
	6ETBVeX6Sv/Nggiu7I2dg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794920405; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:djZ6YF7Dr7cyTMYcPF6xoBpoUvRriC3c+1C4c9ByRSdgu85
	AUfqah5ECZWZ59sv3uV+lQ6FNpyAw8UGxpjD57LLJaPE89tVOTWKBVkGGrTgLWLy
	q550WJs0D7ifzgQX3Rrm1kgRTQVlKGEmsso5fLsWzWk4QcMriiFg5pIn/xD1pZxE
	2PGbNW9Win907f0joqYzgz32UjlU3inuWLpl+haD09BUn0KeB2qvv3Zs9oTNzHVP
	k1pNE1msl05pDC71dYCkZXkpTjKXACy9VvHQpXSNIX1VYkiErDJLtHrfIfF1EFdR
	utkV8d3B2g1NSj1BUsLL2h5hJZGo9umAApsAhTQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2Tn/+viqbP/r9TIlveUGv/eeuLwzUmFr5XF69AYS8eE=:SPxUh1xo74WX2tiLckfcwEEBVierqLvFRyyZ1SNa3EA=;
X-ME-Sender: <xms:1U_8akMBe-YxJKSbPeTj2W3Bi-SOdAudEZQKWAaI3253kpHkGnceRQ>
    <xme:1U_8am-5_cmVrm3GuAaeoRIDKf6Gc3PTkZLAhZmAAo-8oC7IQEWzkYeSfrZbUTU2T
    lxrU1_tkL9iqi6fLshUmpVxc_RuWnBBczugfhsCOscITEljyw>
X-ME-Received: <xmr:1U_8atf-uKxRRrvxCU4KfhMIkldW7d_ndO8Dbg_Zvimn4hw5aKG11ahRVDZ1ff1IFFjhZQ>
X-ME-Proxy-Cause: dmFkZTEGn5++qhROk0bEMDp+IH+5NF+P5+lDp8zdZX6m/0VmS9lPSrquhyBjqJwI3wFnWW
    Ceywx01iEEPCLYI+Ua1mqUOFw1o80BrofAJqWJ0NOFEyl5GofxVxBiixlrpcdbuuD5Bxit
    alco4XY6FHzogbRzpu6ajNGv1q+Xy/+uLOEy2PukFTrUormzMZlR8Ykf2PQcmzBgHMg1Rf
    fxeWvVWompEpza9Njt6BF61CI5WwMZi7mLwO07BHyPHoZgwszaE/JGvtPF9W+0KfgBlgI8
    vZfGHR3tx0XOeiPZnXWsgKD4HUMbz4s94WesOxudPS48ly69176NKq3zZMp3r+FL06sjbB
    AVPf+4IzOLSvuQJMj2/sdUnrKxBbp3f80yZAsihnortXjZVuVu6xeBhDMygHm/QgIRwvXY
    4GPZCw5KdtdhErbWCuhk6qOG/uLIGwe5wX7nxCH7hkrAOW9XG1bOM5zUA3u81abH2Z+/XI
    MCXek7HNefA3On0vTKCq9/005qrEdYDiVFVZ69FbraxfF0kDnDRt96YnWEL4QQqSDXSgkl
    +nwoAnQiZras9utE67x6Ju6SWd5SSB3pzhy6aryTL6m1j2oj+T3SaYFEg0y8ko1dbyGjgR
    TczdJQZoXwz5Uv1Rs+BeEXbtmeU9MsTQfoGJQk1f1fGAmI1jshQLXig32Lbw
X-ME-Proxy: <xmx:1U_8atyLoVJ6EQBWu9c2VzgIiF8IJ4mn31pkRFNk5P5vSBjSjvgODg>
    <xmx:1U_8aqIJXpCuuYKpabW3B2LBM_d5IaJ2Rs9iOmNhn1XOqK8g9xLgZg>
    <xmx:1U_8anFbll-CR9oEYW2osHvrJwruowj3c73swtTIo9kqg_zbXsUl6A>
    <xmx:1U_8au-k2JQ7lkbQ-a2-Q3PX23ecINNmC06K4Nff8ZN6H-aQp5l2WA>
    <xmx:1U_8alLiB3DGizkGZD5gsWgRJD7X67iUXvet989nT_tddx6lllIPvwEP>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 08:00:02 -0500 (EST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] leds: as3668: Propagate chip ID read errors
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Siqi Chen <chensiqi@uniontech.com>
Cc: Lukas Timmermann <linux@timmermann.space>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261117083917.3304865-1-chensiqi@uniontech.com>
References: <20261117083917.3304865-1-chensiqi@uniontech.com>
Date: Tue, 17 Nov 2026 13:59:50 +0100
Message-Id: <179492039009.10764.11872681480059926447.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794920402; l=194;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=SPxUh1xo74WX2tiLckfcwEEBVierqLvFRyyZ1SNa3EA=;
 b=PpUfYXhqnei7p/3VFe6ai3Sz+aAjeGzQvmqGn95mCUiErdRMrT+N22cJjLrazFYgTsuOMEl8b
 fvzHayo6eABB7AEUW6wYx0P8Z1ux4TUv7Wi6xgJcpSpiijLVVZ/EGGR
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Tue, 17 Nov 2026 16:39:17 +0800, Siqi Chen <chensiqi@uniontech.com> wrote:
> leds: as3668: Propagate chip ID read errors

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

-- 
 

