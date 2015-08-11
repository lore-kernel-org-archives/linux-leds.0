From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH/RFC v5 55/57] leds: sunfire: Use
 brightness_set_nonblocking op
Date: Tue, 11 Aug 2015 10:27:51 -0700 (PDT)
Message-ID: <20150811.102751.1983858965045028196.davem@davemloft.net>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
	<1439285890-27329-56-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:50379 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbbHKR1x (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Aug 2015 13:27:53 -0400
In-Reply-To: <1439285890-27329-56-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net

From: Jacek Anaszewski <j.anaszewski@samsung.com>
Date: Tue, 11 Aug 2015 11:38:08 +0200

> The driver neither sleeps nor uses delays in its brightness_set op.
> Use a new brightness_set_nonblocking op instead of brightness_set for
> setting brightness then.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Acked-by: David S. Miller <davem@davemloft.net>
