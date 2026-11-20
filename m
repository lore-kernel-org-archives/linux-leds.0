Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180658;
	b=zs/gCJkcTk7LraZyFOgfe6xeyJ82Vmd1hvP4IKKYf8pmchhEVyJd4fljoQZoEJEdOVXF
	 8aT07PWT4olSNsJ65f2GFVPCFFj5l9WdHcJWeT8JziA0fvNrkQtT8TQX3cEUK0CeP0oMx
	 oo+YoaJfuKTGQbtQfTF0fTEIM5GjMv+JJB8R9d5Ey8u/iGT0crRTkTiGszRqd0dwDpEXd
	 qgLEjgMwu4pPsCknBdN+2YCY+rShpI8WqlBVZcw5sA8aXWLVugJaCEoKP+n+n4IWsB0gQ
	 kDEXQeWM+1+o4NpKBkhoc7NhX2GfMm4r3ddNzLn7VNYsuBc5lBuV47nciqXqihUIXzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180658;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=QEpJJb2GWfhBKQSusKN1V7BUS7wrMF0xWQF0FhwBGi0=;
	b=VCSUIw7vjwBpdsq69uQE+pyyLqc6nl/FwrilL6XWBP4loSdBF70ouo8umfOoVOeZASB3
	 1es9YbcLARxpT4JA+UboOr5vxA9J21LoDCaJj+ToqQcAHblE2qNSbKI08IB29m0+Y+A65
	 ovWKYOLbKQC9TEnQkMB8OhsunxEe/iwJTeb8jopyzUsB/ssoqnsfO3b9d6dKinX/RApxb
	 Qw4BOJi5JKqni8PrjI0SIuasZQ7F139xT6tzkJ7qP7BXXvcrqoiL3IkuXb3AGZx1jWSbM
	 5D+0V/xuEikatYwFfFvOed2TlC7BLIA0oVfASbL9MRiComNbq5Y4fEgGHum3Pz8azJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ubkNKRix;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D992606A331;
	Fri, 20 Nov 2026 13:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D992606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ubkNKRix
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QEpJJb2GWfhBKQSusKN1V7BUS7wrMF0xWQF0FhwBGi0=; b=ubkNKRixQbYCxCck6jynqvHC+M
	xY5Kw1ADj3rNSvUgTkZ/srl3Sr3ahot3xEFTH0zj7V2xsuO7vhN6XV9h5Jrx8v8ZDN3tZFhH1WQZ3
	8+GazYF/z3pDnA3gcO5PTtZFRABr5hYLI3uzpdCuRw9TmMZ1Won+9TiMptf6lpc0ncFk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUOUY-000IQj-RL; Fri, 20 Nov 2026 14:17:26 +0100
Date: Fri, 20 Nov 2026 14:17:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: phy: dap8211r: add PHY LED control
 support
Message-ID: <132e848c-7489-42ed-83de-6cfce4dad265@lunn.ch>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
 <20261120081106.2919010-5-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261120081106.2919010-5-a.shimko.dev@gmail.com>

On Fri, Nov 20, 2026 at 11:11:02AM +0300, Artem Shimko wrote:
> Add support for hardware-controlled LEDs and brightness on the DAP8211R
> PHY. The chip exposes three LEDs that can be programmed to react to link,
> speed, duplex, and TX/RX activity or be driven via the force mode.
> 
> Implement callbacks for led_brightness_set(), led_hw_is_supported(),
> led_hw_control_set(), led_hw_control_get().
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
