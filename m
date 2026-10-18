Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCF235C692;
	Sun, 18 Oct 2026 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363011; cv=none; b=JEVq6ZmjBPVL8BHt3U1N0CAxQiLlGq54DbwYBh0AZ/ovLmrybPmXFXtLAK5d3HRhSHuZAcArjd0MoL9pzJsBR75JWNyMsml5C1J+9GazCrYIMFmP4vb2UbKuVLMw3nYr0tr6lqjfP0qonAgnljA1YjzX34gz0YndWI8U8uPKcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363011; c=relaxed/simple;
	bh=ZeewAg9wYSyurcD5dxynwnZUpu/Yk4R4eIqDhPBdPU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvRahYHBlZnbPp6axf+OREUuDmYNAxZWPX7rsllhZNackPK628IQ6ok031FCqATrSyhQ+oYjoswaxT4rlJCPVa5ykKHT4tKOObS2AwRgvgKbhKsnoSwTbJIKG/gat7Vdwo4TIcbVL7gfiJOvudpci7/lJL1stEGEeGZMuOewMkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pz3fXrXP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pz3fXrXP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5fIsGMGoebHtNXp30RZKr7vIRqrvytc5rBOOxkQ7c3A=; b=pz3fXrXPoxQZReonwN2KlN2hFK
	H+GPdYWDZPve8ZaSre5JF/qPkINZO5ZmmuL5WFkIinzze4adySCuFkZtLoOwkNbIe3SSsLYnVmOa+
	kytXVJFcZMlWZYW11bHiYzKG4VYGNkNcASa9t3c1wYRkthkYC/6DDSakKlMZPWaBsnHs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xIZUS-00BX0t-3B; Mon, 19 Oct 2026 00:36:28 +0200
Date: Mon, 19 Oct 2026 00:36:28 +0200
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
Message-ID: <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch>
References: <20261018194339.132-1-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018194339.132-1-ross@r-sc.ca>

On Sun, Oct 18, 2026 at 12:43:35PM -0700, Ross Cawston wrote:
> The RTL9300 switch drives up to four LEDs per port over its LED
> interface, serial or scanned, each normally showing a hardware function
> chosen by the LED set of the port. Some boards wire LEDs to it that have
> no hardware function and that the vendor firmware switches in software,
> such as the PoE status LEDs of the MokerLink POE-10G07110GSM.
> 
> This series adds a binding for such LEDs as a child of the switch, like
> its I2C and MDIO controllers, and a driver that takes them under
> software control and exposes them as LED class devices.

This is an odd architecture when compared to other switch drivers with
LEDs.

Port LEDs should be within the port node of the switch in DT. Ideally
you want all LEDs for a port to start the with basics, on/off control.
That gives the minimum, enough that you can make them software blink
on traffic, show link speed, poe, shift lock, morse code panic dumps.

If the LED has more capabilities, you can then advertise this, and the
led triggers will offload blinking to the hardware. But this is an
extension, not a requirement.

So please don't make these LEDs special.

	Andrew
