Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32DC39B95D;
	Wed,  3 Jun 2026 07:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471260; cv=none; b=cK/Yy0PQZ0B2zFUaLeiJJmlvGv2mF6qlM+lmrgrnP9spPnNiRGMkwSzk+TW7uGp2+CYabJ9E90D7dupWxfIQlJlz2mmlFF0hK/5bCGfvNV3IJc/NgfOiirG3HkbUShb1vob84gBJ3jjmMTywcpglgmRhVKHDriS2pGiprhaR0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471260; c=relaxed/simple;
	bh=Y9vLGOj4ICVsi17I/8jLeBr4sz39f6x5VIQKq1H427s=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lvQANtfPp9tVsxJ9Ktbm/EaqCP3tNr09J2xBWhdIbtefXHYqlT/4Qh+cT8jKO/29LE6yu2h8UeCUs1nycfWUOv5imT3Cv1UmzM6qtag27M1Wzv2n1poTVXBshaXGYrug0KaO040lgJSChSmkwg8dKIcQXrL3OJia6OrJL9pX78Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=QCym67S5; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="QCym67S5"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D48CFA03C2;
	Wed,  3 Jun 2026 09:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1780471256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d78Y0rgghtQryF8HguMHQnLEcRVBz4Hrp5YENnoJQhg=;
	b=QCym67S58FjOuEiGfvlJ1bmXrz/iX6ycC5Pyux2crsXKFpfDSv8WW9hXZiicGmnjUM9CWi
	W4zJORwBjTxD8ZoohvaXLdRsfw+sF6PwKsY1gElTIHJ0G/JdQVvL1N5O1Qj6hA6FQMSKph
	aA41En1Rl77YjsxjG69Yn11z8Y+a5IFblULSqm3xdIEKdJWRhRHaD5QMlho8sKaP1mAD+M
	TRIxU0bCjX5en/YqijlAvU1fQ6HU9qS3wqFwHep7RLryih6GQm5qFO/AKwJIR4Yd0ON84c
	02BxjsJ1H4/3Lqx8b5hMDSjYLuGEXyWKCsl1ZI2A5kJa7Ipazv64DF19dgJDdw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 09:20:53 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com
Subject: Re: [PATCH net-next v2 05/11] net: bonding: don't recurse on the
 slave's netdev ops lock
In-Reply-To: <20260603012840.2254293-6-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-6-kuba@kernel.org>
Message-ID: <ab1671e499127b38a7ee3cdfe5038143@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub

On 3.6.2026 03:28, Jakub Kicinski wrote:
> bond_update_speed_duplex() calls __ethtool_get_link_ksettings() on
> the slave, which will soon take the slave's ops lock. One of its
> callers already holds it and the other three don't, so the function
> would either deadlock or run unprotected depending on the path.
> 
> Make the helper expect the slave's ops lock held and switch to
> netif_get_link_ksettings(). Wrap the three call sites that don't
> already hold it:
> 
>   * bond_enslave() (rtnl held; core drops the lower's ops lock
>     around ->ndo_add_slave).
>   * bond_miimon_commit() (rtnl_trylock'd from the mii workqueue).
>   * bond_ethtool_get_link_ksettings() (rtnl held via ethtool layer,
>     bond device itself is not ops locked).
> 
> The call site which does already hold the ops lock is
> bond_slave_netdev_event() via NETDEV_UP / NETDEV_CHANGE notifiers,
> so it stays as-is.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks
Nicolai
