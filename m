Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C576EB64D8
	for <linux-leds@archiver.kernel.org>; Thu, 22 Jun 2023 12:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjFVMzy (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 22 Jun 2023 08:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjFVMzy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Jun 2023 08:55:54 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52481BD0;
        Thu, 22 Jun 2023 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=in5rHbtZh5PnvNV43zTQNPPaKJwrcaBBdZKS4TMMpb4=; b=SskxjTwjUfLG+a9+5pE12sh3SD
        2qvMEdRG9sRPjcJNA6497NVv5eW2tDfp4pgAldqOx+prmWAJrFrVyHcQPcvZaIYZPBy+l+lwwK3sf
        iORxDOCbxmKs9wqzKVEaclWRxtK28kEQsTAoJYC8VE+91fFDEmzTnJmyd+R3g5rvNPsA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qCJql-00HGQR-6a; Thu, 22 Jun 2023 14:55:47 +0200
Date:   Thu, 22 Jun 2023 14:55:47 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH] docs: ABI: sysfs-class-led-trigger-netdev: add
 new modes and entry
Message-ID: <ae617bf0-945b-4ad7-a3ed-db6ad1c39418@lunn.ch>
References: <20230621092653.23172-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621092653.23172-1-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jun 21, 2023 at 11:26:53AM +0200, Christian Marangi wrote:
> Document newly introduced modes and entry for the LED netdev trigger.
> 
> Add documentation for new modes:
> - link_10
> - link_100
> - link_1000
> - half_duplex
> - full_duplex
> 
> Add documentation for new entry:
> - hw_control
> 
> Also add additional info for the interval entry and the tx/rx modes with
> the special case of hw_control ON.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
