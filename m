From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [v2] powerpc/configs: Enable LEDS support
Date: Fri, 28 Aug 2015 07:58:34 +1000 (AEST)
Message-ID: <20150827215834.3EF841401C7@ozlabs.org>
References: <1440655450-6831-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50582 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752252AbbH0V6f (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 27 Aug 2015 17:58:35 -0400
In-Reply-To: <1440655450-6831-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, Stewart Smith <stewart@linux.vnet.ibm.com>

On Thu, 2015-27-08 at 06:04:10 UTC, Vasant Hegde wrote:
> Commit 84ad6e5c added LEDS support for PowerNV platform. Lets
> update ppc64_defconfig to pick LEDS driver.
> 
> PowerNV LEDS driver looks for "/ibm,opal/leds" node in device
> tree and loads if this node exists. Hence added it as 'm'.
> 
> Also note that powernv LEDS driver needs NEW_LEDS and LEDS_CLASS
> as well. Hence added them to config file.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Cc: Stewart Smith <stewart@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d690740f22f6520873f96e66

cheers
