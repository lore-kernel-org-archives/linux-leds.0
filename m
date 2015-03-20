From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/powernv: Add OPAL interfaces for accessing
 and modifying system LED states
Date: Fri, 20 Mar 2015 17:23:45 +1100
Message-ID: <1426832625.2581.3.camel@ellerman.id.au>
References: <20150308110558.3759.72635.stgit@localhost.localdomain>
	 <20150308111408.3759.70606.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49534 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750905AbbCTGXr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 20 Mar 2015 02:23:47 -0400
In-Reply-To: <20150308111408.3759.70606.stgit@localhost.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, khandual@linux.vnet.ibm.com, cooloney@gmail.com, rpurdie@rpsys.net, benh@kernel.crashing.org

On Sun, 2015-03-08 at 16:44 +0530, Vasant Hegde wrote:
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
> ---
>  arch/powerpc/include/asm/opal.h                |   19 +++++++++++++------

We've split opal.h in next.

Can you please rebase on top of it:

https://git.kernel.org/cgit/linux/kernel/git/mpe/linux.git/log/?h=next


cheers
