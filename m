From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/powernv: Add OPAL interfaces for accessing and modifying system LED states
Date: Thu, 19 Mar 2015 14:35:11 -0700
Message-ID: <m37fucpt68.fsf@oc8180480414.ibm.com>
References: <20150308110558.3759.72635.stgit@localhost.localdomain> <20150308111408.3759.70606.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:44851 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750940AbbCSVfX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 19 Mar 2015 17:35:23 -0400
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <stewart@linux.vnet.ibm.com>;
	Thu, 19 Mar 2015 15:35:22 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 01C41C40003
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2015 15:26:32 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t2JLZK1M47382710
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2015 14:35:20 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t2JLZJEl012287
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2015 15:35:20 -0600
In-Reply-To: <20150308111408.3759.70606.stgit@localhost.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Cc: cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
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

I also just merged the skiboot side of these calls.

Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Tested-by: Stewart Smith <stewart@linux.vnet.ibm.com>


(well, it boots, interacts with firmware. I didn't go and look at the
LEDs themselves).
