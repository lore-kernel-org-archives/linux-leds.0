Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556839;
	b=HN4aAKr55jkTOoB483SKYRP34/zLyS7fvDd06q8fnUM5zdXW/eBvZKzT7YBsBPHUmzzB
	 oef4BmgUQSuEWsmkyeXvpNoYPhtI7r67ckD1cMg7u3ekEOIQ9bk/KeI/A7Rynfx89q77M
	 0xrFRkrFJ/fKqEBzz0YErGZZUfWhrz89IuBg5lJDRxt25c7ENg6GF/WzkKJA6kFC8T9dx
	 LrQ8ZEKh4xHVwkKoUQYZMRf06774QLlaXIbgQArlg7uhUn+a4LK7cLYFPvtvgesDHnZwn
	 Y1dp2e2d5lVahvZYcjldviss0mLO5o20IlSYPj++KVGVh0BWDiChPSi65nIF2f+ySog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556839;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=rpReIrGydvNzZCx0HngqQAENODoBCxN0USwLpsBzZ8U=;
	b=Xq2EdSMeAe+efoLus1ahaUd4zaElkktey0VGvAC57h+Znye7QJxcCsTs0txZxBZ2/f7k
	 +7I8fxqfqUnKj6rNQVDOSy79nTOMgogHSI725YMPaBLCSqlha/WGuseBta0Xa/rzq68mg
	 Xm087rCBoeZV8WkRiTx7NZ1g9GWhIUlgBCjC3CHU04k6y7b3XkbR4IbxNX6Y6s86d6m1u
	 7ISDweCSa8euHb331mFchF7I1ACuE6NDV1VynT2jIDacsLwiSzahzdtjCR7kRopfUgzvH
	 e7ZvUK7xlG+7sl+iB5Oxo055mfNMtItuajgNhjVw4i37yo1MfFFjlRJ+E6gr9X+TUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=SrFAeI7e;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F192F606A32A;
	Tue, 24 Nov 2026 21:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F192F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=SrFAeI7e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rpReIrGydvNzZCx0HngqQAENODoBCxN0USwLpsBzZ8U=; b=SrFAeI7eANj+CDZC3B9NLqMQEi
	jdm0LHKbQz8KaNgknDt4iFPn+hOXCNF1noktuSda72KzjLtWyxvi326f77cApDcfMHr97VcFXkyjr
	xWIGFtzrGlS++Y9OLsCjZUfmKvwddbebqMWthi2jcPf+eylfvzSe6t3HsgU05p0sotEs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVyLv-001AmX-Mh; Tue, 24 Nov 2026 22:47:03 +0100
Date: Tue, 24 Nov 2026 22:47:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control
 support
Message-ID: <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
 <20261124094914.2993988-4-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261124094914.2993988-4-a.shimko.dev@gmail.com>

On Tue, Nov 24, 2026 at 12:49:12PM +0300, Artem Shimko wrote:
> Add support for hardware-controlled LEDs and brightness on the DAP8211R
> PHY. The chip exposes three LEDs that can be programmed to react to link,
> speed, duplex, and TX/RX activity or be driven via the force mode.
> 
> Add the dap8211r_write_ext() helper to access extended registers via the
> PHY indirect access registers, and implement callbacks for:
> led_brightness_set(), led_hw_is_supported(), led_hw_control_set(),
> led_hw_control_get().
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
