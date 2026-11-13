Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601714;
	b=jIx+Hpr4ATdXK9B77KtjWtoCD1vZ9LFaaGSVyoqX3VTEHMNvwzdRy7sS1cBWr1XD3GzK
	 Q8NSwRVohiQRkI4BxVHgyF+k1eFRxkJYZiFh1SE0+guXW8gI0nTpD2c4KcAIfEAqL2NzN
	 XNLSpEAOG+ppwm7FzXMORHNm1HHBj7QCsIvBJWhn6bd4b5PrAnESgRR/maa5StwgeI3Al
	 GGyM8hH8fwsUWazYnImfaHvd1OCcFBhuvmIu5oz3NigKm6gOMIRsw5O6ntMd3MfM/dyq6
	 ny0dXeBCrxyvHBMRMeMOawcOVt6uHrW8NN+kVb32fQj9uMyKTfP8kpBCsUsOHnr8fFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601714;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gaD+xb7cU1GGj4SMRBCAddtYxjohBzdn3/H4c3ybKBg=;
	b=FlmgdSlgrQfMSXhDGi5ULBl8E/wcSpVwdjK09HkqPf4h1ssKwJJBDnuOaw8LIb4e/sbC
	 lEosjm3bG7fLbG6zf1a0LX6VVU23opSW5GjGo8UFGoHSMjfx3HpWskkVO4yAAihNCF2Aa
	 RbKxjjRdMRuLxsxKEMQRcqcHh47gc3sYmVjf0OFMdelNspUNVgd2xLlJdeV4zi4PT6SHx
	 8Z1ttVB2cVGTJNSKqw7vhmOsIwPrshUNgmPpQXu7x6kAdezj7fhDEyqK0pkT4G6GXVsUN
	 vEgpoigEy9jfnnZ70HKkqds7awTVxtZN63rIIkmX57tXXwO1tFaomwhgV12xZAP7+mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RZ51UcpA;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB594606A323;
	Fri, 13 Nov 2026 20:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB594606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RZ51UcpA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gaD+xb7cU1GGj4SMRBCAddtYxjohBzdn3/H4c3ybKBg=; b=RZ51UcpAhDfFYthIQyaCqUG+Si
	EEZBY3IKu+hb02QW5rh1a2hlZMp1dDdNZg6u4ckbmNOj9pZw00N5pHHx6rC9jxXYsM7epxtazew99
	Ktewk8DaF1rzt830ww+QfBjrnS5tZOhY/LNiGfqxOppwIuubS5pe+QCEBy60GKrpjG7A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xRxsd-00GMG7-3D; Fri, 13 Nov 2026 21:28:15 +0100
Date: Fri, 13 Nov 2026 21:28:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: phy: dap8211r: add extended register
 write helper
Message-ID: <583c58dd-3587-4c2f-af5b-9b4a10fd916c@lunn.ch>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-3-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261113110546.173624-3-a.shimko.dev@gmail.com>

> + * The caller must hold the MDIO bus lock.
> + *
> + * Return: 0 on success, or negative error code
> + */
> +static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
> +{
> +	int ret;
> +
> +	phy_lock_mdio_bus(phydev);

How does this not deadlock, if the caller is already holding the MDIO
bus lock, as commented on above?

	Andrew
