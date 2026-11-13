Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601983;
	b=pcF7RG8IS3EMSSFpMZIRmmSm5/Mikee87YqPohYTaUnwK1Oy7ynGzX+C3sYeSORIjKhr
	 yIFH/5O3T93JxgPVIO5GriMmyeunUHRWXGO1MudUwnhBX4rVHHEPISauzcNmr/hRU92Wz
	 QN0nJ+LfnJiaMcODPtCaTTsKLsYK+6hit1Rt9pIYBn7+Lk09Zh6Yt1+IKRrcs7/G4tIcA
	 HGoivNKH3Wt/LW+7rsjG5B1x9pY7P9EnjENz8zos8+yYf6tmMUWniV/froPPd8c3vo70m
	 GShV0W4SZ0ptmkP/VHTzHDwdOxJFqT3dLHtQEu738mmJnyj4GAf0wel5bUAKz+6KyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601983;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=KB3jO2Uh980sYfYogP8Ce6aR0qJaY2oratJHAC8zDpM=;
	b=JeD2j9t+o+BNSyNpdMe+97V5P7rmGrbCmbkZDS7RHR7a0DcqtqMXZBa3m5VS7xe6MUBO
	 kXuGSxlEyIwfjE7jsGF8j7gyshmxJoRRBHWYxFpKBpJi/FiyA3T+u9jxxSb7X37JQ4dOO
	 QumST+WSDj5cXjQYYDlIJc7OEUJUpDzv8/6ejFShKeyipspMo3Yi8sBe4RNakO19HIlM0
	 RM/tpXzhC5Wx89sjul2V0EonqvxByNz1rFVGGIrwg9kjIc5juPI2APUg/s2sKgG1aVhLm
	 v0WJJ+2dNhe2ooWjyzP56vpF1DAefnkWZa0V6113sVCbIoLAuILNW7QjOpqUha3QRWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bckuey0Z;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A1606A327;
	Fri, 13 Nov 2026 20:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538A1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bckuey0Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KB3jO2Uh980sYfYogP8Ce6aR0qJaY2oratJHAC8zDpM=; b=bckuey0Z9y3l43ZbikGRihLCKL
	alpuVFssHwH4Vcv4s1nhWQILNGHj15E7P7hUv8oqbcqyWcjaTA12NdS+xvH5ogkyUvfBiPii+VfHY
	5DxWfBoejA3LNErUg71EDJ4j5cSxdmFG0eWYIP7M2HZG6hxwJJWqInJo1DrbO9sOteMc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xRxx9-00GMIW-Eu; Fri, 13 Nov 2026 21:32:55 +0100
Date: Fri, 13 Nov 2026 21:32:55 +0100
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
Message-ID: <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261113110546.173624-4-a.shimko.dev@gmail.com>

> +#define DAP8211R_LED_ACT_BLINK		BIT(13)
> +#define DAP8211R_LED_FULL_DUPLEX	BIT(12)
> +#define DAP8211R_LED_HALF_DUPLEX	BIT(11)
> +#define DAP8211R_LED_TX			BIT(10)
> +#define DAP8211R_LED_RX			BIT(9)
> +#define DAP8211R_LED_LINK_1000		BIT(6)
> +#define DAP8211R_LED_LINK_100		BIT(5)
> +#define DAP8211R_LED_LINK_10		BIT(4)

Do any of these bits allow forced on/off?

> +static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules)
> +{
> +	switch (index) {
> +	case DAP8211R_LED_ID_0:
> +		fallthrough;
> +	case DAP8211R_LED_ID_1:
> +		fallthrough;
> +	case DAP8211R_LED_ID_2:
> +		break;

You can collapse case statements, without fallthrough, if there is no
code.

It is also possible to do:

case DAP8211R_LED_ID_0..DAP8211R_LED_ID_2:

     Andrew
