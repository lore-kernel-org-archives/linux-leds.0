From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [v10, 1/3] powerpc/powernv: Add OPAL interfaces for accessing and modifying system LED states
Date: Thu, 20 Aug 2015 18:38:13 +1000 (AEST)
Message-ID: <20150820083813.24B711402A2@ozlabs.org>
References: <1440002994-25662-2-git-send-email-hegdevasant@linux.vnet.ibm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60347 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751602AbbHTIiO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 20 Aug 2015 04:38:14 -0400
In-Reply-To: <1440002994-25662-2-git-send-email-hegdevasant@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, cooloney@gmail.com, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, rpurdie@rpsys.net, j.anaszewski@samsung.com, khandual@linux.vnet.ibm.com

On Wed, 2015-19-08 at 16:49:52 UTC, Vasant Hegde wrote:
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> 
> This patch registers the following two new OPAL interfaces calls
> for the platform LED subsystem. With the help of these new OPAL calls,
> the kernel will be able to get or set the state of various individual
> LEDs on the system at any given location code which is passed through
> the LED specific device tree nodes.
> 
> 	(1) OPAL_LEDS_GET_INDICATOR     opal_leds_get_ind
> 	(2) OPAL_LEDS_SET_INDICATOR     opal_leds_set_ind
> 
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>
> Tested-by: Stewart Smith <stewart@linux.vnet.ibm.com>
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8a8d91817aec6b9ca7a2

cheers
