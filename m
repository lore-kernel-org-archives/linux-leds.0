Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176073;
	b=JBvpkMxSAnSA7PcdDwj2ZF3D/bk8ug7vfQr5iDvZd0mtw4hPGo+rup9XvDGiGTSyzW3r
	 MUEJxN2RbbRpb1RzJcuWrnpR7NWdITgrrTkv4lfKkAztLQJTXuvm7MTGTWmv1btc1RHyA
	 tGyP0uZqBouKatwRbBpJ/mxIiszbEsCCHiLuS/lrCqFH7iWMDvD71HrQSipmcIFMB+LE+
	 Q+vyyA2C6WtZLFupceH/H+LGj9hikvfJMbdECO99KDclql5mapvLZ4zClEp65kYX4IMfv
	 5aIWTfuTMPRCbUp7MJrWKiVw2vELagaPuGb2Xae7MQW23cY2ts7tsrksTwUPis5+TjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176073;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CLiHZ359KGgedyzcPmhmLpBcxIrOKuJtW2Ry2Y/qR1Y=;
	b=X77EbrEB2/Efad745Xl08mrHHDSmcKiYN0qBUXGPeoNbjPb9c8pCwXshxZhu0tlqMHiP
	 I3eszbNeey90y9HaUKZfZxC0PZ1awKnifErWqas18xW02erXIn1J5JPP11X6Ow/CLaRVg
	 KUWRoRpTnEEFdvfPQssgD+n8DsaOg2kyIlLoyDEDlFfbIZnfzi/s0n3dJ67QqKw/BpIBV
	 ZfYPC23cUfWfA/4Uco/rxl0DendRiyoFFrX0cJm4MISn2+f2H6XJhZKVhjI52Su1rSjaJ
	 pbRn+gIhCSIVy7xiXz4KVlK2k7MGky52Sb0H21lLkDGemASi7sUf8LrwPncAz6yvWpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jl3xKfQT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79635606A323
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jl3xKfQT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2484E1F01829;
	Wed, 28 Oct 2026 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176073;
	bh=CLiHZ359KGgedyzcPmhmLpBcxIrOKuJtW2Ry2Y/qR1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jl3xKfQTz8jpTSdfNq6Im4JAC9Yfc+hPBVMo3T0JqsgTnm/FMtMujaEf+Jsju6oUj
	 0OaTUkB27xgqELa5sLf8Ll43ENQk/gT9ORODx1rMKO0HEG9ecVGH30x7aT7DwCqS8o
	 lfiPOZU2rBhIp5u85uZdeRaLA36iKBXQYnaBfuwDz5yw/viZ7WttV5YG4705FmvZdK
	 Xc6GUGXFo7eaEOoAfHGvE4r6lnbtBNAIeGfGfFkllg61ptVF0LxmR2Qa7PfxModwRu
	 Og0RGxXoZz/rg9dtoLh+cgBsmE56gEeFAllkb6yke1T13dmGOkPp2KL6m9u7cxcaYJ
	 LeGdQ9bn9DRDg==
Message-ID: <sashiko-outbox-187626@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] soc: aspeed: lpc-snoop: Switch to
 __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <6b82201d601c23bf8545f8d581fd6632c36cd208.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <6b82201d601c23bf8545f8d581fd6632c36cd208.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:52 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>=20
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.
>=20
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D9

