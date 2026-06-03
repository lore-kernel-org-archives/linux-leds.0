Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDAA39DBFC;
	Wed,  3 Jun 2026 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471108; cv=none; b=dAONig5s+vUGCgoWp+wfT+hXrD5M4x9TXjzQlK8ehgrm6Y88LkKt1G6Jlvv66u8O4683BhQwNtOtdJCOIfGOuvkfEksO6kOcLXUBY4R2ExQ4CKW6GjOZ5Q2FlBUaDZKtSoett1CiloqE8eoFXd1oE3Hi7Hh0dtU5i+O2jgg8Q+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471108; c=relaxed/simple;
	bh=eopH5zYjoqqXWPlP9/1em1VNH5BgMfP/OFiOmHs9DCU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=iu2icVZe8Oo96LLJ/0oVt8gcZ6A8+Nkr6chX8lqwfEEIbYDMG6f0wexGwb2BJCYEd6Y9YvFlNQ3UDZ/JmPuB3AzFJ5Yl/3eXgDBslZyd8Lve8dDRX5EU5wiwVsDO7ILJADgPT6GcO1BiJIz0F+hyJUnPlkVr85JlrX3x/RWgT3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=Zoa7geZH; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="Zoa7geZH"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24507A03C2;
	Wed,  3 Jun 2026 09:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1780471104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=unD7fVDej0gDVMjXgolcmQ3vJZ292FaMOu0mhGLUp/w=;
	b=Zoa7geZHCSxG7jx+fMSeAIApF6d+/cbc2PcgzMxaBKdgd9n0XmKdTtrCXFIXFnge/HyA7e
	Jpwc/WzlLbwFLBQhHNru1Fw7lQ0CzrDL+QYrWUXzz7CAsfhvPEtkN+naOVv8aaZ9bvhiY8
	ctoCuSydyXnFZxAtkaB4uEcXnEgfnrNeaaf/GEGSjuqMHhO3HAzmqyhm5DnpMPpQ09ktej
	ZyGVur03EYSZUs4TJ/2wsm7mGVTkmw2HL0Uf2S1xUbfQz8Vbn6RJqWoJDGlqWmHpRp2FVN
	2L1OgmXxjSd5cv/eUDuIPiwE/OrY78XlsOy6vy1sdKP7r02Bfs5QF6y5Cauczw==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 09:18:23 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com
Subject: Re: [PATCH net-next v2 11/11] net: ethtool: make sure
 __ethtool_get_link_ksettings() is ops-locked
In-Reply-To: <20260603012840.2254293-12-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-12-kuba@kernel.org>
Message-ID: <6cedf5898b770e430cb60fa7ae011802@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub

On 3.6.2026 03:28, Jakub Kicinski wrote:
> All drivers which may call *_get_link_ksettings() on ops-locked
> devices from paths already holding the ops lock are ready now.
> Make __ethtool_get_link_ksettings() take the ops lock, and assert
> that it's held in netif_get_link_ksettings().
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  net/ethtool/ioctl.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
> index 49da873b673d..a4b0cbae4063 100644
> --- a/net/ethtool/ioctl.c
> +++ b/net/ethtool/ioctl.c
> @@ -439,7 +439,7 @@ struct ethtool_link_usettings {
>  int netif_get_link_ksettings(struct net_device *dev,
>  			     struct ethtool_link_ksettings *link_ksettings)
>  {
> -	/* once callers fixed - assert ops locked */
> +	netdev_assert_locked_ops_compat(dev);
> 
>  	if (!dev->ethtool_ops->get_link_ksettings)
>  		return -EOPNOTSUPP;
> @@ -456,10 +456,14 @@ EXPORT_SYMBOL(netif_get_link_ksettings);
>  int __ethtool_get_link_ksettings(struct net_device *dev,
>  				 struct ethtool_link_ksettings *link_ksettings)
>  {
> +	int ret;
> +
>  	ASSERT_RTNL();
> 
> -	/* once callers fixed - take the ops lock around this call */
> -	return netif_get_link_ksettings(dev, link_ksettings);
> +	netdev_lock_ops(dev);
> +	ret = netif_get_link_ksettings(dev, link_ksettings);
> +	netdev_unlock_ops(dev);
> +	return ret;
>  }
>  EXPORT_SYMBOL(__ethtool_get_link_ksettings);

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks
Nicolai
