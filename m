Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596551;
	b=D5EfYak6Sa8I4L1uXoIi7A5RgUYSOXqjRYP1F0ybMdHWp/yF0WF8NG0XOajHa4H/p7z+
	 Dxsffvd4x/wmHcS1av/JH3NHmwADRI8gIWu3lUmAyaQ5cIw9ykc1LM4TsepfqysYnnnnV
	 xQiDX16Wdt7Vg3KrwaM9m2xFGfpqbzvZfDJMRv9R4gBmkkgotvKtE/ZDqTaKPGAxGo9U6
	 NFdNyN3T8oybIwHdKcemeyML/K8heQ3BY4B/0Qytudcf29XJNS3/HlBJyZcCKpWrngsdz
	 PkriwPF8Wr+eFdiMg2h5lVEhtkw8Brg1X/dn8Tx4X4xR3TdycdIxnL8EhQtLCSQT4jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596551;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=tBSGBArV0TzzQ40XhlsgJfzi9SG/oFg7XPpNBnzEA6M=;
	b=K0M6kB8ceGO8Q0fo6tBCxYHHGuSExwOg0i48t3kJsCXeFX1m19n51ODpdzmoVVbqw0bU
	 6lVlIkDUNUHhHc0cmIo6K5XeG7y5P5EMscEx57VDQBJ+BXNGPw2SPoCbWiFZYNjGNTpxr
	 NYAqaKjTh2s6XuKZzKV1VmWcF4o8M6Pv5B+ON5hOHc0su8dhKEh4+rmj7nV6qFHxWWnMQ
	 ypfBaenoFES1Vj0J2SEhJXUmuj1v0Gzih0XuwIshzNzQkoclT+kVKfbKc1nM5yMvT7G+N
	 iUrdAsCoA7Y4rWrEeRZ/CeJcGEU6WDIZ3jXmeuDaQ3hJ1tiWoF+XiScSND/+HTXTSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=arP2LL2V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAA7606A331;
	Fri, 13 Nov 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=arP2LL2V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA391F000C4;
	Fri, 13 Nov 2026 19:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596551;
	bh=tBSGBArV0TzzQ40XhlsgJfzi9SG/oFg7XPpNBnzEA6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=arP2LL2Vdl3fZtDnnpwenurVheQkYnFtnW15Oa39dLTSFZhAwlMe2OV05y0OPxLmt
	 7nmJzUYBLm6wgm9xiTnY68KPGRA8S8Nm2ujvjQ0609ysXChkC0nlqktaHEXkOIzRla
	 kqZRidbMBM3wGr90bn0jcCHBoA7/v7pT084euyy7EJV0pHEDQYkCrxegKh9msgmftn
	 HRu8ZLzV3OtE+f9rxm6CUboTeXcs7mOzSc3wED9cHRGdcAm6XC+d/8EhSGM6Vbzin6
	 IeU8BJVsgqYbWFdZj5q5AqefyHbjLe31bgx1FE02Mi8Ah8M5m/LbCZn1QRmtdLY/UE
	 DhmoDArUVLdng==
Date: Fri, 13 Nov 2026 19:02:26 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Fl=E1vio?= Amieiro <flavio@amieiro.net>
Cc: Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: is31f132xx: Add support for is31fl3206
Message-ID: <20261113190226.GJ6323@joneslee-macbookpro.roam.internal>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
 <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
 <179370064610.793788.8239015594326628135@kernel.org>
 <87cxs87jyt.fsf@berlin>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cxs87jyt.fsf@berlin>

On Fri, 13 Nov 2026, Flávio Amieiro wrote:

> 
> Thank you very much for the review.
> 
> > Lee Jones <lee@kernel.org> writes:
> > --- checkpatch.pl (1 issue) ---
> > Line 83: WARNING: DT compatible string "issi,is31fl3206" appears un-documented -- check ./Documentation/devicetree/bindings/
> > ----------------------------------
> >
> 
> This is documented in the first patch of the series, as requested as
> part of the review for v1[1].
> 
> > On Wed, 28 Oct 2026, Flavio Amieiro wrote:
> >
> >> + * @enable_bit_offset_in_led_control_reg determines the offset of the
> >> + * enable bits from the least significant bit of the LED control
> >
> > Make sure you run W=1, particularly when changing Kerneldoc.
> >
> 
> I checked and get no warnings with `make W=1
> ./drivers/leds/leds-is31fl32xx.o`, `./scripts/checkpatch.pl --strict`,
> and `./scripts/kernel-doc -N drivers/leds/leds-is31fl32xx.c`. Am I
> missing some other check here?

Ah, it's because the first one is spelt correctly.

This mention however, is not:

@enable_bit_offset_in_led_control_reg

> Again, thank you very much for the review. I will address the other
> points and send a v5 as soon as possible.
> 
> Best regards,
> Flávio Amieiro
> 
> 
> [1]: https://lore.kernel.org/all/20261013-jolly-salamander-of-tact-7cf46e@quoll/

-- 
Lee Jones
