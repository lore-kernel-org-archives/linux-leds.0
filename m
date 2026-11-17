Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923400;
	b=TLtx7mkLJgSkcDfkJXVvPglI2A3YpheH9ra6kM6VYlHKOFCHH1oLt9A6NAYzuxjJTJkW
	 foPaLHKtW2IU2l8B4UiAutGCV99VJ1nfSsMb9PI95Y1ZVPuHkDYWGLiBMNpjLR9TuEZn3
	 8x3OAFaaIN11Gz4uHk68xeVrKH4u2Acw8Exlb6UMUzOUWh4TS2OAfbsy/TUNsij58vsuu
	 1NXIQI9Jj6pzHz3XgQLUN0WIG132rSr3IHSIvOdvLaO5HO2PW6/P7A+mJ7skvhMUMUFFi
	 k4sm03f2MFQiUZpW5gwxtBFtbFyesTJ0J9lyjcyIM5eqcbwKXyfYXchTu2AxcnapOsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923400;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DFplsQOv3v82j6NbtcpaRb2ryRhCol3Ad4OVMtYAhGA=;
	b=dBM9JmtjrpZcZ945OSqD3d+LcXA1MB+pXgpkKGjWpIGNUO+wVe6+z8NVIgmsNNSlgPzp
	 ayMcSgt6wN/l9m0AuedGwG+wRGXk/A+HuExzswFSewpqug9G7EYnTEuXRofcAEhmIeEIB
	 mM1zBYdVgDkGj0Qn4yMkBB1OYFIObCQGNO6fnmF78k4tS2nQd0/ecSH2ojyBo6ySOJe4N
	 fho0Ei6+eZ6QRruKAZaFJ4ZnMXLiwjRVFSWkhugsCUDu2rhsUA0ZAAT+aEPuXeiTVk9JD
	 we5oVLSUvD/+kJeGI/7uaQUXWLKdSBkObY6Cds7oVZyz58JVfGOJolggXsi+inxDrXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=z0ONRwrw;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1222E606A323;
	Tue, 17 Nov 2026 13:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1222E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=z0ONRwrw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DFplsQOv3v82j6NbtcpaRb2ryRhCol3Ad4OVMtYAhGA=; b=z0ONRwrwycZllFmldL4Fw9EVZF
	vfJ9tmHLwpVm/hNXHqfiw4i9MYaay8AHA6w8ZyiVfA+MnnOHAFObC9jLq0EL3esj4bQTERnWbnI1t
	PrL11IV4sERQIb+4A9nsEg/sEnj0dOrhLyTHV04SWVFg8566PgbyYFdBGNoT9Ikr/zZE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJZH-00HA9g-7W; Tue, 17 Nov 2026 14:49:51 +0100
Date: Tue, 17 Nov 2026 14:49:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: dap8211r: add PHY LED control
 support
Message-ID: <6b2ffa4d-b99c-42d1-8729-00f180b955b2@lunn.ch>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-5-a.shimko.dev@gmail.com>
 <052adff8-b1d4-4cf2-941c-cfb2725d13a0@lunn.ch>
 <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com>
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
In-Reply-To: <CAOPX745DQDpYh=PNQxDkH1DbfwMRwD8DV81TaX33mNk-9aX3oQ@mail.gmail.com>

> Sashiko said only [1]: Sashiko has reviewed this patch and found no issues
> For some reason it replied only to me and linux-leds.

There are two different bots. The netdev one send emails using
netdev-bot+sashiko@kernel.org, and it gets the reply addresses
correct. It is also more accurate, less false positives.

	Andrew
