Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C7399031;
	Wed,  3 Jun 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471012; cv=none; b=b4XDH3XxKu47gYnjqIVu+7bhJIbbkCRu9PRLNkYMMW7CrXRzmV90iU3PLkkZRLFdE8dBVODPHvj1npv7jIngy25YS6uSw/uZotq5twfxf+gRFpPax4MEEunwrOqqzG9Cl/tKG3s6h7TnmgM5xdIzfKbQB8DFtwows2hKx7wfdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471012; c=relaxed/simple;
	bh=vyz0Xa1//X2cgKiA8x50y0o6xktJFDyDe1/KFcEJfHM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=VGT7Na5o/UOh4xOAi5MaA0CoNzjqqiGdU4zQZpORbXUORMuy3QZAall8qVlLfTWlLS64eKgpajjn7zOGyYu7CrcR2tpEigvwvyl5w3oniDZo7K1EwgB4tUV7pb6u5Ji+7wfvIx3nqo7XmAj5M6n1Cxy6G4Di2qQZnPETluyl0Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=kd8n+8rs; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="kd8n+8rs"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41481A03C2;
	Wed,  3 Jun 2026 09:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1780471004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vg2AJcCFLJnI5vjShorKN1fo6tPDywI2MFm003N7eXg=;
	b=kd8n+8rsaOLBhSjImTzV783fbvAdIg74RlEsJ0zpTD3S8PbK+0LiFSgREPyaNtf84kDL3q
	U0nufqHfCsDLjve40u7PUAyjB1sWOLBJ2/HflKjaeHAc7FCiugpbHjoyEwa0vCKjFL7GZb
	Pr7370v6gAJJF2WZf/eHjd/+5esDiByMyr95VDei2E5GE6b8gldv+wl0fw5/Pf5HNlQp5x
	+S5WDjqdGP9HrVslMn0ImpqAL2IqQ/HhBzwT26Fv/6Eq/Jn6nF1AZsEGE5RLKqgWiHnxKe
	1NmalZ3RjJtdumVkip05o0GH8Ant/Czm2rT704AIlrLFOeBliea5zubwqxnqJQ==
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 09:16:39 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 jakub@cloudflare.com, maxime.chevallier@bootlin.com, lee@kernel.org,
 linux-leds@vger.kernel.org, pavel@kernel.org, jv@jvosburgh.net,
 michael.chan@broadcom.com, jhs@mojatatu.com, vinicius.gomes@intel.com,
 idosch@nvidia.com, razor@blackwall.org, hare@suse.de, jhasan@marvell.com,
 danieller@nvidia.com
Subject: Re: [PATCH net-next v2 07/11] net: bridge: don't recurse on the
 port's netdev ops lock
In-Reply-To: <20260603012840.2254293-8-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
 <20260603012840.2254293-8-kuba@kernel.org>
Message-ID: <b9a0430bb83cc76096488ce4bf239368@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakub

On 3.6.2026 03:28, Jakub Kicinski wrote:
> port_cost() calls __ethtool_get_link_ksettings() on the port device,
> which will soon take the port's ops lock. br_port_carrier_check()
> is reached via the NETDEV_CHANGE notifier from linkwatch, which
> already holds the port's ops lock, so the call would deadlock.
> 
> Make port_cost() expect the port's ops lock held and switch to
> netif_get_link_ksettings(). The only other caller is new_nbp(),
> make sure it takes the lock explicitly.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  net/bridge/br_if.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/net/bridge/br_if.c b/net/bridge/br_if.c
> index d39571e13744..049d1d25bc26 100644
> --- a/net/bridge/br_if.c
> +++ b/net/bridge/br_if.c
> @@ -19,6 +19,7 @@
>  #include <linux/if_ether.h>
>  #include <linux/slab.h>
>  #include <net/dsa.h>
> +#include <net/netdev_lock.h>
>  #include <net/sock.h>
>  #include <linux/if_vlan.h>
>  #include <net/switchdev.h>
> @@ -30,13 +31,13 @@
>   * Determine initial path cost based on speed.
>   * using recommendations from 802.1d standard
>   *
> - * Since driver might sleep need to not be holding any locks.
> + * Since driver might sleep, we need to not be holding any bridge 
> spinlocks.
>   */
>  static int port_cost(struct net_device *dev)
>  {
>  	struct ethtool_link_ksettings ecmd;
> 
> -	if (!__ethtool_get_link_ksettings(dev, &ecmd)) {
> +	if (!netif_get_link_ksettings(dev, &ecmd)) {
>  		switch (ecmd.base.speed) {
>  		case SPEED_10000:
>  			return 2;
> @@ -436,7 +437,9 @@ static struct net_bridge_port *new_nbp(struct 
> net_bridge *br,
>  	p->br = br;
>  	netdev_hold(dev, &p->dev_tracker, GFP_KERNEL);
>  	p->dev = dev;
> +	netdev_lock_ops(dev);
>  	p->path_cost = port_cost(dev);
> +	netdev_unlock_ops(dev);
>  	p->priority = 0x8000 >> BR_PORT_BITS;
>  	p->port_no = index;
>  	p->flags = BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD | BR_BCAST_FLOOD;

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks
Nicolai
