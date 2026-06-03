Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DD3FE668;
	Wed,  3 Jun 2026 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471771; cv=none; b=IBQj0iImAMf1QEGmP804Eec4gfIi3LkpSwhM6aktXAW4W8BuNKASCUnL37mjhMTaGG2IElHpX7gk6CEzyAY0sDI6GGq0/iBzeBqOSGkXSjqqFGNi2TvUk4XNbG7emQs28woWY3pERcWFnBTJcVzTZgePSbjKKtFfEChRfmYMI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471771; c=relaxed/simple;
	bh=rrJ8nSbCdRvjZeaPceVn4jHgqxAIX0v5RgeoIjy1oAE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YAYpLEXnS2LW/sm4hxD1IL+F6UfsDzq+EILnhkee915kxk8iGyi9pUG7ingbO4YFTLmN8vM8IBq0RZv8FmieImWUNB2fQSPcNRkLjtVp6Bc/ABr9GVbEtW98gODMHaFnnpSMvihRFunaspDnbk4rgoOXM6lAlSvjlpbHK35ONXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=SA6dAGcD; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="SA6dAGcD"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BE8DA0377;
	Wed,  3 Jun 2026 09:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1780471767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RF0JmXbcqbDHLWl8tXUuj4qadCrHg9eChZuwHplwDKU=;
	b=SA6dAGcD6Ug6wa33Q3wlq7juydyK+Wbs8IjLACBw+iWDS3HSxMPdzemvAn0xD696Mdh9Xd
	UIw6OeadfxG9AWDb1NZoowR/5h10yxZx3nk/tEyQnFzqbjVeeVA1OgfhM9TiZyrk179Him
	9AC20UTxc7f1ue1IvmVc+YOkHoROaj3EpwGf6P9BrQIRO/iPn7ATFEXpo1SwR7SlCbp3T5
	XR0uVO5pkLPGX4L2eThBt9wHhqcZhP6fshcSm2UKnQs0acW4BFfNJa/C33lL0aPsEL5WOL
	qobN46g5/XAn/0IFl5nNenFaJbwOpA7C8DPeGZx3QoA9pe1NwT8vVhNPNaXFmw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 09:29:24 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com
Subject: Re: [PATCH net-next v2 01/11] net: rename netdev_ops_assert_locked()
In-Reply-To: <20260603012840.2254293-2-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-2-kuba@kernel.org>
Message-ID: <fffc7ce413fe8a14eaac512b0ba0459e@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub

On 3.6.2026 03:28, Jakub Kicinski wrote:
> Jakub suggests renaming the existing assert to match
> the netdev_lock_ops_compat() semantics.
> 
> We want netdev_assert_locked_ops() to mean - if the driver
> is ops locked - check that it's holding the device lock.
> 
> The existing helper check for either ops lock or rtnl_lock,
> which is the locking behavior of netdev_lock_ops_compat().
> 
> The reason for naming divergence is likely that
> netdev_ops_assert_locked() predated the _compat() helpers.
> 
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks
Nicolai
