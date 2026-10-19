Received: from out-utut-a193.jellyfish.systems (out-utut-a193.jellyfish.systems [198.177.127.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40C046F4A4
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.177.127.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388589; cv=none; b=mA6U7Mc7fJie7SN/QYesxnOft8oKBTXYsEvs0avfLx7awer1P0CRt9GgaMPc1WuWYr32rDSVdoKuGbD9Xa9M6m5a9DAw/sGPGO9fxX0Z+xMzaXL3xv5EcTb5Rir5v/1Zp0iXEPweuVihLdij+Xjg4c365PYtsh3oHVmw0m+ioxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388589; c=relaxed/simple;
	bh=Cw/SyL/GxVPUjHPLAFBCiooYHmtBZrKCFaAf2TcDMes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHyibo28sL1+sqt3DT9L9uvt+91xDX11IkLyxZ7Ldi1ZommgWp9r15jxXyeMO4w2FxOlBJWSpctL8vPYZaAAMS+qVxvRJ2/aCXqb/8rh/i8gL9/MNOyzitZk5sBM/qXmedvqP9F25WncL20RFlhyROIZjNQoZLPLB+jFHEYafl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=g0YYvvWG; arc=none smtp.client-ip=198.177.127.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="g0YYvvWG"
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7PZx4NmYz2x99;
	Mon, 19 Oct 2026 05:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792388571;
	bh=Cw/SyL/GxVPUjHPLAFBCiooYHmtBZrKCFaAf2TcDMes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g0YYvvWGzaPWP5QlMoGuiwCATRI9N77vYqL2fBcH4+zD5I2KT/ao0yXyjlMALKSPT
	 NlioH/fBjZpk1li1v0Fhy1F4NoJB8j5bCmcqYOsdQc2MI2bsZdgbQjPUzF6nrGRRi+
	 W6xd+pGsJQBP+0ogh0QM+JEgFNkKSGW8MH5Suqun+caH9dsbZTyHXMkiJJLyqaVeiH
	 YyrlTDqyON+2ppA7cEVTNPfCEfc3O2hwbmSktcW6TYBdwUwAeGYPO+UQZ+9Y4W5bR2
	 u+9F84CXsmDMi2gdwrJphKDb62bwqA1xLQFWZaHhaheXsYDn3/HhzbiZruAb6PId8P
	 3LTmZL70ozJUw==
From: Ross Cawston <ross@r-sc.ca>
To: andrew@lunn.ch
Cc: markus.stockhausen@gmx.de,
	lee@kernel.org,
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
Date: Sun, 18 Oct 2026 22:42:32 -0700
Message-ID: <20261019054233.1884-1-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <38ca5375-ecea-4361-ab26-c044f38ceadb@lunn.ch>
References: <20261018194339.132-1-ross@r-sc.ca> <59f75e7d-9b56-441d-a4b5-58ad3862267e@lunn.ch> <20261018232015.527-1-ross@r-sc.ca> <38ca5375-ecea-4361-ab26-c044f38ceadb@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

On Mon, Oct 19, 2026 at 12:02 AM UTC, Andrew Lunn wrote:
> Markus Stockhausen <markus.stockhausen@gmx.de> did a lot of work on
> the MDIO driver, based on what is in OpenWRT. Maybe he plans to work
> on the switch driver?

Thanks, adding Markus.

Markus, are you planning to take the RTL930x switch driver upstream? If
so, I'd be glad to help with the port LEDs there, in the port nodes as
Andrew describes earlier in this thread, and to test on an RTL9303
board:

https://lore.kernel.org/all/20261018194339.132-1-ross@r-sc.ca/T/

In OpenWrt, openwrt/openwrt#25341 adds software control of the RTL930x
LEDs to the switch driver; I tested it with this board's PoE LEDs.

Ross
