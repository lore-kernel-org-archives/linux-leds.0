Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922261;
	b=5mn3UfdH9sT0GOMxfXzyo/z3Z0Qz7BJL4B5gtjAENosqYkzOTh58Iptu7pKWIzpv3oI2
	 zUYApmSRFDPb9ddpk6zkvduvrY1ramOQq0CORSRciDmgQo7mUcvfl0k1B5+DcK3+V4c2y
	 CsW8i3nTkRjnkBPTanew4VeM3jWuMcxNo+StWnQeAlDoKMzmAPI/bcXEV6EP5Bb+fO851
	 IsTb5CBpQQGF9j1sGFGa1VukGB2r8QKAezhfZR2IUfe2QuooZn+YslZvPWroqoOKWKKNN
	 KOEuQ/qDMqJBhVYVb6LZvSkAivqBTpqzw1gHjz3ph3n5gCJHB/THcoCQy70uDZLlhXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922261;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ErYW4Dk/37MEk57TzgZwTxy2KohUx+8OW0jZ5/gYDhc=;
	b=NMayMO+tfd8B8a6SMBlrMQ+Cs6nvBdrBz4AcOy0YkimJdxFb57dha3ZQeQFzjR5FS8o/
	 UwzCrKxvo/ViW5a3AI0KYQxccmXgyUxnWIFi8fMuxhdVubqNQkRTxkEmJGQQ+JaTlxZo9
	 cJVufcsoiWbMaSu1TYs9LUcSsu+P2xxcZzpVQjL9qB9ApPKtnmDwOWNR2HmYhBlfTYBrN
	 no51fy6ocvRrkt9xrU1+m7SvSNZ88Z4rV7ozat8wlOst4hYax2RR25rbpjzcJf12zpZV3
	 7kPKTk9YW8fPVyvPLiI/m+hMcQhIAb0zesnXColgumK2H4WgPU7sbpIXIBjDMvTbrcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=mZG9r5NP;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03C0606A31C;
	Tue, 17 Nov 2026 13:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E03C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=mZG9r5NP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ErYW4Dk/37MEk57TzgZwTxy2KohUx+8OW0jZ5/gYDhc=; b=mZG9r5NPQWzrZ7TjWceOm00GAh
	nxIW1D435wlUR8+jmUyhU6Bt6QU9MC+txzCa9X8f29h4EvDblC3tFLOirgFQy6ln4VKTulm4Ne3Lq
	9vNDrBGxVnpjzVgM6ywH1MmOCiBn6Xfrecbjao9yfuC9tIFGNAEh8rl2o9lcJshsOWTQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJGv-00H9v9-Gk; Tue, 17 Nov 2026 14:30:53 +0100
Date: Tue, 17 Nov 2026 14:30:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/4] net: phy: dap8211r: add extended
 register write helper
Message-ID: <c4df1d96-c946-41cd-ac69-07bb3970da7b@lunn.ch>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-4-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261117114432.2794961-4-a.shimko.dev@gmail.com>

On Tue, Nov 17, 2026 at 02:44:29PM +0300, Artem Shimko wrote:
> Add dap8211r_write_ext() to write extended registers via the indirect
> access registers of the PHY.
> 
> This will be used to write extended registers of the DAP8211R.
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
