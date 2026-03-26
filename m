Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD8A3B3BE2
	for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2026 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511190; cv=none; b=g6631QDAjVfhbJ0Z6H2aOB813+RtsxZb4dIKq2ndHEegqNzqmsVo/zDdvOBLu/9VRf9f3BVSd5lsi3a+AczsijH4WIyrpOKYfwC95pkTIFWRTeyXIDV8Y0QsdAeZvnbvG4+dSYGTFUfEDiJV1qDqZcEVex9LKIPk0lfGheGxuoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511190; c=relaxed/simple;
	bh=R+0iVWoTzdskJST5id+38gRc0yZNEbU7TSFoultMmTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGq/Em72gVvIaY97JRFZBYT8ohMsBt8WN0G8i2CpaResPP2euyXjC1wIeSpSCEYwmBPqLKe3T9Pzah7eP1xfUbHlxdIPLDneXl7QkpamKN+VtbkbI1QZo4THTOWATl6LTGHvGYeTQeFT/BxvJMMH20RPc7aZOAxmaMkVrzz8KNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w5fPu-0003cI-Jy; Thu, 26 Mar 2026 08:46:10 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w5fPt-002BpV-20;
	Thu, 26 Mar 2026 08:46:09 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w5fPt-00000006fIv-2AeZ;
	Thu, 26 Mar 2026 08:46:09 +0100
Date: Thu, 26 Mar 2026 08:46:09 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 0/3] net: pse-pd: add poll path and LED trigger support
Message-ID: <acTkQfs9Gqbl9PBb@pengutronix.de>
References: <20260323201225.1836561-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323201225.1836561-1-github@szelinsky.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Hi Carlo,

Thank you for your work,

Can you please take a look at this automated review, there are some good
points:
https://sashiko.dev/#/patchset/20260323201225.1836561-1-github%40szelinsky.de

Best Regards,
Oleksij

On Mon, Mar 23, 2026 at 09:12:22PM +0100, Carlo Szelinsky wrote:
> This series adds poll-based event detection and LED trigger support
> to the PSE core subsystem.
> 
> Patches 1-2 introduce the poll path independently of LED support,
> so it can be tested in isolation on boards with and without IRQ
> configured.
> 
> Patch 3 adds LED triggers that hook into the shared event handling
> path introduced by patch 2.
> 
> Changes since v1:
> - Split single patch into 3 separate patches
> - Extracted pse_handle_events() and devm_pse_poll_helper() as a
>   standalone poll path (patches 1-2), testable without LED code
> - Added DT binding for poll-interval-ms as a separate patch
> - Renamed led-poll-interval-ms to poll-interval-ms for generic use
> - Fire LED triggers from the notification path rather than a
>   separate poll loop
> 
> Tested on Realtek RTL9303 with HS104 PoE chip, poll path only
> (without IRQ configured). Verified PD connect/disconnect notifications
> and LED trigger state changes. Testing with IRQ configured is still
> needed to verify the refactored pse_isr() path.
> 
> Link: https://lore.kernel.org/all/20260314235916.2391678-1-github@szelinsky.de/
> 
> Carlo Szelinsky (3):
>   dt-bindings: net: pse-pd: add poll-interval-ms property
>   net: pse-pd: add devm_pse_poll_helper()
>   net: pse-pd: add LED trigger support via notification path
> 
>  .../bindings/net/pse-pd/pse-controller.yaml   |   8 +
>  drivers/net/pse-pd/pse_core.c                 | 267 ++++++++++++++++--
>  include/linux/pse-pd/pse.h                    |  34 +++
>  3 files changed, 278 insertions(+), 31 deletions(-)
> 
> -- 
> 2.43.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
