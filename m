Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37151922C9;
	Wed, 10 Jul 2024 13:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720618426; cv=none; b=grd/672hIuGxODuCSlzKouDvVSzO0hQXIJhbLyjJxG8kXCPiniD2VpG3tjmVQ/JXwZrX4d94tZzhHL1NYe4XZe7rJ3qQ2QVldYBSE4ogzNXDm34QXrqfDS3DPBLvVa5XCyT/nNCokg1Ip0fyd6C7WDHwvWYuEUArhbvPAP2qXCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720618426; c=relaxed/simple;
	bh=2hcCAtYib7Cs+niMrifUeOS1QsLxGjZWPakWKOZUp4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtBP/BDt3jwf01Gg+rr0zRAfdp0OT05AL3sDLtQqaG19p5Gwr8knozOLXS1nFK+oPH82FA1o8KoHyXKbBjg8u05ZcdsEhadZzTlTvmhFII/Q9d/VpkcJ0kMySgPGr4Ovlidt6nvwLagyhAcvRn/068we5gVOQKOmO1Fr20EHldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=M9LTJIu3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="M9LTJIu3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4gA98zOhBB3RrJOx3PzymQJlJUxX+ZinTD7Q9TPm3bE=; b=M9LTJIu34RsAljCahFllN2TIFm
	7yLY9bK78/a/2FpX+BfeqlIkkLlN1248cHRExobbyYzsVodYdxCPAEh/NkWc4WwNMx3txvLQha+vu
	L6SYskNC8Z//ttViCmyiVVwQL4/SJWfu3lx9b84rbPQckdDlXeN0nL9mzExlMa+p4TPs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sRXRq-002EDw-NH; Wed, 10 Jul 2024 15:33:30 +0200
Date: Wed, 10 Jul 2024 15:33:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Li Zetao <lizetao1@huawei.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 net-next] leds: trigger: netdev: Add support for
 tx_err and rx_err notification with LEDs
Message-ID: <8c8ba30d-dbec-47db-ae8c-a734fb2468c0@lunn.ch>
References: <20240710100651.4059887-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710100651.4059887-1-lukma@denx.de>

On Wed, Jul 10, 2024 at 12:06:51PM +0200, Lukasz Majewski wrote:
> This patch provides support for enabling blinking of LEDs when RX or TX
> errors are detected.
> 
> Approach taken in this patch is similar to one for TX or RX data
> transmission indication (i.e. TRIGGER_NETDEV_TX/RX attribute).
> 
> One can inspect transmission errors with:
> ip -s link show eth0
> 
> Example LED configuration:
> cd /sys/devices/platform/amba_pl@0/a001a000.leds/leds/
> echo netdev > mode:blue/trigger && \
> echo eth0 > mode:blue/device_name && \
> echo 1 > mode:blue/tx_err

When i look at the machines around me, they all have an error count of
0. Do you have a real customer use case for this? What sort of systems
do you have which do have sufficient errors to justify an LED?

There is no standardisation of LEDs. Every vendor implements something
different. What i don't want is lots of different blink patterns,
which nobody ever uses.

	Andrew
