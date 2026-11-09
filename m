Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239797;
	b=JhuGRcIJMlSduaCix2TCyOcqzpyMrbJcV+S2UDCnh0MxK9nKAjTcepvwPJ0Btw2hOEU3
	 6XiTlAX71VLoD/h2NP9ReqKw4fU6q2RTqKr1HIu0UB8JHC8kWQ/h3ZTdOWtnbF4Al9Kwp
	 nQAKqnCIuL4F2+2qjlt2uBoL7xoUQqfDv5czl1JQWuvfQCN312QuYdYajoWj9zZFQyjV7
	 whdDX38PcNWy7+TqZlEUcJONQHTlHQyUWhmN4Ycg5tc5EPW/7vxy5dR5ux8U0AD/jUel/
	 mlEYauypwlC3VlaWFZRt3+WbZYCCwuRCqTdw87jk2HHLFL7qMr7JVGKHhHm4uzFADQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239797;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LDCJlYvo3vx3tgjCW58/ygfsQ/e8c8gyHXqxxnH8sw0=;
	b=kjRh+qmYSZYwOVXRbz1XiHHBHqM5jqRGrdQSKexU9/GcYoGy5QhUKpLvbFoejPU0oKh1
	 gw4kjISRkxe18J32TUngGMEE6RzFbrpRr6K6YERdqbub6RlvP2auGVGMesaLTrEdAQgfl
	 xlNr3wKRsCXEYHMptGeTnV4+IdBola+w1W2l5qh3tUFfD4VLxguUQXauMOxFmOrwKUgPU
	 F2S1JAOTMVxJ2fwsosJgWGxRC6bHz/a0p0z4Odaod4g51aFIewBx0m3EXzEtgcjkIyceV
	 ZmlAnMVJoKiqXpNDAtdG68/Pa6ogVdAiE82NBKQTpziLFTwUCYQYKI7vl/XzriwATAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2g5VFot;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F80606A332;
	Mon,  9 Nov 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2g5VFot
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E761F0089F;
	Mon,  9 Nov 2026 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239797;
	bh=LDCJlYvo3vx3tgjCW58/ygfsQ/e8c8gyHXqxxnH8sw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c2g5VFotjOrPFeuDvt34poEE7tFh32Vv87ULGd5VN8O4oVCl/ga+6no88HJmKJLv6
	 7fSPBFp+0Z2OyJXAB4t+9czxvkN2rrMorsp8xudAlJOIAz/iTndP1pfXlTWBgp3ROv
	 hI0FKahkqj5Yk1atUMKKkc4rv/LvJGx8Dz8CsKqGN7l0XPEFBswe79RL3MXu/s1BXa
	 V16KV5ijiF565TjW5Rml8crmJJ4QG7cQAS1elbwjS+A0ifb6go3cS7w5NO+JYk3iWk
	 EvsJc/+OfI2M1ClxXqz0mtJL6JO1XYo9KWYknxi6UXYGVv09B0+zi0zA9xldawPqDM
	 YfsP3j+qe2L/A==
Date: Mon, 9 Nov 2026 15:56:31 +0000
From: Lee Jones <lee@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Alexey Min <alexeymin@minlexx.ru>, Nikita Travkin <nikita@trvn.ru>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/6] leds: aw2013: Add AW2027 support
Message-ID: <20261109155631.GA69935@joneslee-macbookpro.roam.internal>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-2-cab1fdd050b6@postmarketos.org>
 <179198402838.839288.17911568760182808689@kernel.org>
 <5b965360-7121-41ab-94f6-d23b3eace32f@postmarketos.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b965360-7121-41ab-94f6-d23b3eace32f@postmarketos.org>

On Sun, 08 Nov 2026, Paul Sajna wrote:

> On 2026-10-20 3:16 a.m., Lee Jones wrote:
> > This is hard to read, I think we can do better.
> > 
> > Also, does it need to be a separate helper function when it only has a
> > single call site?
> 
> The function is marked inline, so there shouldn't be any performance
> penalty, and I gave it it's own helper function specifically because it's
> hard to read, and giving it a name helps make clearer what it's doing. Do
> you have any suggestions to make it better?

Yes.

- Break it up
- Add more self-describing variables
- Comments if the first two aren't enough

-- 
Lee Jones
