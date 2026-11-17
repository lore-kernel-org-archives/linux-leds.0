Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922192;
	b=4NkvePCXtX0n3dhPEYolvtFaSqLCZTAlO9FlyMW3hTY1DD1tfZRvdH5rySC7OqWaUChL
	 fE5YhyTy9zabdmzrAows8qDtlduzgJGSx+Ztp1nKd4eKE5STMCfg0oz9cAJ879j5o2MfP
	 qRlj+q5J+5Qt3upEdVse/V/0GA2vDmXh074PG6dbo2xioJLFB+BM+dsNhuFwPFO8bOxAz
	 KY1nBIdaL27+A1pVto5oiF3VDqW3I507UhEAh0ponaWNrNirYmDEqSMSBbJCp4jN9fxti
	 oBeG4Dc2R6CCtuTlqpip0OGRFOARgqVz9sjHmmrIQNgI/vnmhA/boipxG1tLWAgS4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922192;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bsVnX1KyDIRRck/Ge0hH5qDt8MGbiPeNYR9hz7k7iFM=;
	b=5Qd5GNHlTQQjGQTg+Dq45GdT+Njwj8WyCZlKvO/w6FkbMvS8uwryHwCMkI8298RE1q+I
	 RskqPY3y/9j3wBSzf6D01MgM/53DfREk8ZG1IJA4v+Saks+lTcguWmxUiEB0oXrjr+L8s
	 xrh29+h5vgA6vSwQnkkRvFez7X1vodEkA39F7TiQ5EBj8ka4hP3jgD9ufGvBj9JixygPS
	 kFo6IPBag6iyXfrqFuhSPuIyWvhfD5lasgDmpjAQ2e/+S7OeDjr9jEDTIXDeAYHJ0B6zC
	 czx3IpVV8hsolpTUPPoBjOiy3AhYPEZHmKC1/4tFBbK32PeMxzjbrRvuNWwVeMU5gIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FtRU4gpj;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865E606A31C;
	Tue, 17 Nov 2026 13:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D865E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FtRU4gpj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bsVnX1KyDIRRck/Ge0hH5qDt8MGbiPeNYR9hz7k7iFM=; b=FtRU4gpjS1lpGg1R2l8qnzEPAI
	SKThOQRP/sgJXqt7nF/r29HzZTyIUEjMfCbol4olR3q65+GRW6qWOL/5I5mTTQ9MWcXHd9cUIta4w
	ecfzw2eriODAzLj4UutuwL5CiqwCGaF35uz0KyXz1/JudVvpLXTp2xYHp/LtKO4aBQE8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJFn-00H9t2-1T; Tue, 17 Nov 2026 14:29:43 +0100
Date: Tue, 17 Nov 2026 14:29:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/4] net: phy: dap8211r: fix kernel-doc
 comments for extended register helpers
Message-ID: <3918164a-f1db-4dc5-9adc-23c224a1d98b@lunn.ch>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-2-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261117114432.2794961-2-a.shimko.dev@gmail.com>

On Tue, Nov 17, 2026 at 02:44:27PM +0300, Artem Shimko wrote:
> The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
> incorrectly state that the caller must hold the MDIO bus lock.
> 
> Remove the misleading sentence from both comments since the functions
> lock MDIO internally by themselves.
> 
> Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
