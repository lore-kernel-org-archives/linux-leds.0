Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615793;
	b=GftX91jR455GUvGDDm9EZFlrVHRqNtUUFDK0Zrt5nnpAsUKE0VMJvbFvelvE54+wdi6k
	 4fHikrG7t/fSzeBPDebuZLKSHZtDga5wkxvfw7n3d/qQU7ELI7Hs/Usq055OOcIY3Tf5R
	 YYDCtb8i1DN77oIQ7KxkcldikFrL33wA1jvfOiu/JKz0kxpSweFucII9j7LVv+eWXJZ14
	 9kPj0J0Y2GfupJDIomjrgxJiykC8VUwHC9I90oLBKbf5fuOFqB/2mMubs/4KpdfIVCopM
	 rxx9d6JzNVeMkBebwxT9z69ETK5cFjLuY1HXKNyESDqAeGCFURGQGz0JQ5+C5CZo54g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615793;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MEDiE0EtY6Ww+VSau1jpIn77kDb/DjLU14yNGzDHLWU=;
	b=uelUOCzGmv6SFOGA91L18Fma7iP2I+tFqCbT28PTtyzqxNpg7Z0ocWBU/p/0UWJ9Zhfs
	 tIlF0ZyhZ8z2AzdmS2oKyxV7jXLcBURC0A41B8nVW8pheZ1XAZoyhCCo1I2yWCYha/xQN
	 0uuoXmc4maDE14Xh7DCy+D5RUFuPt7aZ46P97au+rgVcWJ/oTuQtLaqq2K8gp0VuPNMTn
	 /jk2TU3rp0cm7uwqbKVSJXXaF1O7A5ynGkk84JhbRTw/ai3yy8xyCq4ar2sqd2dXFR880
	 UTBr1pGiukTf1bEC5pDN+zFFiHihczrCbHkH7hBDz5Pd6Unzv7fx/1h0jXi/iCH7wYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kN2n7W4y;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D7E606A337;
	Wed, 25 Nov 2026 14:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D7E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kN2n7W4y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MEDiE0EtY6Ww+VSau1jpIn77kDb/DjLU14yNGzDHLWU=; b=kN2n7W4y0544Knr65YDO/WCCDs
	C6DoCtCMNfqYiB+3Jq3vxcCoLa2ubFOo4FvUGaU75DyfEfiLPr6jGlrhJ50B0QTAM/SaWZ6wKPRJt
	OJxLth2pYKn0eREVHF0v9f3WSI+jyb5Xt4Xex4B5cVRFinpxwNX8s+K4qb13D2WedYm8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWDgq-001KcA-3s; Wed, 25 Nov 2026 15:09:40 +0100
Date: Wed, 25 Nov 2026 15:09:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	maxime.chevallier@bootlin.com, pavel@ucw.cz,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/3] net: phy: dap8211r: add PHY LED control
 support
Message-ID: <2a0b5242-ff8a-4612-95a6-da008ee6f22f@lunn.ch>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
 <20261124094914.2993988-4-a.shimko.dev@gmail.com>
 <977f8fec-4cae-4003-b878-a7eb5aeee48c@lunn.ch>
 <CAOPX746TNm7m6d6G-WyUzDptEVRJR0AuUzKa_Hg=P7s8CchhHw@mail.gmail.com>
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
In-Reply-To: <CAOPX746TNm7m6d6G-WyUzDptEVRJR0AuUzKa_Hg=P7s8CchhHw@mail.gmail.com>

> May i keep your Reviewed-by tag on
> v6, given that this is a small, targeted fix?

Yes.

I have somewhat changed how i do reviews now that we also have LLM
reviews. I look more at the architecture, is the general solution
correct, and a bit at coding style etc. Your patch has passed my
criteria for that, and it is unlikely you are going to mess that up
fixing an LLM report.

       Andrew

