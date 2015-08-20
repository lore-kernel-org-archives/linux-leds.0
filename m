From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [v10,2/3] powerpc/powernv: Create LED platform device
Date: Thu, 20 Aug 2015 18:38:14 +1000 (AEST)
Message-ID: <20150820083814.92DC31402A9@ozlabs.org>
References: <1440002994-25662-3-git-send-email-hegdevasant@linux.vnet.ibm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38250 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751757AbbHTIiP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 20 Aug 2015 04:38:15 -0400
In-Reply-To: <1440002994-25662-3-git-send-email-hegdevasant@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, cooloney@gmail.com, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, rpurdie@rpsys.net, j.anaszewski@samsung.com, khandual@linux.vnet.ibm.com

On Wed, 2015-19-08 at 16:49:53 UTC, Vasant Hegde wrote:
> This patch adds platform devices for leds. Also export LED related
> OPAL API's so that led driver can use these APIs.
> 
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c159b5968ec9d3cbf168

cheers
