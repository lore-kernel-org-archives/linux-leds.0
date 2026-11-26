Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.130.44.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671674;
	b=0u5nQqJsmRs60PclhmoIWUGn0WH2PXdstjigDofB988+LvB2dMlbu2ZLzGijTC3pjuyM
	 3pIBEstvdX70NEde8ioTWFwjUHuO0+da6FMU2MHI+Rh20vB5WmWhHtuGiCgg5Y0lGLOIJ
	 soJdDqD9u4l4C57PrWsSrAEqe6Z3BOc1gBSnEI5eafUdb2UPIuMRQsOABgkUfpCVkSdVr
	 6YgwNBu2me9bfPbvjKRNFuNPKJb8ixLDlEJKbDv7Knd+a6E26fbAhSzvrYrW8HeHQtroU
	 FpEVzu9d1Mj+rYfl4xhmYYvOAQV90cLiaY6dEH6O7q9uRMnUd/cuoSekfmvk7nWZ6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671674;
	h=DMARC-Filter:X-MailGates:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1x/yCGwUTOy+R2m4ASJHkBf1KglrwXR6cG8BdArpB2o=;
	b=HX2mi4yal9yC6v+QGmLL+6Fwnwkay+UfPxe+GAgSXDj3KaP41s67TK7ZDMdvBOwLJj1m
	 cHNoSkAMwqvok6TMVqG+F8ZaXdYypdctRxPdvsHLPOqjY/aq/witWyWW1kWuc+JuJfTq/
	 Rg32+DEnF6qkpleCx712uvGmO2sT5jR1tenBWTl0gAEQhp485pAsyxl5KZ7FPT0cPfYlQ
	 ek8phMPEfuW4vvrca9qqDfKkwUe99LA9qSJ7lnKo5nGf9DXEDDFUFhsavDppUss2UvJJJ
	 cWmknh+kHdCSG7m4/Y/CR5tKi4t++NL5LEcLNVzlabi3pYSfbT55CrY0apwcAf4DvgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=richtek.com;
	spf=pass smtp.mailfrom=richtek.com;
	dkim=pass header.d=richtek.com header.i=@richtek.com header.a=rsa-sha256 header.s=richtek header.b=xZ6qSRyh;
	arc=none smtp.remote-ip=220.130.44.152
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC32606A33A
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 05:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC32606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=richtek.com header.i=@richtek.com header.a=rsa-sha256 header.s=richtek header.b=xZ6qSRyh
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1795671660;
	bh=1x/yCGwUTOy+R2m4ASJHkBf1KglrwXR6cG8BdArpB2o=; l=977;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=xZ6qSRyh6oQpMAY7alcV+j1SPJ36jt7IPbX4TTigYo2jblgtaT5o2+wch6qsz+FFf
	 ny+WvEkhjb/H8Zpi6iuvMIIs/HNJ/z3V4ROx26Wr4YRPdJ7CTwfKqj0xLWzRzGh6Do
	 Q7ccwShEraRD8sJgt6wsbkisVL4DLWTDUsAc9dzfLGGhvINFHC+snaWRsG+NLh1K2r
	 zHjW8KxTg7yJNQON50+SBSbVCpO+5LSmftSUZoAUkQNJFBSa0/z+mkXzphQN5kXd/1
	 4i9yzhawNyeVe2CHdNh0NH2hsf4rGHR1IyvAtMDNXO3Lx9YlTARNbFf8uXh/FQm/wk
	 /zdQG2e6z1fjQ==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(6655:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 26 Nov 2026 13:40:46 +0800 (CST)
Received: from ex4.rt.l (192.168.10.40) by ex5.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 26 Nov
 2026 13:40:46 +0800
Received: from ex5.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 26 Nov
 2026 13:40:46 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex5.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 26 Nov 2026 13:40:45 +0800
Date: Thu, 26 Nov 2026 13:40:46 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Cong Nguyen <congnt264@gmail.com>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: rt4505: Put the child node reference
Message-ID: <awfGXumwY62Z4UcI@git-send.richtek.com>
References: <20261125130318.2590336-1-congnt264@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261125130318.2590336-1-congnt264@gmail.com>

On Wed, Nov 25, 2026 at 08:03:18PM +0700, Cong Nguyen wrote:
> rt4505_probe() gets the LED child node with device_get_next_child_node(),
> which returns it with its reference count raised. The driver never calls
> fwnode_handle_put() on it, so the reference is leaked on every probe error
> after that point and on a successful probe once the device is removed.
> The v4l2 flash sub-device takes its own reference on the node, and the LED
> class device only stores the pointer.
> 
> Drop the reference with a device managed action registered right after the
> node is taken, so it is released after the LED class device that was
> registered later has been unregistered. leds-rt8515 puts the node of the
> same kind after registering its LED and flash sub-device.
> 
> Fixes: d9dfac5419d0 ("leds: rt4505: Add support for Richtek RT4505 flash LED controller")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Reviewed-by: ChiYuan Huang <cy_huang@richtek.com>
