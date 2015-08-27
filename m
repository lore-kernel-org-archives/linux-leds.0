From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [v2] powerpc/configs: Enable LEDS support
Date: Thu, 27 Aug 2015 20:26:19 +1000 (AEST)
Message-ID: <20150827102619.BEB9214018C@ozlabs.org>
References: <1440655450-6831-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36376 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751633AbbH0K0U (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 27 Aug 2015 06:26:20 -0400
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
> ---
> Changes in v2:
>   - As suggested by Stewart updated patch description
> 
> Michael,
>   This is PowerNV specific config. Hence I've not updated pseries_defconfig.
>   Let me know if you want me to update pseries_defconfig config as well.

I've added it to pseries_defconfig also, no need to resend.

Currently pseries_defconfig is also used on powernv, though in the medium term
we should stop doing that.

cheers
