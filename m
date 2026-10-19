Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425778;
	b=iZqQsfzFuc0J2EChIGkCAH9LQJn7yQrv/5grCblJ52qdUkbuGfxh9DEBv9fzeeAh23wt
	 jTy++zR4kkNLRo8qFIFseGNwnJ4rFMqEPy5YXcNi/swTm4KRbYsBBj57YmQJejY+cNSBd
	 2+YmBMj+CZUjyGRFZ/AT1coIVw1UyHyAK61zjxXPTXW3WOcLFiIYWhp5FoSdTcLPjCh81
	 fShgVXMJjj49CCUXL1c8KaidyTjXkuXlF3omnYiwj8tndmOVbIDW1nsH6PUlfTfkrEYmI
	 ZSGCbuZ7eraemXKQLUjWuoV6wmWiy825zFDxmMDfwL0WsHQfaL7wqGyIjRUPSywR9pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425778;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ITJ8yIetg35lCIRQBlcQOGRfAvXF3Ts1ep0THPstLTU=;
	b=jTyubEKMr9mPUnmWziEMGzAECRXsbEdRuSeu+aRqM5V/rp1EnJEUfZC7TYqCo6VaqN9R
	 m223D+b+cDgGF82hJDxb3B0U5Y5JlMImoBJv95d5MDn6UjwwqegHCkxvbqX9arV10r0Pv
	 w4aQfuxjJaDws+/0b7Mt3C4UTUj4eM3oQKPogoT+D4PQ18ZIOqd5jkmkNxrrXVVRcNqdX
	 MDCnVQI8RxtVc6kWZZmHP0FNAOWj/4n0zCEIanj2ym8TyGTyJEobQDUBJCB58n95H+9cM
	 w65rjAG0xOiP5nFhf0fM9O3b+L6BNv7vhdcShlXMZopa8rr6wRijJksi1LlZonTe+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIrwSz4v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A8606C930;
	Mon, 19 Oct 2026 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIrwSz4v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4A71F000C4;
	Mon, 19 Oct 2026 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792425777;
	bh=ITJ8yIetg35lCIRQBlcQOGRfAvXF3Ts1ep0THPstLTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QIrwSz4vn8mYlEUtvQk7ZPC24EVxgFOevfn8YAVykkO9cCap95TYD5/0qMmMsM1RW
	 ORfyaoU8MTdrUmBaE8WhFSSlsEq5HpPLshRlyTP+1vqr81klDrsahnWqeWqEfeGrF4
	 VLrI1BRsqtNyZ4Qm/YRRNtauanRzElPipysv6vwJIyuiRboHdmWOMm2+9LZ56g/Cln
	 8jm3Z6Z+JWZZv9ucaluFh4gu8AowCmZvodm1tlGBu2fv5xNKZHRSlplEXSxLxWXBUB
	 uvUd6MF3UXRScMYVJgD1lS1jWQkrYMn5AwGNo7d/tGiIyQJor0Zb83LKpScEKCdLjk
	 jSwvxr/C0FJSg==
Date: Mon, 19 Oct 2026 17:02:52 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max
 current
Message-ID: <20261019160252.GF2663669@google.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-3-clamor95@gmail.com>
 <179198332384.839288.13126529382772558553@kernel.org>
 <CAPVz0n14BhmK4P-tqnt6AMrAh=W-HPoBbP0ztdOrRd_JocRSqQ@mail.gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n14BhmK4P-tqnt6AMrAh=W-HPoBbP0ztdOrRd_JocRSqQ@mail.gmail.com>

On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:

> пн, 19 жовт. 2026 р. о 17:44 Lee Jones <lee@kernel.org> пише:
> >
> > Wrong subject line.
> >
> 
> What do you mean by "Wrong subject line"? Specify.

Backlight != MFD

> > Please review, explain or fix the Sashiko review(s).
> > If this is a set, this request includes the other patches too.
> >
> > > The AAT2870 allows only 32 steps of brightness, with this amount defined
> > > by the maximum supported current. Remove the need for max_brightness by
> > > calculating the allowed number of steps from the maximum current.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
> > >  1 file changed, 10 insertions(+), 20 deletions(-)

[...]

-- 
Lee Jones
