Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669201;
	b=CUKoYp2U2MA8riAPF+LP+nMV+W4D44Dx8UjpyQz3NpcRur6rKLjffPj89gxfuTTWjaYK
	 X8scJeT6rL5+ME+QQ4G4YhYNtaeCecBupbKAdrOHGmYCtEcUBTy13we/Qwk8qUtuwJ9NM
	 P+XJBmQe6x2ZDzGfH0gKJM2oiToQORWWe8POHecG38R2vGDgrNb/iL2niiVDiXEUHc3nr
	 VN87xH45GizEOtOvIVqVAnpc6EGDIIZ6J0AQ1TzWkUEKjD//X8M5ifaM0l7UnIMgwW1k1
	 QcQapJgK9hWHMsVarSjU5u5hLYUUDrB+obyqRcJ4zXWS4VNdpcHi1ilztzTwoMXKzDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669201;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=wFqrOxAE0jUNhM0GP0+sz9CdX/wTyVhI9aY4WYVWrCk=;
	b=Y/ZQ6YUsthQjMi0zf7k20mrFOS1z2dOLtMrDeCFGplOuy1o/XQQy6o5IkzTQJEF8grde
	 X0aA59hbB7fXqUbal0klMmc5qGqCuig0naB6qsg6e3ZhL/8XI6G9dt5zFOxl6BFEOO055
	 2mu4Twy2Gj6X08s7k6VHHsaHNiVTA4xzFVF2wf857ZKMaU6xTO0Yow5YXzVCXSrLCqyq6
	 oWaFgnh1YJvMHRRh1cTJB4HX34EDt65drwkoR7pFhiAL3NcfzexAagNYPkI2EfCNTyogf
	 5coFUR7A24SODkE8rqn5WpJKuPOBLmGq/LtEMOPJSZ55hWRUX198YRLvQOxdThTDwtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rxV9lEAd;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9E7606A327;
	Sat, 14 Nov 2026 15:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B9E7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rxV9lEAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=wFqrOxAE0jUNhM0GP0+sz9CdX/wTyVhI9aY4WYVWrCk=; b=rx
	V9lEAdGc6BI4U4ve9yMhF/Gy8fDmqmDSkPB/55KhfjWbCD1cHOMBBUYtVsuavHvZjDqQknztMnD66
	KDy39hzGhyk6iudARj17aZBUikihCS0/cUqDy6nYFrOSGUd34PEAKaDgk9Euwf8E3G1n/ffSbFVlS
	T7QVHcVmfVwYyM4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSFRF-00GViN-9n; Sat, 14 Nov 2026 16:13:09 +0100
Date: Sat, 14 Nov 2026 16:13:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware
 control support
Message-ID: <43b83555-df27-4b8b-a1d4-bf0cd9c46893@lunn.ch>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com>
 <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
 <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com>

> The LED_COMCON register does include "force-on/force-off" bits,
> but i have intentionally chosen not to use them here.
> To be honest, i’m not yet convinced that they need to be added.

They allow you to implement set_brightness. That is ideally the base
for all LEDs, being able to turn them on/off. If you can do that, all
the trigger can work with software driving the LEDs. You can show the
heartbeat, shift-lock, and all networking settings.

Making use of the hardware to blink on network activity is an optional
extra, reduced the CPU load etc, but just nice to have.

	Andrew
