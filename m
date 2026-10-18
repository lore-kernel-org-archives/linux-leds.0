Received: from out-2uec-a118.jellyfish.systems (out-2uec-a118.jellyfish.systems [63.250.43.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED8A3DCDB0
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 23:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365640; cv=none; b=LLk7D9wrgbhvENhgOkyB9HhOJhd4GHzOSy7cdf75G/qVUpyxPD0zx4GkxQdEDUELr3blr78C6YdtYJwa3vv4fbXxhT+PvElUIbK60cnNLcrhgxpK4WJt1yvsd3FdhomE4WPkFlgoSLlN6zKmE3D2UzlpfCywldT9bqu/xMB9dwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365640; c=relaxed/simple;
	bh=k/i3Nsiw4H9TRxL0j87EVx9jYyettyuwElHn7x2/IBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SccNBS9Qc6vfbF3Zqmt7/39GApsVWZiWtI1+x6DF254cqV15ZeSJw2XDZX2H+jwZKCWT0rLnwESN58QDMdxpv+vHHOWmRQqqqM58AQpFFLldWxIV34Lo+wM3xqn9mR6+Vi77yJWr0v2XOor8R1uQ0zIxJKfGPz8Ov/KBduIPDKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=E5j+KawY; arc=none smtp.client-ip=63.250.43.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="E5j+KawY"
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7F5f5FkZz8sWQ;
	Sun, 18 Oct 2026 23:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792365623;
	bh=k/i3Nsiw4H9TRxL0j87EVx9jYyettyuwElHn7x2/IBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5j+KawYgqYYcTobdqa3Y7Ldaa+3FTZw7GAJhzxHXjOcx03vb2+se1rs90BESlczf
	 7emm0ugBi2Faozym1+OEMK9n7naGEf+8BvN4oz5jGTPPtLkY28rYQWNMezJpc9fNSk
	 i87MHcF+xamwqWyEIHA89tYSrolGSLFkpbsQ/udMlSsTjgT2sPihiS4btvwmQ7tZUX
	 5M2jo0RM5N8kMqhuTa1CeDSdYxegdYKVGxJN9H54SZWW/5uRkrtvm7Y86o+3hDJDeJ
	 M6TnBfLRm3H7OxMDWF6/e24/JNbu1k18dzhqPgr/GJ9qI7XxCUCejEzpJqrty7F1R5
	 yqe3m3vSXBGvw==
From: Ross Cawston <ross@r-sc.ca>
To: andrew@lunn.ch
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: Re: [PATCH 0/3] leds: add Realtek RTL9300 port LEDs under software control
Date: Sun, 18 Oct 2026 16:20:14 -0700
Message-ID: <20261018232015.527-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch>
References: <20261018194339.132-1-ross@r-sc.ca> <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

On Sun, Oct 18, 2026 at 10:36 PM UTC, Andrew Lunn wrote:
> Port LEDs should be within the port node of the switch in DT. Ideally
> you want all LEDs for a port to start the with basics, on/off control.
[...]
> So please don't make these LEDs special.

That makes sense. The catch is that RTL9300 has no switch driver
upstream yet, so there is no port node with a driver behind it to put
them in: mainline only has drivers for the switch's I2C and MDIO
controllers.

Unless you see a place they could go in the meantime, I'll withdraw
this series until there is one.

Chris, do you know of anyone working on an RTL9300 switch driver? If
so, I'd be glad to help with the port LEDs there.

Ross
