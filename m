Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361403;
	b=gFKgqbda/SfAekBxy+7UNnIn4Bc/r/HwzIvUu9UF9bWhzFOzj2nB0b4g/Rv3fSABbCq/
	 UD7dBL1s3Ix4TSyU5fyLLapu61ikr4H9bDAZN7c7s7LP13sORnjRh0f3BpJsclzjfK7hk
	 8N0yfY1fGKSD5mRcUu/vz12xZbwlsTwNmTIfNAg+59E5X24SIH3zaEmi+C+54sajCqovQ
	 dq1snFDetlVPJsuiYlBmiAzEsjmNk6A+JlgDUtVkKs3PZU4K+MlLgSA/1XgVxR0RoWk88
	 T1u46xLOYIPgNizzf+9K0e+QaO+TR02D/78uNYS/lj7IC+n9O8SZ0ZAoVQRmwDKzoOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361403;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=20Y/fHJbrgGxPVB4aZEd+tb8QnnZgYfIRFUWAPlj9yc=;
	b=apYir0vJfBjTKrXm51WKSKIj43URffGgnyyOPk3Zz29dfl/u2M1Zte11jkXpJNfK2OlN
	 Bswm+pEY8IPEM7pJbNd9OOMmKX499M/FnAFKJaxNVshNghu5cK2PpKlxWpWsYa3B+bEJR
	 Ipq4JA2Z8WERQ8AKzZhkgEXRXxYJxgDnwmtFWEX1FwEkKPW2pqvsRvIKpqU4QCSlNkO45
	 V7/Q47tzrztAMkDWv9+PP1WsfTfcr6Yr1vRxXEHVAc/kxooP5Zdd8DYatml2LLwz5T7sZ
	 9FN760KXL4rlav4achUB/azba8CO/YQfrPXnn/Oh6VHXKQHVRLOGnRclKCpiIlmTb6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cVyc3WqH;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F45D606A320;
	Sun, 22 Nov 2026 15:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F45D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cVyc3WqH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=20Y/fHJbrgGxPVB4aZEd+tb8QnnZgYfIRFUWAPlj9yc=; b=cVyc3WqHhc0P187aglWwbk/wiF
	D1BjjI6WleZ5VxadNEDVZFo0y2BnCwswzyUREvDRlGa4RcBxQJ1ce98L/96gGpR5kjr8rJ/umXCdi
	AOe/PYNzaW2hrTFurJkfpHHVtK+b/c3jdNSXPRe2LejM0cUIpV4V611b75W0Z5zpDLf0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xV9Vc-000aRT-Sp; Sun, 22 Nov 2026 16:29:40 +0100
Date: Sun, 22 Nov 2026 16:29:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/3] net: phy: dap8211r: add PHY LED control
 support
Message-ID: <f9c736ea-0c8e-44b7-8f1f-1f62aa038987@lunn.ch>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
 <20261122131900.2951586-4-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261122131900.2951586-4-a.shimko.dev@gmail.com>

On Sun, Nov 22, 2026 at 04:18:56PM +0300, Artem Shimko wrote:
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
