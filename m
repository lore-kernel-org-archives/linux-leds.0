Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23AC2F39C2;
	Wed,  3 Jun 2026 06:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468821; cv=none; b=Ypj+YjIR0M/RSDP4u4wsHiK0E7ZDayVL3rBhegvQJReppWN5ngH2iKg7GxxscGyam4U0wF8IpO0j8AIDBUg3sVsGBTl6VrQwk+IgjhGGbYO3ZQcJxfLsCMy60XDhOowICPL2BWCx1zXFxY8bhcIS4znq7As0puzpijyj3YR35VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468821; c=relaxed/simple;
	bh=uZljcAPAOea1XEMilROJ9Ya5qu+VgUXZWUxQSwDwIJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfzE6u9e0VzUtjdBE1NXunbAzCLrpNbSv+DO3M4JEkriX2Mxu/RWIGY3saMeNHFQORyVzdF1PTORZbllPCVoHGAOacsrNmerAcIEFRh8qlE01R1ATnwi86X+iEeTNmWJMLlH0peRs7Mtq8TqIYMbsgJSa3leFP9LSPqtJhNfMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e8NqizSQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e8NqizSQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D0F5E4E42DFB;
	Wed,  3 Jun 2026 06:40:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80CD760735;
	Wed,  3 Jun 2026 06:40:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81C4510888CC6;
	Wed,  3 Jun 2026 08:40:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780468813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/qAWv55ZFRDTig1Wl9c6MmbXlkpVxx7ObLOoN+K52AU=;
	b=e8NqizSQQG+gVnsrUOW1ZVdoDmzjjasgyYYnjqhFK31jvvCkD2jfxrXOYjnmc7y1LGWzLc
	XIowdnA+qamV6tSn8TELcSkcL9K1bxapL5dSfEewHni/A3J0xn/bSo7Enlm71tBtyD3o9J
	FkxWWxywERyRotp1e/pZaDpjvFJGtSepp2yISwiHXD1Ksj3Or0z8T1UjEtPR9+0Glx8VAD
	BkgvdQG6CspvS8WSNP1FR1l0ON/cxNSb5pZ+n96L2+ikY7hIfO2Jqv+KSOzO7GmcZEYFxV
	IJ6r1LnlqectT9h3qr9H9Cg8y88zbmvhZWkRa+dsYswTFVsnsnfecGL/BxMh1Q==
Message-ID: <9d1c7085-40d4-4f88-9caa-6c031666db3c@bootlin.com>
Date: Wed, 3 Jun 2026 08:40:04 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 04/11] net: ethtool: add
 netif_get_link_ksettings() for correct ops-locked use
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, jakub@cloudflare.com,
 nb@tipi-net.de, lee@kernel.org, linux-leds@vger.kernel.org,
 pavel@kernel.org, jv@jvosburgh.net, michael.chan@broadcom.com,
 jhs@mojatatu.com, vinicius.gomes@intel.com, idosch@nvidia.com,
 razor@blackwall.org, hare@suse.de, jhasan@marvell.com, danieller@nvidia.com
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-5-kuba@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260603012840.2254293-5-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub

On 6/3/26 03:28, Jakub Kicinski wrote:
> __ethtool_get_link_ksettings() is exported and called from sysfs
> and many drivers. It invokes ethtool_ops->get_link_ksettings
> so by our own docs it should be holding netdev lock for ops locked
> devices. Looks like commit 2bcf4772e45a ("net: ethtool:
> try to protect all callback with netdev instance lock")
> missed adding the ops lock here.
> 
> There's a number of callers we need to fix up so let's add the
> netif_get_link_ksettings() helper first, without any actual
> locking changes (this commit is a nop).
> 
> Not treating this as a fix because I don't think any driver cares
> at this point, but if we want to remove the rtnl_lock protection
> this will become critical.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> v2:
>  - split into multiple patches
> ---
>  include/linux/ethtool.h |  2 ++
>  net/ethtool/ioctl.c     | 17 ++++++++++++++---
>  net/ethtool/linkinfo.c  |  4 ++--
>  net/ethtool/linkmodes.c |  4 ++--
>  4 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index 1cb0740ba331..f51346a6a686 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -325,6 +325,8 @@ struct ethtool_link_ksettings {
>  extern int
>  __ethtool_get_link_ksettings(struct net_device *dev,
>  			     struct ethtool_link_ksettings *link_ksettings);
> +int netif_get_link_ksettings(struct net_device *dev,
> +			     struct ethtool_link_ksettings *link_ksettings);
>  
>  struct ethtool_keee {
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
> index bd97f9b9bf18..49da873b673d 100644
> --- a/net/ethtool/ioctl.c
> +++ b/net/ethtool/ioctl.c
> @@ -436,10 +436,10 @@ struct ethtool_link_usettings {
>  };
>  
>  /* Internal kernel helper to query a device ethtool_link_settings. */
> -int __ethtool_get_link_ksettings(struct net_device *dev,
> -				 struct ethtool_link_ksettings *link_ksettings)
> +int netif_get_link_ksettings(struct net_device *dev,
> +			     struct ethtool_link_ksettings *link_ksettings)
>  {
> -	ASSERT_RTNL();
> +	/* once callers fixed - assert ops locked */
>  
>  	if (!dev->ethtool_ops->get_link_ksettings)
>  		return -EOPNOTSUPP;
> @@ -450,6 +450,17 @@ int __ethtool_get_link_ksettings(struct net_device *dev,
>  	memset(link_ksettings, 0, sizeof(*link_ksettings));
>  	return dev->ethtool_ops->get_link_ksettings(dev, link_ksettings);
>  }
> +EXPORT_SYMBOL(netif_get_link_ksettings);
> +
> +/* Convenience helper for callers that hold only rtnl_lock(). */
> +int __ethtool_get_link_ksettings(struct net_device *dev,
> +				 struct ethtool_link_ksettings *link_ksettings)
> +{
> +	ASSERT_RTNL();
> +
> +	/* once callers fixed - take the ops lock around this call */
> +	return netif_get_link_ksettings(dev, link_ksettings);
> +}
>  EXPORT_SYMBOL(__ethtool_get_link_ksettings);
>  
>  /* convert ethtool_link_usettings in user space to a kernel internal
> diff --git a/net/ethtool/linkinfo.c b/net/ethtool/linkinfo.c
> index 244ff92e2ff9..d5b3dbc53c5f 100644
> --- a/net/ethtool/linkinfo.c
> +++ b/net/ethtool/linkinfo.c
> @@ -34,7 +34,7 @@ static int linkinfo_prepare_data(const struct ethnl_req_info *req_base,
>  	ret = ethnl_ops_begin(dev);
>  	if (ret < 0)
>  		return ret;
> -	ret = __ethtool_get_link_ksettings(dev, &data->ksettings);
> +	ret = netif_get_link_ksettings(dev, &data->ksettings);
>  	if (ret < 0)
>  		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
>  	ethnl_ops_complete(dev);
> @@ -104,7 +104,7 @@ ethnl_set_linkinfo(struct ethnl_req_info *req_info, struct genl_info *info)
>  	bool mod = false;
>  	int ret;
>  
> -	ret = __ethtool_get_link_ksettings(dev, &ksettings);
> +	ret = netif_get_link_ksettings(dev, &ksettings);
>  	if (ret < 0) {
>  		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
>  		return ret;
> diff --git a/net/ethtool/linkmodes.c b/net/ethtool/linkmodes.c
> index 30d703531652..a6d32f0d9fcc 100644
> --- a/net/ethtool/linkmodes.c
> +++ b/net/ethtool/linkmodes.c
> @@ -39,7 +39,7 @@ static int linkmodes_prepare_data(const struct ethnl_req_info *req_base,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = __ethtool_get_link_ksettings(dev, &data->ksettings);
> +	ret = netif_get_link_ksettings(dev, &data->ksettings);
>  	if (ret < 0) {
>  		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
>  		goto out;
> @@ -324,7 +324,7 @@ ethnl_set_linkmodes(struct ethnl_req_info *req_info, struct genl_info *info)
>  	bool mod = false;
>  	int ret;
>  
> -	ret = __ethtool_get_link_ksettings(dev, &ksettings);
> +	ret = netif_get_link_ksettings(dev, &ksettings);
>  	if (ret < 0) {
>  		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
>  		return ret;

