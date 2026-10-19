Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6185739FCE;
	Mon, 19 Oct 2026 00:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368169; cv=none; b=oYGYiF5zAg3XvKMbEB9Qnxki6ZmjGkzwLBeyYCq/83QrYXx5wCHXlUkL4rkA2g7GD/RLAMcM6yJvSpYS0b8saw4mqy+lm0uNk+Vya2dODvY/dN5/YcA90YljsdDVNp/xv0SC/M54AXMjy0je7KaLMAvY5IiRxBHVoOpjShl56JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368169; c=relaxed/simple;
	bh=kiRmWbIigttbPI0W84RnZLioWzJTfvGGdwoHwvS28Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCFCYONU5yLlUaXA7JM2w7eHffE530lKe/rYFaU7n1DRhw0kvWUYtIJY/tXoRF+bmiksFtm/w3ju7hVu0wI3fShHWVIkwqrTmvNoJs+0G+znwB7BfizcVzgXUa+xAnCnPtYxf86al9s2HOhtusWWLaRnYYRfV6EGpO5mwOTRxo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dx5ufkko; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dx5ufkko"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8ET68I96kFH7mW1zapDe0LJP2HJVVap3gTcE6h7LnlA=; b=dx5ufkko67FlnqlX+OOn1XbcGU
	bYebHX8uIcCLRGyO6xUzhVU/86qZ0JXSKcUqGh6rgJAD8m+jm1yCQ0FngjsDf6n1MCHekC4O0miMR
	QUr8fvjNjZF8knxYBYWXYiSgyzP/aWPa9yKfouYi3bOAYYPnF8pZbvcXLl+kXzQ6wbR8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xIapi-00BXLf-53; Mon, 19 Oct 2026 02:02:30 +0200
Date: Mon, 19 Oct 2026 02:02:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ross Cawston <ross@r-sc.ca>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software
 control
Message-ID: <38ca5375-ecea-4361-ab26-c044f38ceadb@lunn.ch>
References: <20261018194339.132-1-ross@r-sc.ca>
 <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch>
 <20261018232015.527-1-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018232015.527-1-ross@r-sc.ca>

On Sun, Oct 18, 2026 at 04:20:14PM -0700, Ross Cawston wrote:
> On Sun, Oct 18, 2026 at 10:36 PM UTC, Andrew Lunn wrote:
> > Port LEDs should be within the port node of the switch in DT. Ideally
> > you want all LEDs for a port to start the with basics, on/off control.
> [...]
> > So please don't make these LEDs special.
> 
> That makes sense. The catch is that RTL9300 has no switch driver
> upstream yet, so there is no port node with a driver behind it to put
> them in: mainline only has drivers for the switch's I2C and MDIO
> controllers.

Markus Stockhausen <markus.stockhausen@gmx.de> did a lot of work on
the MDIO driver, based on what is in OpenWRT. Maybe he plans to work
on the switch driver?

   Andrew
